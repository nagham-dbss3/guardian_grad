# رعاية بسمة — تطبيق الأهل · Basma Guardian App

تطبيق Flutter مخصّص **لولي الأمر / الأهل** لمتابعة طفلهم أثناء العلاج في وحدة بسمة (طب أورام الأطفال).

هذا المستند يشرح **كل متطلب**، **كيف حقّقناه**، **أي تقنيات ومكتبات استخدمنا**، و**أين يوجد التنفيذ في الكود** — بتفصيل كامل.

---

## 1) هوية المنتج والقيود الأساسية

| البند | القرار |
|---|---|
| الجمهور | ولي الأمر فقط (ليس طبيب / ممرضة / استقبال) |
| اللغة | عربي فقط |
| الاتجاه | RTL إجباري |
| المظهر | وضع فاتح فقط (لا Dark Mode) |
| مصدر البيانات | API حقيقي (`api.basma-unit.cloud`) — لا mock بعد الإقلاع |
| التخزين | Offline-first عبر Hive |
| نبرة الواجهة | هادئة وداعمة |
| الخصوصية | قراءة فقط؛ لا تعديل سريري؛ لا عرض تشخيصات مقلقة / حالات وفاة |

**كيف فرضنا الهوية في الكود:**

- اسم التطبيق في الواجهة: `رعاية بسمة` (`lib/app.dart`)
- الحزمة: `basma_patient` (`pubspec.yaml`)
- Android `applicationId`: `com.basma.basma_patient`
- العنوان في Manifest: «رعاية بسمة»

---

## 2) التقنيات والمكتبات (Stack الكامل)

### منصة التطبيق

| تقنية | الإصدار / المصدر | لماذا استخدمناها |
|---|---|---|
| **Flutter / Dart** | SDK `^3.9.2` | واجهة موبايل واحدة لكود Android/iOS |
| **Material 3** | عبر Flutter | نظام مكوّنات قياسي مع تخصيص ثيم بسمة |
| **flutter_localizations** | SDK | توطين Material/Cupertino للعربي |

### إدارة الحالة والتنقّل

| مكتبة | الدور |
|---|---|
| **flutter_riverpod** | حقن الاعتماديات + Controllers/Providers بدون BuildContext ثقيل |
| **go_router** | مسارات معلنة + حماية الجلسة + `StatefulShellRoute` لأربع تبويبات |

### الشبكة والجلسة

| مكتبة / مكوّن | الدور |
|---|---|
| **dio** | عميل HTTP لكل استدعاءات الـ API |
| **ApiClient** (`lib/core/services/api_client.dart`) | إعداد Dio + interceptor لحقن Bearer + دعم `skipAuth` |
| **ApiConfig** (`lib/core/config/api_config.dart`) | Base URL + headers + timeouts (20 ثانية) |
| **flutter_secure_storage** | حفظ التوكن بشكل آمن على الجهاز |
| **SessionStorage** | واجهة جلسة: secure storage أولاً، وHive كـ fallback |

### التخزين المحلي (Offline-first)

| مكتبة / مكوّن | الدور |
|---|---|
| **hive / hive_flutter** | صندوق `basma_cache` لكل بيانات الجلسة والملف السريري |
| **LocalCache** | مفاتيح الكاش وقراءة/كتابة JSON للنماذج |

### النماذج (Domain Models)

| مكتبة | الدور |
|---|---|
| **freezed + freezed_annotation** | نماذج immutable + `copyWith` + اتحادات آمنة |
| **json_serializable + json_annotation** | تحويل JSON ↔ Dart (camelCase و snake_case) |
| **build_runner** | توليد `*.freezed.dart` و `*.g.dart` |

### الإشعارات

| مكتبة | الدور |
|---|---|
| **firebase_core** | تهيئة Firebase |
| **firebase_messaging** | استقبال Push (FCM) |
| **flutter_local_notifications** | إشعارات أمامية + جدولة تذكير الجرعة |
| **timezone** | جدولة زمنية محلية دقيقة لتذكيرات الجرعة |

### واجهة وميزات مساعدة

| مكتبة | الدور |
|---|---|
| **google_fonts (Tajawal)** | خط عربي معبّر لهوية بسمة |
| **qr_flutter** | توليد QR لرقم الإضبارة عند Check-in |
| **screen_brightness** | رفع سطوع الشاشة في وضع QR ملء الشاشة |
| **pdf + printing** | عرض/طباعة PDF نتائج التحاليل الرسمية |
| **cached_network_image** | كاش صور الشبكة عند الحاجة |
| **share_plus / path_provider / intl** | مشاركة، مسارات ملفات، تنسيق تواريخ عربي |

### جودة الكود

