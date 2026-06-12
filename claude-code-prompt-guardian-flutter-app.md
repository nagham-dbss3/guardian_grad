# Claude Code Prompt — Parents / Guardian App (الأهل) · Flutter (Pediatric Oncology Platform · Basma)

> Paste everything below into Claude Code. It is written to be executed end-to-end: it contains the Flutter architecture, the design-system implementation, the full screen inventory, a per-screen data dictionary, notification wiring, performance rules, UX guidance, and acceptance criteria. It mirrors the Doctor/Nurse/Reception/Admin/Lab prompts so the whole platform stays consistent — but **this app is built in Flutter (Dart), not React.**
>
> **Role:** this is the **Parents / Guardian (الأهل)** mobile app — a calm, supportive, read-mostly app that lets a parent stay informed about their child's care, check in at reception via a QR, and get gentle reminders for the next dose and incoming results.

---

## 0. Your mission

Build the **Parents / Guardian Flutter app** for the Basma pediatric-oncology platform. It is a **mobile-first, RTL Arabic, light-mode** app with **mock data only** (no backend — stub all data in `lib/.../data/mock` and persist locally so the record is available offline). Wire **Firebase Cloud Messaging (FCM)** for push and **local scheduled notifications** for dose reminders.

Act as a **senior product designer + Flutter engineer**: design for **non-technical, emotionally-stressed parents** who need an extremely **simple, clear, warm** experience, and build a **clean, performant** Flutter codebase.

**Remember the emotional context:** these are parents of children undergoing cancer treatment. The app must be **reassuring, hopeful, and never alarming**. Show supportive, parent-appropriate information; **mask sensitive identifiers** and **never surface distressing clinical internals** (prognosis, life-status/mortality, death/follow-up fields). Frame everything with care.

