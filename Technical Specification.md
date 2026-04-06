## Technical Specification for HabitFlow MVP (Code-First Track)

### 1. Project Overview
**Product:** HabitFlow – a web application for habit tracking with a “no-violence” philosophy (micro-steps, adaptive reminders, supportive messages).  
**Goal:** Build a functional MVP with key screens, form submission, data persistence, and navigation, ready for future integrations (CRM, BPMS, Telegram bot).  
**Stack:** FastAPI (backend), Vue 3 (frontend), SQLAlchemy (ORM), Pydantic (validation), Alembic (migrations), PostgreSQL (database), JWT (authentication).  
**Deployment:** A Russian‑accessible hosting service (e.g., Timeweb Cloud, Beget, Selectel, or any VPS with Docker).  

### 2. Functional Requirements (MVP)

#### 2.1. User Roles & Authentication
- **Guest** – can view landing page only.
- **User** – registered and authenticated; can manage own habits, logs, settings.
- **Admin** – can manage messages, users (block/unblock), view all data (future scope, not required for MVP but roles defined for DB).

**Authentication methods:**
- Email + password (with email verification).
- OAuth via Yandex and VK (no extra permissions, only basic profile info: name, email, avatar URL).

**Session management:** JWT tokens (access + refresh). Tokens stored in `httpOnly` cookies (or localStorage for simplicity – but better cookies for security).

#### 2.2. Pages and Navigation (minimum 3 screens, but all listed below will be implemented)

| Page | Route | Description | Components (no styling, only HTML skeleton) |
|------|-------|-------------|----------------------------------------------|
| Landing | `/` | Public homepage explaining philosophy, micro‑steps, and call‑to‑action to register/login. | Hero section, "How it works" cards, blog teaser (static), register/login buttons. |
| Register/Login | `/auth` | Forms for email registration, email+password login, and buttons for OAuth (Yandex, VK). After email registration, a verification email is sent. | Tabs: Login / Register. Inputs: email, password, name (for register). OAuth icons. |
| Main Dashboard | `/habits` | List of today’s habits (current date only). Each habit card shows title, main goal, a button to mark as completed (full or micro‑step if enabled). If not completed by deadline, show a micro‑step suggestion (if micro‑step exists). | HabitCard component: title, goal, status (completed/missed), "Done" button, "Micro‑step" button (appears when habit not completed and micro‑step defined). |
| Create / Edit Habit | `/habits/new` and `/habits/:id/edit` | Form to create or edit a habit. Fields: title (required), main goal (required), micro‑step (optional), repetition interval (Google‑like recurrence picker), adaptive reminder flag, deadline type (exact time or vague time slot). | Form fields, recurrence picker (reuse open‑source component), time picker, checkbox for adaptive reminder, submit button. |
| Habit Dashboard | `/habits/:id` | Detailed view of a single habit: streak, completion percentage, micro‑step usage, interactive calendar (month view) showing status per day (full/micro/missed). Delete button with confirmation, edit button (redirects to edit page). | Stats cards, custom calendar component (open‑source), delete confirmation modal. |
| Calendar Progress | `/calendar` | Monthly calendar (like GitHub contribution graph but month‑wise) showing aggregated progress: for each day, a coloured square (5‑level gradient: bright green = all habits done, dark green = most done, … grey = none). Click on a day opens a minimal modal listing habits and their statuses for that day. | Calendar grid (month view), colour legend, modal for day details. |
| Profile / Settings | `/profile` | User info (name, email, avatar from OAuth). Settings: global notifications toggle, reminder tone (soft/neutral). Password change form (if email/password user). Placeholder fields for CRM integration (external_id, crm_synced – stored in DB but not displayed). | UserInfo card, toggle switch, select dropdown, password change form. |

#### 2.3. Core Business Logic

##### 2.3.1. Habit Execution Deadlines
- **Exact time interval:** e.g., "make bed from 7:00 to 7:30". If user marks as completed after the end time, it's considered **missed** (unless micro‑step is used later – but micro‑step should be offered only before the deadline? We define: micro‑step can be offered after the deadline but still counts as a "micro" completion for that day).
- **Vague time slots:** "morning" (6:00–12:00), "afternoon" (12:00–18:00), "evening" (18:00–23:00), "night" (23:00–6:00). The interface shows the slot name; the system uses the corresponding time window to determine missed status. If user marks after the slot, it's missed.

Implementation: store `deadline_type` (exact | slot) and `deadline_value` (time string or slot enum). For exact, compare current time; for slot, compare current hour.

##### 2.3.2. Micro‑step Suggestion
- If a habit has a `micro_step` text and the user has not marked the habit as completed (full or micro) by the end of the deadline window, the system can suggest the micro‑step. The user can click "Micro‑step" button, which creates a `HabitLog` with status `micro` for that day. This action does not count as full completion but keeps streak alive (streak counts both full and micro).