| أداة | الدور |
|---|---|
| **flutter_lints** | قواعد تحليل ثابت |
| **flutter analyze** | هدف المشروع: `No issues found!` |

---

## 3) التشغيل

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

### Base URL

```text
https://api.basma-unit.cloud/api
```

معرّف في `lib/core/config/api_config.dart` (لا يوجد ملف `.env` منفصل).

---

## 4) المعمارية — كيف نظّمنا المشروع

اعتمدنا **Clean Architecture بأسلوب Feature-first**:

```
lib/
  main.dart / app.dart
  core/
    config/api_config.dart          # base URL + timeouts
    router/                         # go_router + shell (4 تبويبات)
    services/
      api_client.dart               # Dio + Bearer interceptor (+ skipAuth)
      session_storage.dart          # token (secure storage + Hive fallback)
      auth_service.dart             # واجهة دخول/قفل محاولات للـ UI
      local_cache.dart              # Hive offline cache
      notification_service.dart     # FCM + محلي + تذكير جرعة
      fcm_service.dart              # خلفية FCM
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

| الطبقة | الدور | مثال |
|---|---|---|
| **Presentation** | شاشات فقط؛ تراقب Providers وتعرض الحالة | `login_screen.dart`, `home_screen.dart` |
| **Providers / Domain orchestration** | تنسيق الحالة وتحديث الواجهة | `GuardianController` في `guardian_providers.dart` |
| **Data — RemoteSource** | استدعاءات Dio الخام | `GuardianRemoteSource` |
| **Data — Repository** | دمج API + Hive + fallback | `GuardianRepository` |
| **Models** | عقود بيانات immutable | `PatientRecord`, `ChildSummary`, … |
| **Core services** | بنية تحتية مشتركة | Dio، الجلسة، الإشعارات، الثيم |

**لماذا هكذا؟** لفصل الشبكة عن الواجهة، وتمكين Offline-first، وتسهيل استبدال مصدر بيانات أو إضافة شاشة دون كسر الباقي.

---

## 5) تحقيق المتطلبات — تفصيل ممل مطلبًا مطلبًا

### متطلب 1 — واجهة عربية RTL ووضع فاتح فقط

**المتطلب:** التطبيق عربي بالكامل، من اليمين لليسار، وبدون وضع ليلي.

**كيف حقّقناه:**

1. في `lib/main.dart`:
   - `Intl.defaultLocale = 'ar'`
   - `initializeDateFormatting('ar')`
2. في `lib/app.dart` داخل `MaterialApp.router`:
   - `locale: Locale('ar')`
   - `supportedLocales: [Locale('ar')]`
   - تفويضات `GlobalMaterialLocalizations` / `Widgets` / `Cupertino`
   - `theme: AppTheme.light` فقط (لا `darkTheme`)
   - `builder` يلفّ كل الشجرة بـ `Directionality(textDirection: TextDirection.rtl)`
   - تقييد تكبير النص بين `0.9` و `1.4` عبر `MediaQuery.textScaler`
3. كل نصوص الواجهة مكتوبة عربيًا داخل الشاشات (لا ملفات ARB منفصلة حاليًا).

**التقنيات:** Flutter localization · `intl` · Material Theme light-only · Tajawal عبر `google_fonts`.

---

### متطلب 2 — Clean Architecture + Feature-first

**المتطلب:** طبقات واضحة، وميزات مستقلة تحت `features/`.

**كيف حقّقناه:**

- كل ميزة لها `presentation/` (وأحيانًا `data/` خاصة مثل الطوابير).
- البيانات السريرية المشتركة لولي الأمر مركزية في `features/shared/data/`:
  - `guardian_remote_source.dart` → HTTP
  - `guardian_repository.dart` → كاش + مزامنة + fallback
  - `guardian_providers.dart` → Riverpod
- الخدمات المشتركة في `core/services/` حتى لا تتكرر في كل ميزة.
- النماذج في `lib/models/` مشتركة بين الميزات.

**التقنيات:** Riverpod · Repository pattern · Remote Source · Freezed models.

---

### متطلب 3 — مصادقة حقيقية (Login / Logout / استعادة الجلسة)

**المتطلب:** دخول عبر API، حفظ جلسة آمنة، استعادة عند إعادة فتح التطبيق، وخروج نظيف.

**Endpoints:**

| Method | Path | الاستخدام |
|---|---|---|
| `POST` | `/auth/login` | تسجيل الدخول → Bearer token + بيانات المستخدم |
| `GET` | `/auth/me` | التحقق من التوكن وتحديث المستخدم |
| `POST` | `/auth/logout` | إلغاء الجلسة على الخادم (best-effort) |

**كيف حقّقناه:**

1. **`AuthRepository`** (`lib/features/auth/data/auth_repository.dart`):
   - `login`: يرسل `{email, password}` ويحفظ `token + user` عبر `SessionStorage`
   - `logout`: يحاول `POST /auth/logout` ثم يمسح الجلسة محليًا دائمًا
   - `restoreSession`:
     - لا توكن → يمسح ويعيد `null`
     - `401/403` → جلسة باطلة، مسح محلي
     - أخطاء شبكة / 5xx → **الإبقاء على الجلسة المحلية** (offline resume)
2. **`SessionStorage`**: يفضّل `flutter_secure_storage`، مع fallback إلى Hive (`authToken` / `authUser`).
3. **`ApiClient` interceptor**: يحقن `Authorization: Bearer …` تلقائيًا في كل طلب محمي.
4. **`AuthService`**: واجهة للـ UI مع قفل بعد **5 محاولات فاشلة** (`maxAttempts = 5`) ورسائل عربية.
5. **Router guard** في `app_router.dart`: إن لم يكن `LocalCache.isLoggedIn` يُعاد التوجيه إلى `/login`.
6. عند الإقلاع (`app.dart`): بعد أول frame يتم `restoreSession` ثم `syncProfile` في الخلفية دون حجب الواجهة.

**تحقق الحقول في شاشة الدخول** (`login_screen.dart`):

| الحالة | الرسالة |
|---|---|
| بريد غير صالح | `البريد الإلكتروني غير صحيح` |
| هاتف لا يبدأ بـ `09` أو ليس 10 أرقام | `رقم الهاتف يجب أن يبدأ بـ 09 ويتكون من 10 أرقام` |
| كلمة سر فارغة | `كلمة السر غير صحيحة` |

**ما أزلناه عمدًا:** بصمة الإصبع / `local_auth` / PIN محلي — غير موجودة في `pubspec.yaml` ولا في الشاشات.

**التقنيات:** Dio · flutter_secure_storage · Hive · go_router redirect · AuthFailure عربي.

---

### متطلب 4 — ملف ولي الأمر + الأطفال + Child Switcher

**المتطلب:** جلب هوية ولي الأمر وقائمة أطفاله، واختيار طفل نشط، وتحديث البيانات عند التبديل.

**Endpoints:**

| Method | Path |
|---|---|
| `GET` | `/guardian/me` |
| `GET` | `/guardian/children` |

**كيف حقّقناه:**

1. `GuardianRemoteSource.fetchMe()` و `fetchChildren()` يحوّلان JSON إلى `GuardianProfile` / `List<ChildSummary>`.
2. `GuardianRepository.syncProfile(clearFirst: …)`:
   - عند الدخول: `clearFirst: true` لمسح أي كاش قديم (كان يمنع اختلاط mock قديم مع API).
   - يحفظ الملف في Hive تحت مفتاح `guardian`.
   - يضبط الطفل النشط `activeChild` = `fileNoBasma`.
   - يطلق مزامنة سريرية لكل طفل.
3. في شاشة الملف الشخصي: تحديث الأطفال + تبديل الطفل.
4. عند التبديل (`GuardianController`): حفظ الطفل النشط → مزامنة سريرية لذلك الطفل → إعادة جدولة تذكيرات الجرعة.

**التقنيات:** Freezed models (`child.dart`) · Hive · Riverpod Notifier · parallel sync عبر `Future.wait`.

---

### متطلب 5 — Offline-first حقيقي (Hive دائمًا مصدر الواجهة)

**المتطلب:** التطبيق يعمل ويعرض آخر بيانات حتى بدون إنترنت؛ عند النجاح تُحدَّث الكاش.

**كيف حقّقناه:**

1. صندوق Hive: `basma_cache` (`LocalCache`).
2. المفاتيح:

| المفتاح | المحتوى | متى يُحدَّث |
|---|---|---|
| `guardian` | ملف ولي الأمر + الأطفال | بعد `/guardian/me` أو `/children` |
| `records` | `Map<fileNo, PatientRecord>` | بعد `/record` أو المزامنة التفصيلية |
| `activeChild` | رقم إضبارة الطفل الحالي | تبديل الطفل / أول مزامنة |
| `prefs` | تفضيلات التذكير | من شاشة الملف |
| `notifications` | صندوق الوارد | بعد مزامنة الإشعارات / تعليم مقروء |
| `loggedIn` / `authUser` / `authToken` | حالة الجلسة | login / logout / restore |
| `fcmToken` | آخر توكن FCM | عند التسجيل |

3. الواجهة **لا تعتمد مباشرة على استجابة الشبكة**؛ تقرأ من Providers المبنية على الكاش.
4. عند فشل الشبكة: تبقى البيانات السابقة + يظهر طابع «آخر تحديث…» حيث ينطبق.
5. عند تسجيل الدخول يُمسَح كاش الجلسة القديمة ثم تُزامَن البيانات من جديد.

**التقنيات:** hive_flutter · JSON encode للنماذج Freezed · نمط cache-aside.

---

### متطلب 6 — سجل سريري شامل (Record Bundle) مع Fallback تفصيلي

**المتطلب:** جلب حزمة كاملة للطفل، وإن فشل المسار الشامل نرجع لنقاط نهاية مجزأة.

**Endpoint الأساسي:**

| Method | Path |
|---|---|
| `GET` | `/guardian/children/{patientFileNo}/record` |

**محتوى الحزمة المحفوظة في Hive (`PatientRecord`):**

- `child`
- `diseaseOverview`
- `treatmentPlan`
- `labResults[]`
- `dischargeReports[]`
- `appointments[]`
- `checkInToken` (قد يكون `null`)
- `lastUpdated`

بعد نجاح `/record` يُحدَّث أيضًا:

| Method | Path |
|---|---|
| `GET` | `/guardian/children/{fileNo}/dose-reminder` |

**Fallback عند فشل `/record`** (`_syncClinicalGranular`):

| Endpoint | الحقل المحدَّث |
|---|---|
| `/treatment-journey` | خطة العلاج |
| `/lab-results` | التحاليل |
| `/discharge-reports` | تقارير التخريج |
| `/dose-reminder` | تذكير الجرعة |
| `/check-in-token` | رمز المراجعة |
| `/appointments` | المواعيد |

كل خطوة best-effort: فشل واحدة لا يلغي الباقي؛ النتيجة تُدمَج فوق آخر كاش معروف.

**التقنيات:** Dio · Freezed `PatientRecord` · merge عبر `copyWith` · معالجة camelCase/snake_case في الموديلات.

---

### متطلب 7 — رحلة العلاج (Treatment Journey)

**المتطلب:** عرض مراحل خطة العلاج بشكل مفهوم للأهل.

**كيف حقّقناه:**

- مصدر أساسي من `/record` → `treatmentPlan`
- أو `/guardian/children/{fileNo}/treatment-journey` في المسار التفصيلي
- الشاشة: `features/treatment_journey/` والمسار `/journey`
- من الرئيسية يظهر شريط ملخص للرحلة مع وصول سريع

**التقنيات:** Freezed model في `treatment.dart` · قراءة من الكاش · تنقل `go_router`.

---

### متطلب 8 — نتائج التحاليل + تعليم كمقروء + PDF رسمي

**المتطلب:** قائمة تحاليل، تفاصيل، تعليم كمقروء، وتحميل PDF من الخادم.

**Endpoints:**

| Method | Path | الاستخدام |
|---|---|---|
| `GET` | `/guardian/children/{fileNo}/lab-results` | قائمة (أو ضمن `/record`) |
| `PATCH` | `/guardian/children/{fileNo}/lab-results/{id}/read` | تعليم كمقروء |
| `GET` | `/guardian/children/{fileNo}/lab-results/{id}/download` | بايتات PDF |

**كيف حقّقناه:**

1. التبويب `/results` يعرض القائمة من السجل المخزّن.
2. عند فتح `/results/:id`: استدعاء PATCH ثم تحديث العنصر في Hive (`markResultRead`).
3. زر التحميل: `downloadLabResultPdf` → `Uint8List` → `Printing.layoutPdf` لعرض/مشاركة الملف الرسمي.
4. لا نولّد PDF محليًا كنسخة بديلة للنتيجة الرسمية؛ نعتمد بايتات الخادم.

**التقنيات:** Dio (response bytes) · `printing` · `pdf` · Riverpod · تحديث كاش فوري.

---

### متطلب 9 — تقارير التخريج (قراءة فقط بدون تصدير)

**المتطلب:** عرض تقارير التخريج للأهل دون زر تصدير في الواجهة.

**كيف حقّقناه:**

- الجلب عبر `/record` أو `/discharge-reports`
- الشاشات: `/discharge` و `/discharge/:id`
- الواجهة **لا تعرض** زر تصدير/مشاركة لتقرير التخريج (رغم وجود مساعدات PDF عامة في `pdf_service.dart` للاستخدامات الأخرى)
- البيانات تُقرأ من الكاش بعد المزامنة

**التقنيات:** Freezed clinical models · go_router params · offline cache.

---

### متطلب 10 — تذكير الجرعة (محلي مجدول)

**المتطلب:** تذكير ولي الأمر بموعد الجرعة حتى بدون Push من الخادم.

**مصدر التاريخ:**

- `GET /guardian/children/{fileNo}/dose-reminder`
- أو تاريخ مستخرج من تقرير التخريج عند الحاجة

**الجدولة في `NotificationService.rescheduleDoseReminders`:**

| الموعد | الوقت المحلي |
|---|---|
| يوم قبل الجرعة | 19:00 |
| صباح يوم الجرعة | 08:00 |

**كيف حقّقناه:**

1. عند الإقلاع: قراءة `prefs.doseReminders` وإعادة الجدولة من `activeRecord`.
2. عند تبديل الطفل أو تحديث السجل: إعادة جدولة.
3. إن عُطّلت التفضيلات أو لا يوجد تاريخ: إلغاء الجداول المحلية.
4. المواعيد التي مضت زمنيًا تُتخطى.

**التقنيات:** `flutter_local_notifications` · `timezone` · تفضيلات Hive (`GuardianPrefs`).

---

### متطلب 11 — Check-in QR

**المتطلب:** عرض رمز QR للمراجعة مع رقم الطابور الظاهر عند السماح.

**كيف حقّقناه:**

1. محتوى الـ QR = **`fileNoBasma`** (رقم إضبارة بسمة) عبر `qr_flutter`.
2. الرقم/القسم/الحالة الظاهرة بجانب الـ QR من `checkInToken`:
   - من `/record` بصيغة **camelCase**
   - أو من `/check-in-token` بصيغة **snake_case**
3. إن `visibleToGuardian == false` **لا يُعرض** الرمز في الواجهة (Provider يُرجع `null`).
4. المسار `/qr`: ملء الشاشة + رفع السطوع عبر `screen_brightness` لتسهيل المسح.
5. بطاقة مختصرة على الرئيسية مع انتقال سريع لـ `/qr`.

مثال شكل التوكن:

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

**التقنيات:** qr_flutter · screen_brightness · Freezed `CheckInToken` مع `@JsonKey` للـ snake_case.

---

### متطلب 12 — المواعيد

**المتطلب:** عرض مواعيد الطفل النشط.

**كيف حقّقناه:**

- ضمن حزمة `/record` أو عبر `/appointments` (snake_case)
- تبويب سفلي `/appointments`
- الموديل يوحّد الحقول مهما اختلفت تسمية JSON
- القراءة من الكاش؛ التحديث عند المزامنة / السحب حيث يتوفر

**التقنيات:** Freezed · Repository merge · Shell tab.

---

### متطلب 13 — طوابير الانتظار العامة (Public Display Queues)

**المتطلب:** شاشة طوابير الأقسام بدون الحاجة لإرسال Authorization، مع تمييز رقم ولي الأمر إن وُجد.

**Endpoint:**

| Method | Path | Auth |
|---|---|---|
| `GET` | `/display/queues` | عام — `skipAuth: true` |

**كيف حقّقناه:**

1. `DisplayQueuesRemoteSource` يستدعي المسار مع `Options(extra: {skipAuth: true})` حتى لا يحقن الـ interceptor توكنًا.
2. `DisplayQueuesRepository` يحفظ آخر لقطة للعرض عند انقطاع الشبكة.
3. الشاشة `/queues` تعرض الأقسام بعد ترجمة الأكواد:

| كود API | الاسم في الواجهة |
|---|---|
| `clinic` | **عيادة خارجية** |
| `daycare` | **مستشفى نهاري** |
| `inpatient` | **قسم داخلي** |

4. حالات الرمز: `waiting` · `called` · `is_emergency`.
5. إذا طابق رقم ولي الأمر رمزًا في الطابور يُميَّز الصف.

مثال استجابة:

```json
{
  "departments": [
    { "department": "clinic", "tokens": [ ... ] },
    { "department": "daycare", "tokens": [ ... ] },
    { "department": "inpatient", "tokens": [] }
  ]
}
```

**التقنيات:** Dio extra flags · Freezed `display_queue.dart` · ميزة مستقلة تحت `features/display_queues/`.

---

### متطلب 14 — إشعارات Push (FCM) + تسجيل جهاز على الخادم

**المتطلب:** استقبال إشعارات من Firebase وربط توكن الجهاز بحساب ولي الأمر.

**Endpoints:**

| Method | Path | الجسم |
|---|---|---|
| `POST` | `/guardian/device-tokens` | `{ "token": "...", "platform": "android\|ios" }` |
| `DELETE` | `/guardian/device-tokens` | `{ "token": "..." }` |

**كيف حقّقناه:**

1. تهيئة Firebase في `main.dart` داخل `_initFirebaseGuarded()` — إن فشل الإعداد يستمر التطبيق **بدون تعطيل** باقي الميزات.
2. تسجيل `FirebaseMessaging.onBackgroundMessage` فقط عند نجاح Firebase.
3. `NotificationService.init()` يطلب الأذونات ويربط المستمعين.
4. عند توفر جلسة: تسجيل التوكن عبر Repository → API.
5. قبل تسجيل الخروج: `DELETE` للتوكن ثم مسح الجلسة.
6. Foreground: عرض محلي بصوت واهتزاز عبر `flutter_local_notifications`.
7. النقر يفتح مسارًا عبر `deepLink` أو اشتقاق من `type` + `relatedId`.
8. Android: `google-services.json` + إضافة Gradle `com.google.gms.google-services`.

**التقنيات:** firebase_core · firebase_messaging · flutter_local_notifications · ربط callbacks من `BasmaApp` إلى Repository عبر Riverpod.

---

### متطلب 15 — صندوق وارد الإشعارات (Offline-first)

**المتطلب:** قائمة إشعارات قابلة للمزامنة والتعليم كمقروء مع كاش محلي.

**Endpoints:**

| Method | Path |
|---|---|
| `GET` | `/guardian/notifications` |
| `PATCH` | `/guardian/notifications/{id}/read` |
| `PATCH` | `/guardian/notifications/read-all` |

**شكل العنصر:** `id`, `type`, `message`, `timestamp`, `relatedId`, `isRead`, `deepLink`.

**كيف حقّقناه:**

1. المزامنة تحفظ القائمة في Hive تحت `notifications`.
2. الشاشة `/notifications` تدعم السحب للتحديث.
3. تعليم واحد / تعليم الكل يحدّث الخادم ثم الكاش فورًا حتى تظهر الحالة بدون إنترنت لاحقًا.
4. عند وصول Push يمكن استدعاء `onInboxRefresh` لمزامنة الصندوق.

**التقنيات:** Freezed `NotificationItem` · Hive · pull-to-refresh · deep link عبر `GoRouter.push`.

---

### متطلب 16 — الشاشة الرئيسية ولوحة الوصول السريع

**المتطلب:** ملخص يومي داعم لولي الأمر في أول شاشة بعد الدخول.

**محتوى `/` (Home):**

- ترحيب باسم ولي الأمر / الطفل النشط
- بطاقة Check-in QR
- تذكير الجرعة القادم
- شريط رحلة العلاج
- اختصارات: الطوابير، الإشعارات، الملف، … 

**التقنيات:** Riverpod selectors على الكاش · بطاقات من `core/widgets` · تنقل `context.push`.

---

### متطلب 17 — السجل الطبي للطفل (قراءة فقط + إخفاء حساس)

**المتطلب:** عرض معلومات الطفل بأقل امتياز، بدون حقول وفاة أو تشخيصات مقلقة.

**كيف حقّقناه:**

- الشاشة `/record` معلَّمة كقراءة فقط في التعليقات والتنفيذ.
- نموذج `ChildSummary` لا يتضمن حقول حالة حياة / وفاة.
- أدوات إخفاء في `lib/core/utils/masking.dart`:
  - `Masking.maskId`
  - `Masking.maskPhone`
- لا توجد أي واجهة تكتب بيانات سريرية إلى API من دور ولي الأمر.

**التقنيات:** least-privilege models · masking utils · UI read-only.

---

### متطلب 18 — الملف الشخصي والتفضيلات وتسجيل الخروج

**المسار:** `/profile`

**المحتوى المحقّق:**

- بيانات ولي الأمر من `/guardian/me`
- قائمة الأطفال وتحديثها من `/guardian/children`
- تبديل الطفل النشط
- تفضيلات تذكير الجرعة / تنبيهات النتائج (`GuardianPrefs` في Hive)
- تسجيل خروج: إلغاء FCM على الخادم → `POST /auth/logout` (best-effort) → مسح الجلسة والكاش المرتبط

**التقنيات:** Riverpod · SessionStorage.clear · NotificationService unregister.

---

### متطلب 19 — نظام تصميم بسمة (Care / Hope / Sun)

**المتطلب:** هوية بصرية هادئة ومتسقة، خط عربي، لا وضع داكن.

**كيف حقّقناه في `lib/core/theme/`:**

| الملف | الدور |
|---|---|
| `app_colors.dart` | توكنات الألوان من منصة بسمة |
| `gradients.dart` | خلفيات Care / Hope / Sun |
| `text_styles.dart` | أنماط Tajawal |
| `radii.dart` | نصف قطر أساسي ≈ 16 |
| `app_theme.dart` | تجميع `ThemeData` الفاتح فقط |

**ألوان رئيسية:**

| الدور | اللون | Hex |
|---|---|---|
| Primary (ثقة/رعاية) | أزرق | `#008FD2` |
| Secondary (أمل/تقدم) | أخضر | `#51C672` |
| Accent (دفء/اهتمام) | بنفسجي | `#B25EC5` |
| Highlight (بهجة) | أصفر | `#FACB39` |
| Background | فاتح مزرق | `#F9FDFF` |

