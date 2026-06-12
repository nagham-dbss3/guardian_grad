import '../models/child.dart';
import '../models/checkin.dart';
import '../models/clinical.dart';
import '../models/notification_item.dart';
import '../models/patient_record.dart';
import '../models/treatment.dart';

/// Seed mock data for the Guardian app. No backend — this is the single source
/// of truth that is persisted into Hive on first launch for offline use.
class MockData {
  MockData._();

  static DateTime _at(int dayOffset, [int hour = 9, int minute = 0]) {
    final now = DateTime.now();
    final base = DateTime(now.year, now.month, now.day, hour, minute);
    return base.add(Duration(days: dayOffset));
  }

  // ---- Children -----------------------------------------------------------

  static const ChildSummary _yousef = ChildSummary(
    fileNoBasma: 'BSM-100245',
    firstName: 'يوسف',
    familyName: 'الأحمد',
    age: 7,
    gender: 'ذكر',
    currentPhase: 'مرحلة التوحيد',
    nationalIdMasked: '••••••6789',
    guardianRelationship: 'الأم',
  );

  static const ChildSummary _lana = ChildSummary(
    fileNoBasma: 'BSM-100388',
    firstName: 'لانا',
    familyName: 'الأحمد',
    age: 4,
    gender: 'أنثى',
    currentPhase: 'مرحلة الصيانة',
    nationalIdMasked: '••••••4521',
    guardianRelationship: 'الأم',
  );

  static GuardianProfile guardian() => const GuardianProfile(
        id: 'G-001',
        name: 'أم يوسف',
        relationshipToChild: 'الأم',
        contactPhone: '0911234567',
        contactEmail: 'family@example.com',
        children: [_yousef, _lana],
      );

  // ---- Records ------------------------------------------------------------

  static PatientRecord recordYousef() => PatientRecord(
        child: _yousef,
        lastUpdated: DateTime.now(),
        diseaseOverview: const DiseaseOverview(
          category: 'أمراض الدم',
          summary:
              'يوسف يتلقى علاجًا منتظمًا تحت إشراف فريق وحدة بسمة. الخطة تسير '
              'وفق المتوقع، والفريق يتابع حالته باستمرار. نحن معكم في كل خطوة، '
              'ولا تترددوا في التواصل مع الوحدة لأي استفسار.',
        ),
        treatmentPlan: const TreatmentPlanView(
          planName: 'بروتوكول العلاج — وحدة بسمة',
          stages: [
            StageView(
              name: 'مرحلة الحَث',
              status: StageStatus.completed,
              medsSummary: 'جلسات الحَث الأولية',
              visitsSummary: 'زيارات منتظمة خلال الشهر الأول',
            ),
            StageView(
              name: 'مرحلة التوحيد',
              status: StageStatus.current,
              medsSummary: 'جرعات دورية حسب البروتوكول',
              visitsSummary: 'زيارة كل أسبوعين تقريبًا',
            ),
            StageView(
              name: 'مرحلة الصيانة',
              status: StageStatus.upcoming,
              medsSummary: 'جرعات مداومة لطيفة',
              visitsSummary: 'متابعة شهرية',
            ),
          ],
        ),
        labResults: [
          LabResultView(
            id: 'LR-3001',
            testType: 'تعداد الدم الكامل (CBC)',
            resultDate: _at(-2, 11),
            status: 'مكتملة',
            pdfPath: 'cbc_3001',
            isRead: false,
            summary: 'النتائج ضمن المتابعة المعتادة لفريق العلاج.',
          ),
          LabResultView(
            id: 'LR-3002',
            testType: 'خزعة',
            resultDate: _at(-9, 10),
            status: 'مكتملة',
            pdfPath: 'biopsy_3002',
            isRead: true,
            isBiopsy: true,
            summary: 'تمت مراجعة نتيجة الخزعة من قبل الطبيب المختص.',
          ),
          LabResultView(
            id: 'LR-3003',
            testType: 'وظائف الكبد',
            resultDate: _at(-16, 9),
            status: 'مكتملة',
            pdfPath: 'lft_3003',
            isRead: true,
            summary: 'النتائج ضمن المعدل المتابع.',
          ),
        ],
        dischargeReports: [
          DischargeReportView(
            id: 'DR-5001',
            generatedAt: _at(-2, 13),
            lastDoseDate: _at(-2, 13),
            nextDoseDate: _at(1, 10),
            nextVisitDepartment: 'نهاري',
            doctorInstructions:
                'الراحة وشرب السوائل، ومراقبة الحرارة. في حال ارتفاع الحرارة '
                'فوق ٣٨° يرجى التواصل مع الوحدة فورًا.',
            prescription: [
              const PrescriptionItem(
                med: 'دواء داعم',
                dose: 'مرة يوميًا بعد الطعام',
                instructions: 'يُعطى صباحًا',
              ),
              const PrescriptionItem(
                med: 'مكمل غذائي',
                dose: 'حسب توجيه الطبيب',
              ),
            ],
          ),
          DischargeReportView(
            id: 'DR-5000',
            generatedAt: _at(-16, 12),
            lastDoseDate: _at(-16, 12),
            nextDoseDate: _at(-2, 10),
            nextVisitDepartment: 'نهاري',
            doctorInstructions: 'الاستمرار على نفس التعليمات والمتابعة الدورية.',
            prescription: [
              const PrescriptionItem(med: 'دواء داعم', dose: 'مرة يوميًا'),
            ],
          ),
        ],
        appointments: [
          AppointmentView(
            id: 'AP-7001',
            dateTime: _at(1, 10),
            type: 'جرعة علاجية',
            department: 'العيادة النهارية',
            isNextDose: true,
          ),
          AppointmentView(
            id: 'AP-7002',
            dateTime: _at(8, 11),
            type: 'مراجعة طبيب',
            department: 'وحدة بسمة',
          ),
          AppointmentView(
            id: 'AP-7003',
            dateTime: _at(15, 9, 30),
            type: 'تحاليل دورية',
            department: 'المختبر',
          ),
        ],
        checkInToken: CheckInToken(
          number: 'A-12',
          department: 'العيادة النهارية',
          issueTime: _at(0, 8),
          bookingTime: _at(0, 10),
          status: 'issued',
        ),
      );

