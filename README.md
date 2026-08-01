# رعاية بسمة — تطبيق الأهل · Basma Guardian App

تطبيق Flutter **للأهل / ولي الأمر** لمتابعة طفلهم في وحدة بسمة (طب أورام الأطفال).

- **عربي RTL** · **وضع فاتح فقط** · **Offline-first** عبر Hive
- بيانات سريرية حقيقية من API (لا mock)
- واجهة هادئة وداعمة؛ لا تعرض تشخيصات مقلقة أو حالات وفاة / متابعة وفاة

---

## التشغيل

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

فحص الجودة:

```bash
flutter analyze   # يجب أن يظهر: No issues found!
```

### حساب تجريبي

| الحقل | القيمة |
|---|---|
| البريد | `guardian@basma.org` |
| كلمة المرور | `password` |

Base URL:

```text
https://api.basma-unit.cloud/api
```

---

## المعمارية (Clean Architecture · Feature-first)

```
lib/
  main.dart / app.dart
  core/
    config/api_config.dart          # base URL + timeouts
    router/                         # go_router + shell (4 تبويبات)
    services/
      api_client.dart               # Dio + Bearer interceptor (+ skipAuth)
      session_storage.dart          # token (secure storage + Hive fallback)
      auth_service.dart
      local_cache.dart              # Hive offline cache
      notification_service.dart
      pdf_service.dart
    theme/ widgets/ utils/
  models/                           # Freezed + json_serializable
  features/
    auth/                           # login / session
    shared/data/                    # GuardianRemoteSource + Repository + Providers
    home/ checkin_qr/ child_record/
    treatment_journey/ lab_results/
    discharge_reports/ appointments/
    display_queues/                 # طوابير عامة (Public API)
    notifications/ profile/
```

| الطبقة | الدور |
|---|---|
| **Presentation** | شاشات Riverpod — بدون منطق شبكة |
| **Domain/Providers** | `GuardianController` + providers مجزأة |
| **Data** | `*RemoteSource` (Dio) + `*Repository` (Hive + API) |
| **Models** | Freezed immutable + JSON |

**Offline-first:** بعد كل مزامنة ناجحة تُحفظ الحزمة في Hive. الواجهة تقرأ دائماً من الكاش المحلي؛ عند انقطاع الشبكة تبقى البيانات السابقة ظاهرة مع طابع «آخر تحديث…».

---

## المصادقة (Auth)

| Endpoint | الوصف |
|---|---|
| `POST /auth/login` | تسجيل الدخول → Bearer token |
| `GET /auth/me` | استعادة الجلسة |
| `POST /auth/logout` | إنهاء الجلسة |

- التوكن يُحقَن تلقائياً عبر `ApiClient` لكل طلب محمي.
- التحقق من الحقول في شاشة الدخول:
  - بريد غير صالح → `البريد الإلكتروني غير صحيح`
  - هاتف يجب أن يبدأ بـ `09` ويتكون من 10 أرقام
  - كلمة سر فارغة → `كلمة السر غير صحيحة`
- **لا توجد بصمة / local_auth** (أُزيلت عمداً).

---

## APIs المرتبطة

جميع المسارات تحت `https://api.basma-unit.cloud/api` ما لم يُذكر خلاف ذلك.

### 1) ملف ولي الأمر والأطفال (camelCase · يحتاج Bearer)

| Method | Path | الاستخدام |
|---|---|---|
| GET | `/guardian/me` | الملف + قائمة الأطفال |
| GET | `/guardian/children` | تحديث قائمة الأطفال (الملف الشخصي / التبديل) |

### 2) السجل السريري الشامل — Record Bundle (camelCase · Bearer)

| Method | Path |
|---|---|
| GET | `/guardian/children/{patientFileNo}/record` |

يرجع حزمة كاملة تُحفظ في Hive:

- `child` · `diseaseOverview` · `treatmentPlan`
- `labResults[]` · `dischargeReports[]` · `appointments[]`
- `checkInToken` (قد يكون `null`)
- `lastUpdated`

بعد جلب السجل يُحدَّث أيضاً:

| Method | Path |
|---|---|
| GET | `/guardian/children/{fileNo}/dose-reminder` |

> إذا فشل `/record`، التطبيق يعود تلقائياً لمزامنة تفصيلية (treatment / labs / discharge / check-in / appointments).

### 3) تحاليل مخبرية

| Method | Path |
|---|---|
| GET | `/guardian/children/{fileNo}/lab-results` |
| GET | `/guardian/children/{fileNo}/lab-results/{id}/download` | PDF رسمي |
| PATCH | `/guardian/children/{fileNo}/lab-results/{id}/read` | تعليم كمقروء |

عند فتح تفاصيل النتيجة: PATCH + تحديث Hive. زر التحميل يعرض PDF عبر `Printing.layoutPdf`.

### 4) Check-in QR

الـ QR يشفّر **رقم الإضبارة** (`fileNoBasma`). الرقم الظاهر بجانب الـ QR يأتي من `checkInToken`:

```json
{
  "number": "C-12",
  "department": "عيادة",
  "issueTime": "...",
  "bookingTime": null,
  "status": "issued",
  "visibleToGuardian": true
}
```