##### 2.3.3. Streak and Free Plan Limits
- **Free plan:** maximum 5 active habits at any time. Backend rejects creation of new habit if user already has 5 active habits.
- **Streak:** consecutive days where the habit was either completed fully or via micro‑step. Missed days break the streak.

##### 2.3.4. Adaptive Reminder
- Simple boolean flag. When true, the backend will attempt to shift reminder time based on user's past completion times (not required for MVP – just a flag; actual logic can be implemented later).

### 3. Data Models (based on PR‑03)

All models defined in SQLAlchemy with PostgreSQL.

| Table | Fields (simplified, see PR‑03 for full) | Notes |
|-------|------------------------------------------|-------|
| `users` | id (UUID, PK), email (unique), password_hash (nullable for OAuth), name, avatar_url, is_active, created_at, updated_at, external_id (for CRM), crm_synced (bool) | OAuth users have password_hash NULL |
| `habits` | id, user_id (FK), title, main_goal, micro_step (nullable), reminder_time (time, nullable), adaptive_reminder (bool), recurrence_rule (JSON, e.g., `{"type":"weekly","days":[1,3,5]}` or `{"type":"daily"}`), deadline_type (enum: exact, slot), deadline_value (string: "07:00:00" or "morning"), created_at, updated_at | recurrence_rule follows Google‑like structure; we'll use a simple JSON representation. |
| `habit_logs` | id, habit_id (FK), date (date), status (enum: full, micro, missed), notes (text), created_at | One record per habit per day (upsert). |
| `messages` | id, text, category, tone, trigger_condition (JSON), created_at | For admin; MVP can pre‑seed a few messages. |
| `notification_settings` | user_id (PK, FK), global_enabled, quiet_hours_start, quiet_hours_end, reminder_tone (enum: soft, neutral), micro_step_frequency (not used in MVP but stored) | One‑to‑one with user. |
| `user_subscriptions` | user_id (PK, FK), plan (free/premium), start_date, end_date, auto_renew | Free plan by default. |

**Relationships:** as per PR‑03 ER diagram.

### 4. API Endpoints (REST, JWT‑protected except public)

Base URL: `/api/v1`

| Method | Endpoint | Description | Request Body (JSON) | Response | Roles |
|--------|----------|-------------|--------------------|----------|-------|
| POST | `/auth/register` | Register with email/password | `{email, password, name}` | `{user_id, message: "verify email"}` | guest |
| POST | `/auth/login` | Email/password login | `{email, password}` | `{access_token, refresh_token}` | guest |
| GET | `/auth/oauth/{provider}` | Redirect to OAuth (Yandex/VK) | – | redirect | guest |
| GET | `/auth/oauth/callback` | OAuth callback | – | `{access_token, refresh_token}` | guest |
| POST | `/auth/verify-email` | Verify email token | `{token}` | `{message}` | guest |
| POST | `/auth/refresh` | Refresh token | `{refresh_token}` | `{access_token}` | user |
| POST | `/auth/logout` | Logout | – | – | user |
| GET | `/habits` | List user's habits (all, not filtered by day) | – | `[HabitSchema]` | user |
| POST | `/habits` | Create habit | `{title, main_goal, micro_step?, reminder_time?, adaptive_reminder, recurrence_rule, deadline_type, deadline_value}` | `HabitSchema` | user |
| GET | `/habits/{id}` | Get single habit | – | `HabitSchema` | user (owner) |
| PUT | `/habits/{id}` | Update habit | same as create | `HabitSchema` | user (owner) |
| DELETE | `/habits/{id}` | Delete habit | – | `{success}` | user (owner) |
| GET | `/habits/{id}/logs` | Get logs for a habit (date range via query) | query: `?from=YYYY-MM-DD&to=YYYY-MM-DD` | `[HabitLogSchema]` | user (owner) |
| POST | `/habits/{id}/logs` | Mark habit for today (or specific date) | `{status: "full"|"micro", date?: YYYY-MM-DD}` | `HabitLogSchema` | user (owner) |
| GET | `/calendar` | Get aggregated progress for a month | query: `?year=2026&month=4` | `{days: [{date, intensity: 0-4}]}` | user |
| GET | `/profile` | Get user profile and settings | – | `{user: UserSchema, settings: NotificationSettingsSchema}` | user |
| PUT | `/profile` | Update profile | `{name, email? (requires re-verify)}` | `UserSchema` | user |
| PUT | `/profile/settings` | Update notification settings | `{global_enabled, quiet_hours_start, quiet_hours_end, reminder_tone}` | `NotificationSettingsSchema` | user |
| POST | `/profile/change-password` | Change password (only for email‑password users) | `{old_password, new_password}` | `{message}` | user |

All list endpoints support pagination (limit/offset) and filtering where needed.

### 5. Frontend Components (Vue 3)

#### 5.1. Layout Components
- `AppHeader` – navigation links (Home, Habits, Calendar, Profile, Logout).
- `AppFooter` – simple links.
- `AuthGuard` – wrapper for protected routes.

