import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../core/services/api_client.dart';
import '../../../models/checkin.dart';
import '../../../models/child.dart';
import '../../../models/clinical.dart';
import '../../../models/notification_item.dart';
import '../../../models/patient_record.dart';
import '../../../models/treatment.dart';

/// Remote data source for guardian profile / children / clinical endpoints.
class GuardianRemoteSource {
  GuardianRemoteSource({Dio? dio}) : _dioOverride = dio;

  final Dio? _dioOverride;

  Dio get _dio => _dioOverride ?? ApiClient.instance.dio;

  /// `GET /guardian/me`
  Future<GuardianProfile> fetchMe() async {
    final response = await _dio.get<Map<String, dynamic>>('/guardian/me');
    final data = response.data;
    if (data == null) {
      throw StateError('Empty /guardian/me response');
    }
    final profile = GuardianProfile.fromJson(data);
    debugPrint(
      'GET /guardian/me OK — ${profile.name}, '
      '${profile.children.length} child(ren)',
    );
    return profile;
  }

  /// `GET /guardian/children`
  Future<List<ChildSummary>> fetchChildren() async {
    final response =
        await _dio.get<Map<String, dynamic>>('/guardian/children');
    final data = response.data;
    if (data == null) {
      throw StateError('Empty /guardian/children response');
    }
    final list = ChildrenListResponse.fromJson(data).children;
    debugPrint('GET /guardian/children OK — ${list.length} child(ren)');
    return list;
  }

  /// `GET /guardian/children/{fileNo}/record` — full clinical bundle (camelCase).
  Future<PatientRecord> fetchChildRecord(String fileNo) async {
    final encoded = Uri.encodeComponent(fileNo);
    final response = await _dio.get<Map<String, dynamic>>(
      '/guardian/children/$encoded/record',
    );
    final data = response.data;
    if (data == null) {
      throw StateError('Empty /guardian/children/$fileNo/record response');
    }
    final record = PatientRecord.fromJson(data);
    debugPrint(
      'GET child record OK — $fileNo / '
      '${record.child.firstName} / labs=${record.labResults.length} / '
      'token=${record.checkInToken?.number}',
    );
    return record;
  }

  /// `GET /guardian/children/{fileNo}/treatment-journey`
  Future<TreatmentPlanView> fetchTreatmentJourney(String fileNo) async {
    final encoded = Uri.encodeComponent(fileNo);
    final response = await _dio.get<Map<String, dynamic>>(
      '/guardian/children/$encoded/treatment-journey',
    );
    final data = response.data;
    if (data == null) {
      return const TreatmentPlanView();
    }
    final plan = TreatmentPlanView.fromJson(data);
    debugPrint(
      'GET treatment-journey OK — $fileNo / '
      '${plan.planName} (${plan.stages.length} stages)',
    );
    return plan;
  }

  /// `GET /guardian/children/{fileNo}/lab-results`
  Future<List<LabResultView>> fetchLabResults(String fileNo) async {
    final encoded = Uri.encodeComponent(fileNo);
    final response = await _dio.get<Map<String, dynamic>>(
      '/guardian/children/$encoded/lab-results',
    );
    final data = response.data;
    if (data == null) return const [];
    final list = LabResultsResponse.fromJson(data).labResults;
    debugPrint('GET lab-results OK — $fileNo / ${list.length} result(s)');
    return list;
  }

  /// `GET /guardian/children/{fileNo}/lab-results/{id}/download`
  Future<Uint8List> downloadLabResultPdf(String fileNo, String resultId) async {
    final encodedFile = Uri.encodeComponent(fileNo);
    final encodedId = Uri.encodeComponent(resultId);
    final response = await _dio.get<List<int>>(
      '/guardian/children/$encodedFile/lab-results/$encodedId/download',
      options: Options(
        responseType: ResponseType.bytes,
        // PDFs are binary; avoid JSON transformers.
        followRedirects: true,
      ),
    );
    final raw = response.data;
    if (raw == null || raw.isEmpty) {
      throw StateError('Empty lab-result PDF for $fileNo / $resultId');
    }
    debugPrint(
      'GET lab-result download OK — $fileNo / $resultId / ${raw.length} bytes',
    );
    return Uint8List.fromList(raw);
  }

  /// `PATCH /guardian/children/{fileNo}/lab-results/{id}/read`
  Future<void> markLabResultRead(String fileNo, String resultId) async {
    final encodedFile = Uri.encodeComponent(fileNo);
    final encodedId = Uri.encodeComponent(resultId);
    await _dio.patch<void>(
      '/guardian/children/$encodedFile/lab-results/$encodedId/read',
    );
    debugPrint('PATCH lab-result read OK — $fileNo / $resultId');
  }

  /// `GET /guardian/children/{fileNo}/discharge-reports`
  Future<List<DischargeReportView>> fetchDischargeReports(
    String fileNo,
  ) async {
    final encoded = Uri.encodeComponent(fileNo);
    final response = await _dio.get<Map<String, dynamic>>(
      '/guardian/children/$encoded/discharge-reports',
    );
    final data = response.data;
    if (data == null) return const [];
    final list = DischargeReportsResponse.fromJson(data).dischargeReports;
    debugPrint(
      'GET discharge-reports OK — $fileNo / ${list.length} report(s)',
    );
    return list;
  }

