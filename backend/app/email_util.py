import logging
import smtplib
import socket
import ssl
from email.mime.text import MIMEText

import httpx

from app.config import settings

log = logging.getLogger(__name__)

# Стабильное имя в EHLO: у контейнеров getfqdn() бывает странным, часть серверов рвёт сессию.
_EHLO_NAME = "localhost"
# Дольше таймаут: SSL handshake к Gmail из Docker иногда упирается в 30s.
_SMTP_TIMEOUT_SEC = 60


def _connect_tcp(
    host: str,
    port: int,
    timeout: float,
    source_address: tuple[str, int] | None,
) -> socket.socket:
    infos = socket.getaddrinfo(host, port, type=socket.SOCK_STREAM)
    # Сначала IPv4 — в Docker маршрут по IPv6 к smtp.gmail.com часто даёт «Connection unexpectedly closed».
    infos.sort(key=lambda i: (i[0] != socket.AF_INET, i[4]))
    last_exc: OSError | None = None
    for _fam, _stype, _proto, _canon, sa in infos:
        sock: socket.socket | None = None
        try:
            sock = socket.socket(_fam, _stype, _proto)
            sock.settimeout(timeout)
            if source_address is not None:
                sock.bind(source_address)
            sock.connect(sa)
            return sock
        except OSError as e:
            last_exc = e
            if sock is not None:
                sock.close()
            continue
    if last_exc:
        raise last_exc
    raise OSError(f"No routable address for {host}:{port}")


class _SMTPPreferIPv4(smtplib.SMTP):
    def _get_socket(self, host, port, timeout):
        return _connect_tcp(host, int(port), timeout, self.source_address)


class _SMTPSSLPreferIPv4(smtplib.SMTP_SSL):
    def _get_socket(self, host, port, timeout):
        raw = _connect_tcp(host, int(port), timeout, self.source_address)
        return self.context.wrap_socket(raw, server_hostname=host)


def _login_and_sendmail(server: smtplib.SMTP, msg: MIMEText, to_email: str) -> None:
    if settings.smtp_user:
        server.login(settings.smtp_user, settings.smtp_password)
    server.sendmail(settings.smtp_from, [to_email], msg.as_string())


def _send_smtp_ssl_implicit(msg: MIMEText, to_email: str, port: int) -> None:
    ctx = ssl.create_default_context()
    with _SMTPSSLPreferIPv4(
        settings.smtp_host,
        port,
        local_hostname=_EHLO_NAME,
        context=ctx,
        timeout=_SMTP_TIMEOUT_SEC,
    ) as server:
        _login_and_sendmail(server, msg, to_email)


def _send_smtp_starttls(msg: MIMEText, to_email: str, port: int) -> None:
    with _SMTPPreferIPv4(
        settings.smtp_host,
        port,
        local_hostname=_EHLO_NAME,
        timeout=_SMTP_TIMEOUT_SEC,
    ) as server:
        if settings.smtp_user:
            server.ehlo(_EHLO_NAME)
            server.starttls(context=ssl.create_default_context())
            server.ehlo(_EHLO_NAME)
        _login_and_sendmail(server, msg, to_email)


def _try_resend_https(subject: str, body: str, to_email: str) -> bool:
    if not settings.resend_api_key:
        return False
    try:
        r = httpx.post(
            "https://api.resend.com/emails",
            headers={
                "Authorization": f"Bearer {settings.resend_api_key}",
                "Content-Type": "application/json",
            },
            json={
                "from": settings.smtp_from,
                "to": [to_email],
                "subject": subject,
                "text": body,
            },
            timeout=30.0,
        )
        r.raise_for_status()
        return True
    except Exception as e:
        log.warning("Resend API failed (%s), falling back to SMTP", e)
        return False


def _send_plain_email(subject: str, body: str, to_email: str) -> None:
    if not settings.smtp_host and not settings.resend_api_key:
        log.info("SMTP not configured; to=%s subject=%s body=%s", to_email, subject, body)
        return
    if _try_resend_https(subject, body, to_email):
        return
    if not settings.smtp_host:
        log.info("No SMTP host after Resend failure; to=%s subject=%s", to_email, subject)
        return
    msg = MIMEText(body, "plain", "utf-8")
    msg["Subject"] = subject
    msg["From"] = settings.smtp_from
    msg["To"] = to_email

    port = settings.smtp_port
    if port == 465:
        try:
            _send_smtp_ssl_implicit(msg, to_email, 465)
            return
        except (TimeoutError, ssl.SSLError, OSError) as e:
            log.warning("SMTP SSL on port 465 failed (%s); retrying STARTTLS on 587", e)
            _send_smtp_starttls(msg, to_email, 587)
            return

    if port == 587:
        _send_smtp_starttls(msg, to_email, 587)
        return

    with _SMTPPreferIPv4(
        settings.smtp_host,
        port,
        local_hostname=_EHLO_NAME,
        timeout=_SMTP_TIMEOUT_SEC,
    ) as server:
        if settings.smtp_user:
            server.ehlo(_EHLO_NAME)
            server.starttls(context=ssl.create_default_context())
            server.ehlo(_EHLO_NAME)
        _login_and_sendmail(server, msg, to_email)


def send_registration_code_email(to_email: str, code: str) -> None:
    body = (
        "Вы регистрируетесь в HabitFlow.\n\n"
        f"Код подтверждения: {code}\n\n"
        "Код действует 15 минут. Если это не вы, проигнорируйте письмо."
    )
    _send_plain_email("Код подтверждения HabitFlow", body, to_email)


def send_verification_email(to_email: str, token: str) -> None:
    link = f"{settings.frontend_origin}/auth?verify={token}"
    body = f"Подтвердите новый email в HabitFlow: {link}"
    _send_plain_email("Подтвердите email в HabitFlow", body, to_email)
