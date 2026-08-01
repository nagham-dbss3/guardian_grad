import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../models/notification_item.dart';

/// Shared visuals for notification types (icon + color + label).
class NotificationVisuals {
  NotificationVisuals._();

  static IconData icon(AppNotificationType type) => switch (type) {
        AppNotificationType.labResult ||
        AppNotificationType.resultArrived =>
          Icons.science_rounded,
        AppNotificationType.appointment => Icons.event_rounded,
        AppNotificationType.dose ||
        AppNotificationType.doseReminder =>
          Icons.medication_liquid_rounded,
        AppNotificationType.update => Icons.info_rounded,
      };

  static Color color(AppNotificationType type) => switch (type) {
        AppNotificationType.labResult ||
        AppNotificationType.resultArrived =>
          AppColors.primary,
        AppNotificationType.appointment => AppColors.accent,
        AppNotificationType.dose ||
        AppNotificationType.doseReminder =>
          AppColors.secondary,
        AppNotificationType.update => AppColors.accent,
      };

  static Color background(AppNotificationType type) => switch (type) {
        AppNotificationType.labResult ||
        AppNotificationType.resultArrived =>
          AppColors.primarySoft,
        AppNotificationType.appointment => AppColors.accentSoft,
        AppNotificationType.dose ||
        AppNotificationType.doseReminder =>
          AppColors.secondarySoft,
        AppNotificationType.update => AppColors.accentSoft,
      };

  static String label(AppNotificationType type) => switch (type) {
        AppNotificationType.labResult ||
        AppNotificationType.resultArrived =>
          'وصول نتيجة',
        AppNotificationType.appointment => 'موعد',
        AppNotificationType.dose ||
        AppNotificationType.doseReminder =>
          'تذكير بالجرعة',
        AppNotificationType.update => 'تحديث',
      };

  static Widget avatar(AppNotificationType type) => Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: background(type),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon(type), color: color(type), size: 22),
      );
}