#### 5.2. Page Components (view level)
- `LandingPage.vue`
- `AuthPage.vue` (handles both login and register via tabs)
- `HabitsIndex.vue` (main dashboard for today)
- `HabitForm.vue` (create/edit)
- `HabitShow.vue` (dashboard for a single habit)
- `CalendarPage.vue` (monthly progress)
- `ProfilePage.vue`

#### 5.3. Reusable UI Components
- `HabitCard.vue` – displays a single habit for today with status and action buttons.
- `RecurrencePicker.vue` – reusable component for defining repetition (daily, weekly on selected days, etc.) – use an open‑source library or implement simple dropdown + multi‑select for days.
- `TimeSlotPicker.vue` – for deadline: either exact time (time input) or vague slot (select: morning/afternoon/evening/night).
- `CustomCalendar.vue` – month calendar with customisable day rendering (used in HabitShow and CalendarPage). Use a library like `v-calendar` or `@fullcalendar/vue3`.
- `ColorIntensitySquare.vue` – for calendar progress (5‑colour scale).
- `DayDetailsModal.vue` – shows habit statuses for a clicked day.

All components must have no inline styles (only semantic HTML and classes that can be later styled). Use BEM or simple class names.

### 6. Business Rules Implementation (Backend)

- **Free plan limit:** when creating a habit, count active habits (not deleted). If `count >= 5` and user's subscription is `free`, return 403 with message "Upgrade to premium to add more habits".
- **Deadline check:** When user tries to mark a habit as full or micro, validate that the current time is within the allowed deadline window. If not, reject with error "Deadline passed" (but micro‑step might be allowed even after deadline? We decide: micro‑step can be allowed up to 23:59 of the day, regardless of deadline. Full completion only within window). Clarify: for exact window, full completion allowed only inside interval; for slots, full completion allowed only inside that slot. Micro‑step can be marked anytime until 23:59.
- **Recurrence generation:** At midnight, a background job (or cron) creates `HabitLog` entries for the new day (status `null` initially, or missing means not completed). For MVP, we can compute logs on the fly when querying (i.e., generate missing days in memory). Simpler: when requesting today’s habits, backend returns habits that are active for today based on recurrence rule. No need to pre‑create logs.
- **Streak calculation:** Compute by counting consecutive days with status `full` or `micro` ending at today (or a given date). Backend provides a helper endpoint or compute in dashboard.

### 7. Integration Points for Future PRs

- **CRM (PR‑05):** Reserve fields `external_id` and `crm_synced` in `users` table. Backend will send webhook on user creation and subscription change.
- **BPMS (PR‑06):** Backend will send events (e.g., habit missed 3 days in a row) to BPMS.
- **Telegram Bot (PR‑07):** Bot will use the same REST API; ensure all endpoints are stateless and accept JWT.

### 8. Database Migrations (Alembic)

- Initial migration creates all tables with relationships.
- Subsequent migrations for any changes.

### 9. Deployment (Russian‑accessible hosting)

- Use Docker + Docker Compose for local development and production.
- Services: PostgreSQL, FastAPI (uvicorn), Nginx (optional for static files).
- Hosting options: Timeweb Cloud, Beget VPS, Selectel, or any VPS with Ubuntu. Provide `docker-compose.yml` and a `deploy.sh` script for quick setup.
- Environment variables: DB credentials, JWT secret, OAuth client IDs/secrets (Yandex, VK), email SMTP settings.

### 10. Non‑Functional Requirements

- **Performance:** API responses < 200ms for typical requests.
- **Security:** Passwords hashed with bcrypt; JWT with short expiration (15 min) + refresh token (7 days); HTTPS enforced.
- **Testing:** Basic unit tests for habit deadline logic and streak calculation (optional for MVP but recommended).
- **Logging:** Request logging and error handling.

### 11. Development Phases (Suggested)

1. Set up FastAPI project with SQLAlchemy, Pydantic, Alembic, JWT auth, OAuth integration.
2. Implement user registration, login, email verification, OAuth (Yandex, VK).
3. Build habit CRUD API with recurrence, deadline types, and free plan limit.
4. Implement habit marking API with deadline validation and micro‑step logic.
5. Create Vue 3 project, routing, store (Pinia), API client.
6. Implement all pages (skeleton HTML) with basic functionality.
7. Add calendar aggregation and custom calendar components.
8. Write Dockerfile and docker-compose for deployment.
9. Deploy to Russian hosting, test end‑to‑end.

### 12. Deliverables for PR‑04

- Public URL of working web application.
- GitHub repository link with full code.
- Screenshots of all implemented pages.
- Table mapping wireframes (PR‑02) to implemented screens.
- Table mapping data attributes (PR‑03) to form fields and DB columns.
- Test data: at least 3 habits, 3 days of logs, 3 user accounts.
- This technical specification document.

---

**Prepared by:** AI Assistant  
**Date:** 2026-04-05  
**Version:** 1.0