**مكوّنات مشتركة:** `core/widgets/` مثل `PrimaryButton`, `AppCard`, `EmptyState`, `SectionHeader`.

**التقنيات:** Material 3 · google_fonts · توكنات لونية مركزية.

---

### متطلب 20 — إزالة الـ Mock ومنع اختلاط البيانات القديمة

**المتطلب:** بعد ربط الـ API الحقيقي، لا تبقى شخصيات تجريبية قديمة (مثل أم يوسف / يوسف / لانا) تظهر كأنها بيانات حقيقية.

**كيف حقّقناه:**

- `GuardianRepository.ensureSeeded()` يستدعي `_purgeLegacyMockIfPresent()` عند الإقلاع.
- عند تسجيل الدخول: `syncProfile(clearFirst: true)` يمسح بيانات الجلسة السريرية السابقة ثم يملأ من API.
- الأطفال المعروضون يأتون من الخادم (مثل تالا `B-1001`، جنى `B-1002` حسب بيانات الحساب).

**التقنيات:** منطق تنظيف Hive · مزامنة استبدالية وليس دمجًا أعمى مع mock.

---

### متطلب 21 — جودة ثابتة وتحليل نظيف

**المتطلب:** المشروع يمرّ `flutter analyze` بدون قضايا.

**كيف حقّقناه:**