**Must-have behaviors (do not forget):**
1. **Check-in card on Home:** the parent opens the app and sees a **QR code** (encoding the child's file number / رقم الإضبارة) plus their **token number** and **booking/arrival time**, so they can **show it to reception** to check in (reception scans the QR — this is the parent side of the reception scan flow).
2. **The child's record and all related data are saved and available** (read-only, cached **offline**): demographics (masked), disease overview summary, treatment plan/journey, lab results, discharge reports, appointments.
3. **Dose reminder via Firebase notification** — remind the parent of the **next dose** ("لديكم جرعة غدًا…") based on the **doctor's discharge report** (`nextDoseDate`) that was set for them.
4. **Notifications when lab results / biopsies arrive from the lab.**

**Definition of "done" up front:** a parent can log in → see a calm Home with their child's name, the **QR + token + time** to show reception, and the **next-dose reminder** → open the child's saved record, treatment journey, lab results, and discharge reports (view + share) → and receive **FCM push** for results and **scheduled reminders** for the next dose — all in simple Arabic, fast and offline-friendly.

---

## 1. The user (design for them)

**Persona — Um Yousef, mother of a child in treatment, 30s–40s.** **Low digital familiarity**, often anxious, may be checking the app between hospital visits or at home, sometimes on an older phone with patchy connectivity. She needs to know two things fast: **"when is the next dose / appointment?"** and **"are the results in?"** — and to **show something at reception** to check in.

**Jobs-to-be-done:**
1. "Show reception my child's code so we get checked in."
2. "When is our next dose / appointment?"
3. "Did the lab results come?"
4. "What did the doctor say to do next?" (discharge instructions).
5. "See my child's record and journey, even offline."

**Design consequences (non-negotiable):**
- **Radical simplicity & warmth.** Few items, big legible Arabic (Tajawal), large tap targets, plain language, soft rounded surfaces, generous spacing, gentle color. One clear thing to look at per screen.
- **Read-only & least-privilege.** Parents view; they don't edit clinical data. They see a **disease overview summary** (not raw clinical documentation), masked identifiers, and **no distressing internals**.
- **Offline-first.** The child's record and key data are cached locally so the app is useful without a connection.
- **Reassuring tone.** Hopeful microcopy, a supportive treatment-journey visual, calm empty states. Never alarmist.
- **The QR check-in card is always one tap away** from Home.

---

## 2. Tech stack, architecture & setup (Flutter — performance-first)

- **Flutter (stable) + Dart**, null-safety, **light mode only**, **RTL Arabic** (`Locale('ar')`, `Directionality.rtl` via `MaterialApp` localization).
- **State management:** **Riverpod** (`flutter_riverpod`) — granular providers, `AsyncNotifier`/`Notifier`, `ref.watch(select)` to minimize rebuilds.
- **Routing:** **go_router** (declarative, deep-linkable for notification taps).
- **Models:** immutable, with **freezed** + **json_serializable** (codegen via build_runner).
- **Local persistence / offline cache:** **Hive** (lightweight) — cache the child's record and related data so it's available offline. (Isar is an acceptable higher-performance alternative.)
- **Notifications:** **firebase_core** + **firebase_messaging** (FCM push) and **flutter_local_notifications** + **timezone** (scheduled dose reminders). See §9.
- **QR:** **qr_flutter** (generate the check-in QR from the file number).
- **PDF:** view results/discharge reports (e.g., **syncfusion_flutter_pdfviewer** or **pdfx**) and **share_plus** + **path_provider** to export/share.
- **Images:** **cached_network_image**. **Fonts:** **google_fonts** (Tajawal) or bundle Tajawal in `assets/fonts`.
- **No backend.** Mock all data; guard Firebase init so the app runs even without Firebase config (dev/mock). Provide a mock trigger to simulate "results arrived".

### 2.1 Recommended project structure (feature-first clean architecture)
```
lib/
  main.dart
  app.dart                      // MaterialApp.router, theme, localization, RTL
  core/
    theme/        (app_colors.dart, app_theme.dart, gradients.dart, radii.dart, text_styles.dart)
    router/       (app_router.dart)            // go_router + notification deep links
    services/     (notification_service.dart, fcm_service.dart, local_cache.dart, pdf_service.dart, auth_service.dart)
    widgets/      (app_card.dart, primary_button.dart, section_header.dart, status_chip.dart, empty_state.dart)
    utils/        (date_format_ar.dart, masking.dart)
  features/
    auth/         (presentation / domain / data)
    home/         (presentation / domain / data)
    checkin_qr/
    child_record/
    treatment_journey/
    lab_results/
    discharge_reports/
    appointments/
    notifications/
    profile/
  models/         (shared freezed models — mirror the platform contract; see §7)
  mock/           (mock data sources)
```
- **Each feature** has `presentation` (screens + widgets + Riverpod providers), `domain` (entities/use-cases), `data` (repository + mock/cache source).
- Repositories read from Hive cache first, then mock source (offline-first), and expose immutable models via providers.

### 2.2 Responsiveness & devices
- **Phones first** (primary). Support a range of sizes; use `MediaQuery`/`LayoutBuilder` and flexible widgets; respect **text scaling** (don't fix font sizes so accessibility scaling works). Provide a sensible **tablet** layout (wider padding / two-column where natural). Test at small (~360×640), standard (~390×844), and tablet (~800 wide).

---

## 3. Design system — implement exactly (Flutter mapping)

**Light mode only.** Translate the platform tokens into a Flutter theme. Source-of-truth hex below (the platform's oklch values convert to these).

### 3.1 Colors (`core/theme/app_colors.dart`)
```dart
import 'package:flutter/material.dart';
class AppColors {
  static const background        = Color(0xFFF9FDFF);
  static const foreground        = Color(0xFF112438);
  static const card              = Color(0xFFFFFFFF);
  static const primary           = Color(0xFF008FD2); // blue — trust/care, main actions
  static const primarySoft       = Color(0xFFDFF1FF);
  static const secondary         = Color(0xFF51C672); // green — hope/healing/progress
  static const secondarySoft     = Color(0xFFD8F9DD);
  static const accent            = Color(0xFFB25EC5); // purple — compassion/comfort, tags
  static const accentSoft        = Color(0xFFFBE7FF);
  static const highlight         = Color(0xFFFACB39); // yellow — warmth/joy, celebratory
  static const highlightSoft     = Color(0xFFFFF6D1);
  static const muted             = Color(0xFFEDF5FB);
  static const mutedForeground   = Color(0xFF5C6B7A);
  static const destructive       = Color(0xFFEE343B);
  static const success           = Color(0xFF2BBB71);
  static const warning           = Color(0xFFF7B83D);
  static const border            = Color(0xFFDCE6EE);
}
```
**Semantics:** blue = trust/care/main actions & headings; green = hope/healing/progress/positive; purple = compassion/comfort tags & accents; yellow = warmth/celebratory moments; red = critical only (rare here). Keep this app especially **soft and warm** — lean on green (hope) and the Care/Hope gradients.

### 3.2 Gradients (`core/theme/gradients.dart`) — use tastefully for hero/celebration
- **Brand** 135° `#008FD2 → #B25EC5 → #51C672`
- **Sun** 135° `#FACB39 → #F5C06A`
- **Hope** 135° `#51C672 → #008FD2`
- **Care** 135° `#B25EC5 → #008FD2`
Implement as `LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [...])` (RTL-aware). Home hero may use **Hope** or **Care** softly; celebratory moments use **Sun**.

### 3.3 Surface background
Page background = soft **Surface**: `#F9FDFF` with a very subtle **blue radial glow (top-start)** + **yellow radial glow (top-end)** behind content (a light `RadialGradient`/decoration). Keep it gentle.

### 3.4 Typography (`core/theme/text_styles.dart`)
- **Arabic is primary** → use **Tajawal** (400, 500, 700) for all text (headings + body). Headings slightly tighter (`letter-spacing: -0.01`). Generous line height for readability. (Quicksand/Nunito are Latin fallbacks if any Latin appears.)

### 3.5 Shape & components
- **Radius base 16** (`core/theme/radii.dart`): sm 12, md 14, lg 16, xl 20, 2xl 24, 3xl 28, 4xl 32.
- **Card:** white, `BorderRadius 20`, subtle border `#DCE6EE`, soft shadow, padding 16–20. Reusable `AppCard`.
- **Buttons:** primary = blue fill, white text, rounded, soft shadow; secondary = green; ghost/outline for quiet actions. Large height (≥52) and tap targets ≥44.
- Build a small **design-system kit** in `core/widgets` and a single `AppTheme` (`core/theme/app_theme.dart`) wiring `ColorScheme`, `TextTheme` (Tajawal), card/button themes, input themes — all from the tokens.

---

## 4. UX rules (simple, clear, warm — enforce everywhere)

1. **One clear focus per screen.** Home's focus is "next dose + check-in QR."
2. **Plain, kind Arabic.** Short sentences, parent-friendly words, no raw medical jargon dumped on the user; explain gently.
3. **Big & legible.** Large type (scales with system), high contrast, large tappable cards, clear icons + labels.
4. **Reassuring tone & visuals.** Hopeful microcopy; a supportive **treatment journey**; calm, encouraging empty states. Never alarmist.
5. **Status by color + icon + label** (never color alone).
6. **Offline-friendly:** show cached data with a subtle "آخر تحديث…" note; graceful offline state.
7. **No editing of clinical data; no delete.** Read-only; the only writes are local preferences (notifications, security, selected child).
8. **Effortless navigation:** a simple **bottom navigation** with few destinations; the QR check-in is always one tap from Home.
9. **Respect privacy & wellbeing:** mask sensitive identifiers; never show prognosis/mortality/death fields; keep it child- and family-appropriate.

---

## 5. Navigation & routes

- **Bottom navigation (4 tabs):** **الرئيسية (Home)** · **السجل (Record)** · **التحاليل (Results)** · **المواعيد (Appointments)**. Notifications via a top-bar bell; Profile via avatar/menu. (Keep tabs few and obvious.)
- **go_router routes:**
```
/login
/                      → Home
/qr                    → Full-screen check-in QR (token + time)
/record                → Child medical record (read-only, offline)
/journey               → Treatment plan / journey (read-only)
/results               → Lab results list
/results/:id           → Result detail (PDF view / share)
/discharge             → Discharge reports list
/discharge/:id         → Discharge report detail (view / export-share)
/appointments          → Appointments + dose schedule
/notifications         → Notifications
/profile               → Guardian profile / settings / child switcher
```
- Notification taps **deep-link** (e.g., a results push opens `/results/:id`; a dose reminder opens `/appointments` or the relevant `/discharge/:id`).

---

## 6. Screen-by-screen specification

> For each screen: **Purpose · Layout · Data shown · Interactions · States · Creative/supportive notes.** Build all of them.

### 6.1 Login
- **Purpose:** secure, simple entry. Username/phone + password (guardian account is linked to the child). **Biometric / PIN** via `local_auth` for fast re-entry (mock acceptable). Lockout after N attempts (mock).
- **Tone:** a warm welcome ("أهلاً بكم في رعاية بسمة"), the Hope/Care gradient, minimal fields. On success → Home.

### 6.2 Home — the heart (calm, reassuring)
- **Purpose:** answer "what's next?" and give the **check-in QR**, instantly.
- **Layout (top→bottom):**
  1. **Warm greeting:** "صباح الخير 🌟" + **child's name** front and center (e.g., "عائلة [اسم الطفل]").
  2. **★ Check-in card (hero):** the child's **QR code** (encodes the **file number / رقم الإضبارة**) + **token number** (if issued today) + **booking/arrival time** + the line "اعرض هذا الرمز عند الاستقبال لتسجيل وصولكم". Tapping opens the full-screen QR (§6.3).
  3. **Next-dose reminder card:** from the latest **discharge report's `nextDoseDate`** — a gentle countdown ("جرعة [الطفل] القادمة: غدًا، [التاريخ/الوقت]") with a calm icon; tap → appointments/discharge detail.
  4. **Treatment journey strip:** a soft progress visual of the current phase ("أنتم الآن في مرحلة [X]") — hopeful, tap → §6.5.
  5. **Quick access grid (big cards):** السجل الطبي · خطة العلاج · نتائج التحاليل · تقارير التخريج · المواعيد.
  6. **Latest updates:** 2–3 recent notifications (results arrived / reminder).
  7. **Supportive footer:** a gentle encouraging line + a "تواصل مع الوحدة" (contact) action.
- **States:** offline shows cached data with "آخر تحديث…"; empty states are warm ("لا توجد مواعيد قادمة حاليًا — نتمنى لكم يومًا طيبًا").
- **Creative notes:** this screen should feel like a calm, caring companion — soft gradients, a small hopeful motif (e.g., a sun/leaf), the child's name celebrated, never clinical or cold.

### 6.3 Full-screen check-in QR
- **Purpose:** show the QR big and bright for reception to scan.
- **Layout:** large centered **QR (file number)**, **token number** large beneath, **booking/arrival time**, instruction "اعرض هذا الرمز لموظف الاستقبال". **Boost screen brightness** while open; restore on exit. Optional refresh.
- **Note:** the QR encodes the **file number (رقم الإضبارة)**; reception scans it to check the child in (ties to the Reception app's scan flow; the token's `visibleToGuardian` makes the number/turn available here).

### 6.4 Child medical record (read-only, offline)
- **Purpose:** the saved record of the child and related data, available offline.
- **Data shown (parent-appropriate, masked):** child's name, **age**, gender, **file number**, current **treatment phase**, a **disease overview summary** (gentle, summarized — not raw clinical documentation), guardian relationship. **Mask** sensitive identifiers (national IDs shown partially or hidden). **Do not show** prognosis, life-status/mortality, or death/follow-up fields.
- **Interactions:** read-only; "آخر تحديث…" indicator; works offline from Hive cache.
- **Creative notes:** present as friendly info cards, not a dense clinical table.

### 6.5 Treatment plan / journey (read-only)
- **Purpose:** show the child's treatment as a **hopeful journey**.
- **Data shown:** plan name, the **stages** (e.g., الحث/التوحيد/الصيانة) as a **journey timeline** with status (مكتملة / الحالية / قادمة), friendly stage names, dates, and a simple meds/visit summary per stage.
- **Creative notes:** a vertical journey path with milestone markers; completed stages in **green (hope)**, current stage highlighted, upcoming muted. Optional gentle celebration (Sun gradient + kind message) when a stage completes. Encouraging, never overwhelming.

### 6.6 Lab results
- **Purpose:** see results (incl. biopsies) and open the PDF.
- **Data shown:** list of results — test type, date, status; **new/unread highlighted**. Tap → **result detail**: a brief summary + **view PDF** + **share/export** (share_plus). 
- **States:** new-result highlight (links from the results notification); empty ("لا توجد نتائج جديدة"); offline shows cached results + PDFs if downloaded.
- **Tone:** neutral, calm presentation of results; no alarming framing.

### 6.7 Discharge reports
- **Purpose:** the doctor's handoff to the family — what was done and what's next.
- **Data shown:** list of discharge reports; tap → detail with **last dose date**, **prescription** (meds + instructions), **doctor's instructions**, **next dose date**, **next destination** (نهاري/داخلي). 
- **Interaction:** **export/share** the report as a file (the guardian can export it). The **next dose date here drives the dose reminder** (§9).
- **Tone:** clear, supportive "ما الخطوة القادمة" framing.

### 6.8 Appointments + dose schedule
- **Purpose:** upcoming appointments and the next dose, simply.
- **Data shown:** upcoming list (date, time, type, department); the **next dose** highlighted at top. Add-to-phone-calendar optional.
- **States:** empty/offline handled warmly.

### 6.9 Notifications
- **Data shown:** dose reminders, **results/biopsy arrived**, important updates — each with icon/color, message, time, read/unread; tapping **deep-links** to the relevant screen. Mark read / mark all read.

### 6.10 Profile / settings
- Guardian profile (name, **relationship to child**, contact), **multiple-children switcher** (if a guardian has more than one child — switch the active child), **notification preferences** (toggle dose reminders / results alerts), **language** (Arabic), **security** (biometric/PIN), logout. (All local writes only.)

---

## 7. Data dictionary (mock; read-only; mirror the platform contract)

> Use **freezed** immutable models in `lib/models`. These mirror the shared platform schema (Doctor/Admin/Lab apps) but the guardian only receives a **read-only, masked, least-privilege** subset. **No** raw `DiseaseDocumentation`, no other patients' data, no prognosis/mortality fields.

- **ChildSummary:** `fileNoBasma` (primary, used in QR), `firstName`, `familyName`, `age`, `gender`, `currentPhase`, `photoUrl?`. *(IDs masked; no life-status/death fields.)*
- **GuardianProfile:** `id`, `name`, `relationshipToChild`, `contactPhone?`, `contactEmail?`, `children: List<ChildSummary>` (active child selectable).
- **DiseaseOverview:** `summary` (gentle, parent-friendly text), `category?`. *(Summary only — not the clinical template answers.)*
- **TreatmentPlanView:** `planName`, `stages: List<StageView>`. **StageView:** `name`, `status('completed'|'current'|'upcoming')`, `startDate?`, `endDate?`, `medsSummary?`, `visitsSummary?`.
- **LabResultView:** `id`, `testType`, `resultDate`, `status`, `pdfPath`, `isRead`, `summary?`.
- **DischargeReportView:** `id`, `lastDoseDate`, `prescription: List<{med, dose, instructions}>`, `doctorInstructions`, `nextDoseDate`, `nextVisitDepartment`, `generatedAt`, `exportable`.
- **AppointmentView:** `id`, `dateTime`, `type`, `department`, `isNextDose`.
- **CheckInToken:** `number`, `department`, `issueTime`, `bookingTime?`, `status`, `visibleToGuardian` (true). *(QR encodes `fileNoBasma`; this provides the number/time to display.)*
- **NotificationItem:** `id`, `type('doseReminder'|'resultArrived'|'update')`, `message`, `relatedId?`, `timestamp`, `isRead`, `deepLink`.

---

## 8. Mock data & offline cache
- Seed **one active child** (with `currentPhase`, a disease overview summary, a multi-stage treatment plan, several lab results incl. one **biopsy** and one **unread**, 2–3 discharge reports with future `nextDoseDate`s, upcoming appointments, an issued token with booking time). Optionally seed a **second child** to demo the switcher.
- Persist all of it in **Hive** on first load so the app works **offline**; show "آخر تحديث…" timestamps.
- Provide a **dev/mock trigger** to simulate "نتيجة جديدة وصلت" (fires a local notification + marks a result unread) so the results-notification flow is demoable without a backend.
- Mock PDF files for results and discharge reports; simulate latency and offline/error states.

---

## 9. Notifications (Firebase + local) — implement explicitly
Create a `NotificationService` (façade) over `FcmService` + `flutter_local_notifications`.

**9.1 Firebase Cloud Messaging (push):**
- Add `firebase_core` + `firebase_messaging`; init in `main()` **guarded** so the app still runs without Firebase config (dev/mock).
- Request notification permission; get/refresh the FCM token (log it for now).
- Handle **foreground**, **background**, and **terminated** messages; render foreground messages via `flutter_local_notifications`.
- Use FCM for: **"وصلت نتائج/خزعة من المخبر"** (result/biopsy arrived) and important updates (server-pushed in production; here triggerable via the mock trigger). Tapping deep-links to `/results/:id` (or the relevant screen).
- Note in README: production sends these via a Cloud Function / backend when a lab uploads a result; add `google-services.json` / `GoogleService-Info.plist` to enable real push.

**9.2 Local scheduled dose reminders:**
- Add `flutter_local_notifications` + `timezone`; create a notifications channel.
- For each **DischargeReportView.nextDoseDate**, schedule a **dose reminder** (e.g., the **day before** and the **morning of**): "تذكير: جرعة [اسم الطفل] غدًا [التاريخ/الوقت]". Reschedule/refresh whenever a newer discharge report arrives; cancel stale ones.
- Respect the user's notification preference toggle (§6.10).

**9.3 Deep links:** tapping any notification routes via go_router to the right screen with the right id.

---

## 10. Accessibility, RTL & wellbeing
- **RTL Arabic** throughout (`Locale('ar')`, RTL directionality); mirror layouts, icons, chevrons, journey direction.
- **Respect system text scaling** (don't hard-lock font sizes); ensure layouts reflow.
- **Contrast & tap targets:** WCAG-AA-level contrast; targets ≥44.
- **Wellbeing/child-safety:** supportive, hopeful, family-appropriate tone; **mask sensitive identifiers**; **never display prognosis, life-status/mortality, or death/follow-up data**; present results calmly. Provide a gentle "تواصل مع الوحدة" path for questions.

---

## 11. Performance & code quality (Flutter — make it excellent)
- **Feature-first clean architecture** (§2.1); thin widgets, logic in providers/use-cases; immutable **freezed** models.
- **Riverpod** with granular providers and `select` to avoid unnecessary rebuilds; `AsyncNotifier` for async/cache reads.
- **`const` constructors everywhere**; build small, focused widgets; use **`ListView.builder`/Slivers** for lists; **`cached_network_image`** for images; wrap the QR in a **`RepaintBoundary`**.
- **Offline-first repositories:** read Hive cache first, then mock source; expose immutable view models.
- Dispose controllers; avoid heavy work on the main isolate; lazy-load PDFs; precache hero images.
- `flutter analyze` clean; format with `dart format`; no unused deps. Provide a `README.md` and run instructions.

---

## 12. Acceptance criteria (Definition of Done)
1. **Flutter** app, RTL Arabic, light mode, feature-first architecture with Riverpod + go_router + freezed; `flutter analyze` is clean.
2. **Home** shows the child's name, the **check-in card (QR of file number + token number + booking/arrival time)**, and the **next-dose reminder** (from the discharge report) — calm and warm.
3. **Full-screen QR** opens from Home, boosts brightness, and shows token + time for reception to scan.
4. **Child record + all related data are saved and available offline** (Hive cache), read-only, with sensitive identifiers masked and **no distressing internals** shown.
5. **Treatment journey**, **lab results (incl. biopsy) with PDF view/share**, **discharge reports with view + export/share**, and **appointments/dose schedule** are all present and read-only.
6. **FCM** is wired (guarded init, permission, token, foreground/background/terminated handlers) and used for **result/biopsy-arrived** notifications; tapping deep-links to the result.
7. **Local scheduled dose reminders** are created from each discharge report's `nextDoseDate` (day-before + morning-of), reschedulable, and respect the preference toggle.
8. A **mock trigger** demonstrates the "result arrived" notification end-to-end without a backend.
9. **Multiple-children switcher**, notification preferences, biometric/PIN, and language live in Profile (local writes only); **no clinical editing, no delete**.
10. Design system (AppColors/gradients/radii/Tajawal/Surface) matches §3; the app feels soft, warm, and reassuring.
11. **Responsive** across phone sizes and a reasonable tablet layout; respects text scaling; no overflow.
12. **Performance:** const widgets, builder lists, RepaintBoundary on QR, offline-first repos, no needless rebuilds; smooth scrolling.

---

## 13. Arabic UI glossary (use these strings)
| English | Arabic |
|---|---|
| Home | الرئيسية |
| Record | السجل |
| Results | التحاليل |
| Appointments | المواعيد |
| Welcome | أهلاً بكم في رعاية بسمة |
| Show this at reception | اعرض هذا الرمز عند الاستقبال |
| Check-in code | رمز تسجيل الوصول |
| Token number | رقم الدور |
| Booking / Arrival time | وقت الحجز / وقت الوصول |
| File number | رقم الإضبارة |
| Your next dose | جرعتكم القادمة |
| Reminder: dose tomorrow | تذكير: لديكم جرعة غدًا |
| Medical record | السجل الطبي |
| Disease overview | لمحة عن الحالة |
| Treatment plan / journey | خطة العلاج / رحلة العلاج |
| Stage: completed/current/upcoming | مرحلة: مكتملة / الحالية / قادمة |
| Lab results | نتائج التحاليل |
| Biopsy | الخزعة |
| New result arrived | وصلت نتيجة جديدة |
| View / Download / Share PDF | عرض / تنزيل / مشاركة PDF |
| Discharge report | تقرير التخريج |
| Last dose date | تاريخ آخر جرعة |
| Prescription | الوصفة |
| Doctor's instructions | تعليمات الطبيب |
| Next destination | الوجهة القادمة |
| Contact the unit | تواصل مع الوحدة |
| Notifications | الإشعارات |
| Last updated | آخر تحديث |
| Switch child | تبديل الطفل |
| Notification settings | إعدادات الإشعارات |
| Security (biometric/PIN) | الحماية (البصمة/الرمز) |
| Logout | تسجيل الخروج |

---

## 14. Deliverables
- A runnable Flutter app (`flutter pub get && flutter run`), with `build_runner` set up for freezed/json (`dart run build_runner build`).
- The structure in §2.1, the shared models in `lib/models`, mock data + Hive cache in `lib/mock` + `core/services/local_cache.dart`, and the `NotificationService`.
- `README.md`: how to run, where mock data lives, how to add Firebase config to enable real push, how the dose-reminder scheduling works, the offline-cache behavior, and a screen index.

## Non-goals (do not build)
- No backend/API/auth server (mock login + mock data + guarded Firebase). 
- **Read-only:** parents do not edit clinical data; **no delete** anywhere; the only writes are local preferences/cache.
- **No distressing clinical internals** (prognosis, life-status/mortality, death/follow-up) — out of scope by design.
- No other role apps (doctor/nurse/reception/admin/lab) — Guardian only. Reception still performs the scan/check-in; this app only **presents** the QR/token to be scanned.
- No dark mode.

**Build it screen by screen, starting with theme + design-system widgets + app shell (router, RTL, bottom nav), then the offline cache + models + mock data, then Home (with the check-in card + next-dose reminder), the full-screen QR, the child record, journey, results, discharge reports, appointments, and finally wire FCM + local dose reminders. Keep it simple, warm, fast, and offline-friendly — this is a calm companion for worried parents. BE WARM. BE CLEAR.**
