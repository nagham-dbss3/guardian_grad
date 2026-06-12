import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/date_format_ar.dart';
import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/empty_state.dart';
import '../../../models/notification_item.dart';
import '../../shared/data/guardian_providers.dart';
import 'notification_visuals.dart';

class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(guardianControllerProvider);
    final controller = ref.read(guardianControllerProvider.notifier);
    final notifications = state.notifications;

    return Scaffold(
      appBar: AppBar(
        title: const Text('الإشعارات'),
        actions: [
          if (state.unreadNotifications > 0)
            TextButton(
              onPressed: controller.markAllNotificationsRead,
              child: const Text('تعليم الكل كمقروء'),
            ),
        ],
      ),
      body: notifications.isEmpty
          ? const EmptyState(
              message: 'لا توجد إشعارات',
              icon: Icons.notifications_none_rounded,
            )
          : ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
              itemCount: notifications.length,
              itemBuilder: (context, i) {
                final n = notifications[i];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _NotificationTile(
                    item: n,
                    onTap: () {
                      controller.markNotificationRead(n.id);
                      if (n.deepLink != null) context.push(n.deepLink!);
                    },
                  ),
                );
              },
            ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  const _NotificationTile({required this.item, required this.onTap});
  final NotificationItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      color: item.isRead ? AppColors.card : AppColors.primarySoft,
      borderColor: item.isRead ? null : AppColors.primarySoft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NotificationVisuals.avatar(item.type),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(NotificationVisuals.label(item.type),
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12.5,
                      color: NotificationVisuals.color(item.type),
                    )),
                const SizedBox(height: 4),
                Text(item.message, style: const TextStyle(height: 1.5)),
                const SizedBox(height: 4),
                Text(DateFormatAr.dayDateTime(item.timestamp),
                    style: const TextStyle(
                        color: AppColors.mutedForeground, fontSize: 12)),
              ],
            ),
          ),
          if (!item.isRead)
            const Padding(
              padding: EdgeInsets.only(top: 4),
              child: Icon(Icons.circle, size: 9, color: AppColors.primary),
            ),
        ],
      ),
    );
  }
}