- تفعيل `flutter_lints` عبر `analysis_options.yaml`
- استثناءات مدروسة لتوليدات Freezed عند الحاجة
- نماذج وخدمات مكتوبة بأنواع واضحة ورسائل `debugPrint` للتشخيص أثناء التطوير

**الأمر:**

```bash
flutter analyze
```

---

## 6) كتالوج APIs الكامل (مرجع سريع)

Base: `https://api.basma-unit.cloud/api`

### Auth

| Method | Path | ملاحظات |
|---|---|---|
| POST | `/auth/login` | يحفظ Bearer |
| GET | `/auth/me` | استعادة/تحقق |
| POST | `/auth/logout` | best-effort |

### Guardian (محمي · غالبًا camelCase)

| Method | Path |
|---|---|
| GET | `/guardian/me` |
| GET | `/guardian/children` |
| GET | `/guardian/children/{fileNo}/record` |
| GET | `/guardian/children/{fileNo}/treatment-journey` |
| GET | `/guardian/children/{fileNo}/lab-results` |
| GET | `/guardian/children/{fileNo}/lab-results/{id}/download` |
| PATCH | `/guardian/children/{fileNo}/lab-results/{id}/read` |
| GET | `/guardian/children/{fileNo}/discharge-reports` |
| GET | `/guardian/children/{fileNo}/dose-reminder` |
| GET | `/guardian/children/{fileNo}/check-in-token` |
| GET | `/guardian/children/{fileNo}/appointments` |
| POST | `/guardian/device-tokens` |
| DELETE | `/guardian/device-tokens` |
| GET | `/guardian/notifications` |
| PATCH | `/guardian/notifications/{id}/read` |
| PATCH | `/guardian/notifications/read-all` |