  /// `GET /guardian/children/{fileNo}/dose-reminder`
  ///
  /// Returns `null` when the API sends `"doseReminder": null`.
  Future<DoseReminderModel?> fetchDoseReminder(String fileNo) async {
    final encoded = Uri.encodeComponent(fileNo);
    final response = await _dio.get<dynamic>(
      '/guardian/children/$encoded/dose-reminder',
    );
    final data = response.data;
    if (data == null) return null;

    if (data is Map<String, dynamic>) {
      final raw = data['doseReminder'];
      if (raw == null) {
        debugPrint('GET dose-reminder OK — $fileNo / null');
        return null;
      }
      if (raw is String) {
        final parsed = DateTime.tryParse(raw);
        debugPrint('GET dose-reminder OK — $fileNo / $parsed');
        return parsed == null
            ? null
            : DoseReminderModel(nextDoseDate: parsed);
      }
      if (raw is Map<String, dynamic>) {
        final model = DoseReminderModel.fromJson(raw);
        debugPrint(
          'GET dose-reminder OK — $fileNo / ${model.nextDoseDate}',
        );
        return model;
      }
    }

    debugPrint('GET dose-reminder unexpected payload for $fileNo');
    return null;
  }

  /// `GET /guardian/children/{fileNo}/check-in-token` (snake_case payload).
  Future<CheckInToken?> fetchCheckInToken(String fileNo) async {
    final encoded = Uri.encodeComponent(fileNo);
    final response = await _dio.get<Map<String, dynamic>>(
      '/guardian/children/$encoded/check-in-token',
    );
    final data = response.data;
    if (data == null) return null;
    final parsed = CheckInTokenResponse.fromJson(data);
    final token = parsed.checkInToken;
    debugPrint(
      'GET check-in-token OK — $fileNo / '
      '${token == null ? 'null' : token.number}',
    );
    return token;
  }

  /// `GET /guardian/children/{fileNo}/appointments` (snake_case payload).
  Future<List<AppointmentView>> fetchAppointments(String fileNo) async {
    final encoded = Uri.encodeComponent(fileNo);
    final response = await _dio.get<Map<String, dynamic>>(
      '/guardian/children/$encoded/appointments',
    );
    final data = response.data;
    if (data == null) return const [];

    final rawList = data['appointments'];
    if (rawList is! List) return const [];

    final list = <AppointmentView>[];
    for (final item in rawList) {
      if (item is! Map) continue;
      final map = Map<String, dynamic>.from(item);
      map['date_time'] ??=
          map['dateTime'] ?? map['datetime'] ?? map['date'];
      map['is_next_dose'] ??= map['isNextDose'];
      map['id'] ??= map['appointment_id'] ?? map['appointmentId'];
      try {
        list.add(AppointmentView.fromJson(map));
      } catch (e) {
        debugPrint('Skipping malformed appointment item: $e / $map');
      }
    }

    debugPrint('GET appointments OK — $fileNo / ${list.length} appointment(s)');
    return list;
  }

  // ---- Device tokens & inbox ----------------------------------------------

  /// `POST /guardian/device-tokens` — body: `{ token, platform }`.
  Future<void> registerDeviceToken({
    required String fcmToken,
    required String platform,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/guardian/device-tokens',
      data: {
        'token': fcmToken,
        'platform': platform,
      },
    );
    debugPrint(
      'POST device-tokens OK — platform=$platform '
      'registered=${response.data?['registered']} id=${response.data?['id']}',
    );
  }

  /// `DELETE /guardian/device-tokens` — body: `{ token }`.
  Future<void> unregisterDeviceToken({required String fcmToken}) async {
    final response = await _dio.delete<Map<String, dynamic>>(
      '/guardian/device-tokens',
      data: {'token': fcmToken},
    );
    debugPrint(
      'DELETE device-tokens OK — removed=${response.data?['removed']}',
    );
  }

  /// `GET /guardian/notifications`
  Future<List<NotificationItem>> fetchNotifications() async {
    final response =
        await _dio.get<Map<String, dynamic>>('/guardian/notifications');
    final data = response.data;
    if (data == null) return const [];
    final list = NotificationsListResponse.fromJson(data).notifications;
    debugPrint('GET notifications OK — ${list.length} item(s)');
    return list;
  }

  /// `PATCH /guardian/notifications/{id}/read`
  Future<void> markNotificationRead(String id) async {
    final encoded = Uri.encodeComponent(id);
    await _dio.patch<void>('/guardian/notifications/$encoded/read');
    debugPrint('PATCH notification read OK — $id');
  }

  /// `PATCH /guardian/notifications/read-all`
  Future<void> markAllNotificationsRead() async {
    await _dio.patch<void>('/guardian/notifications/read-all');
    debugPrint('PATCH notifications read-all OK');
  }
}