- يدعم النموذج **camelCase** (من `/record`) و**snake_case** (من `/check-in-token`).
- إذا `visibleToGuardian == false` لا يُعرض الرمز في الواجهة.

### 5) طوابير الانتظار العامة (snake_case · **بدون Authorization**)

| Method | Path | Auth |
|---|---|---|
| GET | `/display/queues` | Public (`skipAuth: true`) |

مثال الاستجابة:

```json
{
  "departments": [
    { "department": "clinic", "tokens": [ ... ] },
    { "department": "daycare", "tokens": [ ... ] },
    { "department": "inpatient", "tokens": [] }
  ]
}
```

#### أسماء الأقسام المعروضة

| كود API (`department`) | الاسم في الواجهة |
|---|---|
| `clinic` | **عيادة خارجية** |
| `daycare` | **مستشفى نهاري** |
| `inpatient` | **قسم داخلي** |

حالات الرمز: `waiting` (في الانتظار) · `called` (تم النداء) · `is_emergency` (طارئ).  
إذا كان رقم ولي الأمر مطابقاً لرمز في الطابور يُميَّز صفّه في الشاشة.

---

## الشاشات والمسارات

| المسار | الشاشة |
|---|---|
| `/login` | تسجيل الدخول |
| `/` | الرئيسية — ترحيب، بطاقة Check-in QR، تذكير الجرعة، شريط الرحلة، وصول سريع |
| `/qr` | QR بملء الشاشة (+ رفع السطوع) |
| `/queues` | طوابير الانتظار العامة |
| `/record` | السجل الطبي (قراءة فقط + آخر تحديث) |
| `/journey` | خطة / رحلة العلاج |
| `/results` · `/results/:id` | قائمة التحاليل · التفاصيل + تحميل PDF |
| `/discharge` · `/discharge/:id` | تقارير التخريج (بدون تصدير) |
| `/appointments` | المواعيد |
| `/notifications` | الإشعارات |
| `/profile` | الملف، تبديل الطفل، تفضيلات التذكير، تسجيل الخروج |

التبويبات السفلية: الرئيسية · السجل · التحاليل · المواعيد.

---

## التخزين المحلي (Hive)

الصندوق: `basma_cache`

| المحتوى | متى يُحدَّث |
|---|---|
| Guardian profile + children | بعد `/guardian/me` أو `/children` |
| `PatientRecord` لكل `fileNoBasma` | بعد `/record` (أو المزامنة التفصيلية) |
| Active child | تبديل الطفل |
| Prefs | تذكيرات الجرعات / تنبيهات النتائج |
| Notifications (محلي) | قراءة / تعليم الكل |
| Session token | login / logout |

عند تسجيل الدخول يُمسَح كاش الجلسة القديم (`clearFirst: true`) ثم تُزامَن البيانات من جديد.

---

## الإشعارات

### Push (FCM)
- تهيئة `firebase_core` + `firebase_messaging` عند الإقلاع (مع حماية عند غياب الإعداد).
- أذونات الإشعارات تُطلب عند أول تشغيل.
- تسجيل التوكن: `POST /guardian/device-tokens` بجسم `{ "token": "...", "platform": "android|ios" }`.
- إلغاء التوكن: `DELETE /guardian/device-tokens` بجسم `{ "token": "..." }` قبل تسجيل الخروج.
- Foreground: عرض عبر `flutter_local_notifications` (صوت + اهتزاز).
- Background / Terminated: `FirebaseMessaging.onBackgroundMessage`.
- النقر يوجّه عبر `deepLink` من الـ API أو حسب `type` + `relatedId`.

### صندوق الوارد (Offline-First)
| Method | Path |
|---|---|
| GET | `/guardian/notifications` |
| PATCH | `/guardian/notifications/{id}/read` |
| PATCH | `/guardian/notifications/read-all` |

شكل العنصر: `id`, `type`, `message`, `timestamp`, `relatedId`, `isRead`, `deepLink`.
تُحفظ القائمة في Hive؛ الشاشة تدعم السحب للتحديث.

### تذكيرات الجرعة (محلية)
يوم قبل 19:00 وصباح يوم الجرعة 08:00 من `doseReminder` أو تقرير التخريج.

### Android Firebase
- `google-services.json` في `android/app/`
- إضافة Gradle: `com.google.gms.google-services`

---

## نظام التصميم

- ألوان بسمة: Primary أزرق / Secondary أخضر / Accent بنفسجي / Highlight أصفر
- خلفيات متدرجة ناعمة (Care / Hope / Sun)
- خط **Tajawal** · نصف قطر أساسي 16
- لا Dark Mode

---

## أوامر مفيدة للمطور

```bash
# توليد Freezed / JSON
dart run build_runner build --delete-conflicting-outputs

# تحليل ثابت
flutter analyze

# تشغيل على جهاز/محاكي
flutter run
```

---

## غير مُدرَج عمداً

- لا تعديل بيانات سريرية من طرف ولي الأمر
- لا بصمة / PIN محلي
- لا تصدير تقارير التخريج
- لا عرض تشخيصات مقلقة أو حالات وفاة
- ولي الأمر فقط (ليس دور الطبيب/الممرضة)