### Public

| Method | Path | Auth |
|---|---|---|
| GET | `/display/queues` | بدون Authorization (`skipAuth`) |

---

## 7) الشاشات والمسارات

| المسار | الشاشة | ملاحظات التحقيق |
|---|---|---|
| `/login` | تسجيل الدخول | تحقق حقول + قفل 5 محاولات + API |
| `/` | الرئيسية | ملخص من الكاش + اختصارات |
| `/qr` | QR ملء الشاشة | رفع سطوع + `fileNoBasma` |
| `/queues` | طوابير عامة | Public API + تمييز الرمز |
| `/record` | السجل الطبي | قراءة فقط + إخفاء حساس |
| `/journey` | رحلة العلاج | من الخطة المخزّنة |
| `/results` · `/results/:id` | التحاليل | PATCH مقروء + PDF |
| `/discharge` · `/discharge/:id` | التخريج | بدون تصدير |
| `/appointments` | المواعيد | تبويب سفلي |
| `/notifications` | الإشعارات | كاش + سحب للتحديث |
| `/profile` | الملف | تبديل طفل + تفضيلات + خروج |

**التبويبات السفلية (`AppShell`):** الرئيسية · السجل · التحاليل · المواعيد.

حماية المسارات: غير المسجّل → `/login`؛ المسجّل على `/login` → `/`.

