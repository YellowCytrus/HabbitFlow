# pgAdmin для преподавателя (только чтение БД)

Преподаватель заходит в **pgAdmin** (веб-интерфейс), подключается к PostgreSQL пользователем **`teacher_readonly`**, который может только **смотреть** данные (SELECT), без INSERT/UPDATE/DELETE.

## 1. Что сделать тебе на сервере (один раз)

В **корневой** `.env` добавь:

```env
# Пароль пользователя БД «только чтение» (передай преподавателю отдельным каналом)
TEACHER_DB_PASSWORD=сложный_уникальный_пароль

# Логин в сам pgAdmin (не путать с БД)
PGADMIN_DEFAULT_EMAIL=teacher@твой-вуз.ru
PGADMIN_DEFAULT_PASSWORD=другой_сложный_пароль
```

Создай пользователя только на чтение (нужен запущенный `api`):

```bash
cd /path/to/HabitFlow
chmod +x scripts/create_teacher_readonly.sh
./scripts/create_teacher_readonly.sh
```

Убедись, что **`PGADMIN_DEFAULT_PASSWORD`** в `.env` не пустой (пароль входа в веб-интерфейс pgAdmin).

Подними pgAdmin:

```bash
docker compose --profile pgadmin up -d pgadmin
```

По умолчанию pgAdmin слушает **`127.0.0.1:5050`** на VPS — с интернета не открыт.

### Как дать доступ преподавателю с его компьютера

**Вариант A (рекомендуется): SSH-туннель**

Преподаватель выполняет (подставь свой логин и IP сервера):

```bash
ssh -L 5050:127.0.0.1:5050 твой_user@IP_СЕРВЕРА
```

Пока сессия SSH открыта, у него в браузере: **http://localhost:5050**

**Вариант B:** временно пробросить порт наружу (менее безопасно) — в `docker-compose.yml` у сервиса `pgadmin` замени `127.0.0.1:5050:80` на `5050:80` и открой порт в UFW только для IP преподавателя или закрой после проверки.

---

## 2. Инструкция для преподавателя

### Шаг 1. Открыть pgAdmin

- Если используется туннель: в браузере открой **http://localhost:5050**
- Если тебе дали прямой URL — открой его (например `http://IP:5050`)

### Шаг 2. Войти в pgAdmin

Используй **логин и пароль от pgAdmin**, которые тебе передали отдельно (это **не** пароль от базы):

- **Email address:** `PGADMIN_DEFAULT_EMAIL` (тот, что задал студент)
- **Password:** `PGADMIN_DEFAULT_PASSWORD`

### Шаг 3. Подключить сервер PostgreSQL

1. Правый клик **Servers** → **Register** → **Server…**
2. Вкладка **General**  
   - **Name:** любое, например `HabitFlow (read-only)`
3. Вкладка **Connection**  
   Подключение к Postgres идёт **из контейнера pgAdmin** (не из твоего браузера), поэтому хост — имя сервиса Docker:

| Поле | Значение |
|------|----------|
| **Host name/address** | `db` |
| **Port** | `5432` |
| **Maintenance database** | `habitflow` (или то имя БД, что сказал студент) |
| **Username** | `teacher_readonly` |
| **Password** | пароль, который студент передал отдельно (он задаётся как `TEACHER_DB_PASSWORD` на сервере) |

Включи **Save password**, если не хочешь вводить каждый раз.

4. **Save**

### Шаг 4. Смотреть данные

Слева: **Servers → HabitFlow → Databases → habitflow → Schemas → public → Tables**.  
Правый клик по таблице → **View/Edit Data** → **All Rows** (или **First 100 Rows**).

Пользователь `teacher_readonly` **не сможет** менять или удалять строки — только просмотр.

---

## Остановить pgAdmin после проверки

```bash
docker compose --profile pgadmin stop pgadmin
```

Полностью убрать контейнер (данные pgAdmin в volume останутся):

```bash
docker compose --profile pgadmin down
```

---

## Сменить пароли позже

1. **БД:** обнови `TEACHER_DB_PASSWORD` в `.env`, снова запусти `./scripts/create_teacher_readonly.sh`
2. **Вход в pgAdmin:** новый `PGADMIN_DEFAULT_PASSWORD` в `.env`, затем  
   `docker compose --profile pgadmin up -d --force-recreate pgadmin`

---

## Пароли со спецсимволами

В `TEACHER_DB_PASSWORD` лучше избегать символов `'`, `"`, `$`, `` ` `` — они могут мешать в shell. Для `PGADMIN_DEFAULT_PASSWORD` то же самое.