  static PatientRecord recordLana() => PatientRecord(
        child: _lana,
        lastUpdated: DateTime.now(),
        diseaseOverview: const DiseaseOverview(
          category: 'متابعة علاجية',
          summary:
              'لانا في مرحلة الصيانة وتسير حالتها بشكل مطمئن. يواصل الفريق '
              'المتابعة الدورية اللطيفة. نتمنى لها دوام العافية.',
        ),
        treatmentPlan: const TreatmentPlanView(
          planName: 'بروتوكول العلاج — وحدة بسمة',
          stages: [
            StageView(name: 'مرحلة الحَث', status: StageStatus.completed),
            StageView(name: 'مرحلة التوحيد', status: StageStatus.completed),
            StageView(name: 'مرحلة الصيانة', status: StageStatus.current),
          ],
        ),
        labResults: [
          LabResultView(
            id: 'LR-4001',
            testType: 'تعداد الدم الكامل (CBC)',
            resultDate: _at(-5, 10),
            status: 'مكتملة',
            pdfPath: 'cbc_4001',
            isRead: true,
            summary: 'النتائج ضمن المتابعة المعتادة.',
          ),
        ],
        dischargeReports: [
          DischargeReportView(
            id: 'DR-6001',
            generatedAt: _at(-5, 12),
            lastDoseDate: _at(-5, 12),
            nextDoseDate: _at(3, 11),
            nextVisitDepartment: 'نهاري',
            doctorInstructions: 'المتابعة الشهرية والاستمرار على الجرعات اللطيفة.',
            prescription: [
              const PrescriptionItem(med: 'جرعة مداومة', dose: 'حسب البروتوكول'),
            ],
          ),
        ],
        appointments: [
          AppointmentView(
            id: 'AP-8001',
            dateTime: _at(3, 11),
            type: 'جرعة مداومة',
            department: 'العيادة النهارية',
            isNextDose: true,
          ),
        ],
        checkInToken: null,
      );

  /// fileNoBasma -> record
  static Map<String, PatientRecord> records() => {
        _yousef.fileNoBasma: recordYousef(),
        _lana.fileNoBasma: recordLana(),
      };

  static List<NotificationItem> notifications() => [
        NotificationItem(
          id: 'N-1',
          type: AppNotificationType.doseReminder,
          message: 'تذكير: لديكم جرعة يوسف غدًا في العيادة النهارية.',
          timestamp: _at(0, 8, 30),
          relatedId: 'DR-5001',
          deepLink: '/appointments',
          isRead: false,
        ),
        NotificationItem(
          id: 'N-2',
          type: AppNotificationType.resultArrived,
          message: 'وصلت نتيجة جديدة: تعداد الدم الكامل (CBC).',
          timestamp: _at(-2, 11),
          relatedId: 'LR-3001',
          deepLink: '/results/LR-3001',
          isRead: false,
        ),
        NotificationItem(
          id: 'N-3',
          type: AppNotificationType.update,
          message: 'تم تحديث تقرير التخريج الأخير لطفلكم.',
          timestamp: _at(-2, 13, 30),
          relatedId: 'DR-5001',
          deepLink: '/discharge/DR-5001',
          isRead: true,
        ),
      ];
}