---

## 8) تدفق الإقلاع (Bootstrap) بالتفصيل

ترتيب `main.dart` مقصود وليس عشوائيًا:

1. `WidgetsFlutterBinding.ensureInitialized()`
2. ضبط اللغة العربية للتواريخ
3. تهيئة `LocalCache` (Hive)
4. تهيئة `SessionStorage` (مع try/catch حتى لا يفشل الإقلاع)
5. تهيئة `ApiClient` وربطه بالجلسة **قبل** أي Repository يلمس الشبكة
6. `GuardianRepository.ensureSeeded()` لتنظيف الـ mock القديم
7. تهيئة Firebase بحماية
8. تسجيل خلفية FCM إن لزم
9. تهيئة `NotificationService`
10. إعادة جدولة تذكير الجرعة من الكاش المحلي
11. `runApp(ProviderScope(child: BasmaApp()))`

بعد أول إطار في `BasmaApp`: التحقق من `/auth/me` ومزامنة الملف دون حجب الواجهة.

---

## 9) مصفوفة المتطلب → الملف الأساسي → التقنية

| المتطلب | الملف / المجلد الأهم | التقنية المفتاحية |
|---|---|---|
| عربي RTL + فاتح | `lib/app.dart`, `core/theme/` | localization · ThemeData light · Tajawal |
| معمارية نظيفة | `lib/features/**`, `lib/core/**` | Clean + Feature-first · Riverpod |
| مصادقة | `features/auth/**`, `session_storage.dart`, `api_client.dart` | Dio · Secure Storage · go_router |
| ولي الأمر/أطفال | `guardian_remote_source.dart`, `guardian_repository.dart` | REST · Hive |
| Offline-first | `local_cache.dart` | Hive box `basma_cache` |
| سجل شامل + fallback | `guardian_repository.dart` | `/record` ثم granular sync |
| رحلة علاج | `features/treatment_journey/` | Freezed treatment models |
| تحاليل + PDF | `features/lab_results/` | PATCH read · printing |
| تخريج بلا تصدير | `features/discharge_reports/` | UI read-only |
| تذكير جرعة | `notification_service.dart` | timezone schedules |
| Check-in QR | `features/checkin_qr/` | qr_flutter · screen_brightness |
| مواعيد | `features/appointments/` | cache + shell tab |
| طوابير عامة | `features/display_queues/` | skipAuth · public GET |
| FCM | `notification_service.dart`, `fcm_service.dart` | Firebase Messaging |
| صندوق وارد | `features/notifications/` | Hive + PATCH APIs |
| خصوصية | `models/child.dart`, `utils/masking.dart` | least privilege · masking |
| لا بصمة | — (محذوف) | لا `local_auth` |
| تصميم بسمة | `core/theme/*`, `core/widgets/*` | توكنات لونية · مكوّنات مشتركة |

