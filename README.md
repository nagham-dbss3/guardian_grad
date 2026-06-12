# رعاية بسمة — تطبيق الأهل · Basma Guardian App (Flutter)

A calm, supportive, **read-mostly** mobile app for the **parents / guardian (الأهل)**
of a child in treatment on the **Basma pediatric-oncology** platform.

It is **mobile-first, RTL Arabic, light-mode**, **offline-first**, and uses **mock
data only** (no backend). A parent can:

- Open the app to a calm **Home** with the child's name, the **check-in QR**
  (file number / رقم الإضبارة) + **token number** + **booking time** to show
  reception, and the **next-dose reminder**.
- Open the child's **saved record** (offline), **treatment journey**, **lab
  results** (incl. biopsy) with **PDF view/share**, **discharge reports** with
  **export/share**, and **appointments / dose schedule**.
- Receive **FCM push** for results/biopsies and **scheduled local reminders**
  for the next dose.

> Emotional context: these are parents of children undergoing cancer treatment.
> The UI is reassuring and hopeful, masks sensitive identifiers, and never
> surfaces distressing clinical internals (prognosis, life-status, death/follow-up).

---

## Run

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs   # freezed / json
flutter run
```

Demo login: any non-empty username/password works (pre-filled `family` / `123456`).
Biometric/PIN login is available where the device supports it.

Quality gates:

```bash
flutter analyze   # clean — "No issues found!"
flutter test
```

---

## Architecture (feature-first clean architecture)

```
lib/
  main.dart                 // bootstrap: cache + seed + guarded Firebase + notifications
  app.dart                  // MaterialApp.router, theme, RTL, ar localization, text-scale clamp
  core/
    theme/                  // app_colors, gradients, radii, text_styles, app_theme
    router/                 // app_router (go_router) + app_shell (bottom nav)
    services/               // local_cache (Hive), notification_service, fcm_service,
                            //   pdf_service, auth_service
    widgets/                // app_card, primary_button, section_header, status_chip,
                            //   empty_state, surface_background
    utils/                  // date_format_ar, masking
  models/                   // freezed + json_serializable view models (data dictionary)
  mock/                     // mock_data.dart — single seed source
  features/
    auth/ home/ checkin_qr/ child_record/ treatment_journey/ lab_results/
    discharge_reports/ appointments/ notifications/ profile/ shared/
```

- **State:** Riverpod (`Notifier` + granular `Provider`/`select`).
- **Routing:** go_router with a `StatefulShellRoute` for the 4 bottom-nav tabs and
  root-navigator routes for full-screen details. Notification taps deep-link.
- **Models:** immutable freezed + json_serializable (codegen via build_runner).

### Where mock data lives
`lib/mock/mock_data.dart` seeds one active child (يوسف) with a disease overview,
a multi-stage treatment plan, lab results (incl. one **biopsy** and one **unread**),
discharge reports with future `nextDoseDate`s, appointments, and an issued token —
plus a second child (لانا) to demo the **child switcher**, and a starter list of
notifications.

### Offline cache behavior
On first launch `GuardianRepository.ensureSeeded()` writes the seed into a **Hive**
box (`basma_cache`). Thereafter the app **always reads from Hive** (offline-first),
so the record and all related data are available without a connection. Models are
stored as JSON (json_serializable) rather than typed Hive adapters to keep the
dependency graph light. Screens show an **"آخر تحديث…"** timestamp where relevant.
The only writes are local preferences, notification read-state, active child, and
the demo "result arrived" simulation.

---

## Notifications

`NotificationService` (a façade) wraps **FCM** (`FcmService`) and
**flutter_local_notifications** + **timezone**.

### Dose reminders (local, scheduled)
For the **latest discharge report's `nextDoseDate`**, two reminders are scheduled:
a **day-before** (7pm) and **morning-of** (8am). They are rescheduled on launch and
whenever the active child changes or the preference toggle flips, and respect the
**"تذكيرات الجرعات"** switch in Profile.

> Timezone: the device zone is approximated from the current UTC offset
> (`NotificationService._setLocalTimezone`). For exact DST-aware scheduling, add
> the `flutter_timezone` package and set `tz.setLocalLocation` from it.

### Results / biopsy arrived (push)
Sent via **FCM** in production. FCM init is **guarded** — without
`google-services.json` / `GoogleService-Info.plist` the app runs in **mock mode**
with push disabled (logged, not crashed). Foreground messages are rendered through
local notifications; taps **deep-link** to `/results/:id`.

**Demo without a backend:** Profile → "محاكاة: نتيجة جديدة وصلت" marks a new unread
result, adds a notification, and fires a local notification that deep-links to the
result — exercising the full results-notification flow.

### Enable real push
1. Create a Firebase project; add Android/iOS apps.
2. Drop `google-services.json` into `android/app/` and
   `GoogleService-Info.plist` into `ios/Runner/`.
3. Add the Google Services Gradle plugin (Android) / configure on iOS.
4. In production, a Cloud Function / backend sends an FCM message (with a
   `deepLink` data field) when a lab uploads a result.

---

## Design system

Implements the Basma tokens (light mode only): colors, the **Brand/Sun/Hope/Care**
gradients, radius scale (base 16), the soft **Surface** background with gentle blue
(top-start) + yellow (top-end) glows, and **Tajawal** typography (via google_fonts).
See `lib/core/theme/`.

---

## Screen index

| Route | Screen |
|---|---|
| `/login` | Login (username/password + biometric) |
| `/` | Home — greeting, **check-in QR card**, next-dose, journey strip, quick grid, updates |
| `/qr` | Full-screen check-in QR (boosts brightness; token + time) |
| `/record` | Child medical record (read-only, masked, offline) |
| `/journey` | Treatment plan / journey (hopeful timeline) |
| `/results` · `/results/:id` | Lab results list · detail (PDF view/share) |
| `/discharge` · `/discharge/:id` | Discharge reports list · detail (export/share) |
| `/appointments` | Appointments + dose schedule |
| `/notifications` | Notifications (deep-linking) |
| `/profile` | Guardian profile, child switcher, prefs, security, language, logout, demo trigger |

---

## Non-goals
No backend/API/auth server (mock login + mock data + guarded Firebase). Read-only:
parents do not edit clinical data; no delete anywhere — the only writes are local
preferences/cache. No distressing clinical internals. Guardian role only. No dark mode.