---

## 10) أوامر مفيدة للمطور

```bash
# تثبيت الاعتماديات
flutter pub get

# توليد Freezed / JSON
dart run build_runner build --delete-conflicting-outputs

# تحليل ثابت
flutter analyze

# تشغيل على جهاز/محاكي
flutter run
```

---

## 11) غير مُدرَج عمداً (Non-goals)

هذه ليست نواقص نسيتْها؛ قرارات منتج صريحة:

| البند | السبب |
|---|---|
| لا تعديل بيانات سريرية من ولي الأمر | صلاحيات قراءة فقط / least privilege |
| لا بصمة / PIN محلي | أُزيلت عمدًا من المتطلبات النهائية |
| لا تصدير تقارير التخريج من الواجهة | خصوصية وقرار منتج |
| لا عرض تشخيصات مقلقة أو حالات وفاة | حماية نفسية لولي الأمر |
| لا دور طبيب/ممرضة | التطبيق لولي الأمر فقط |
| لا Dark Mode | هوية بسمة الفاتحة الثابتة |
| لا اعتماد على mock بعد الربط | مصدر الحقيقة هو الـ API + الكاش الناتج عنه |

---

## 12) ملخص تنفيذي لكيفية «إغلاق» المشروع تقنيًا

1. **Flutter + Riverpod + go_router** للواجهة والحالة والتنقّل.
2. **Dio** لكل REST على `https://api.basma-unit.cloud/api`.
3. **Hive** كمصدر عرض دائم (Offline-first) مع مزامنة عند النجاح.
4. **Freezed/json_serializable** لعقود بيانات صارمة بين camelCase و snake_case.
5. **Secure Storage** للجلسة + استعادة مرنة عند انقطاع الشبكة.
6. **Firebase Messaging + إشعارات محلية** للـ Push وصندوق الوارد وتذكير الجرعة.
7. **QR + سطوع الشاشة** لتجربة Check-in عملية في العيادة.
8. **ثيم بسمة الفاتح + Tajawal + RTL** لهوية عربية هادئة ومتسقة.

بهذا يتحقق كل متطلب وظيفي وغير وظيفي للتطبيق ضمن حدود دور ولي الأمر، مع مسار واضح من الشاشة → Provider → Repository → API/Hive.
