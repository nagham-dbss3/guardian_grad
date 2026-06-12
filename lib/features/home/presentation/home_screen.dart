import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/gradients.dart';
import '../../../core/theme/radii.dart';
import '../../../core/utils/date_format_ar.dart';
import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/section_header.dart';
import '../../../models/notification_item.dart';
import '../../../models/patient_record.dart';
import '../../../models/treatment.dart';
import '../../shared/data/guardian_providers.dart';
import '../../notifications/presentation/notification_visuals.dart';
import 'widgets/checkin_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  String _greeting() {
    final h = DateTime.now().hour;
    if (h < 12) return 'صباح الخير 🌟';
    if (h < 17) return 'مرحبًا بكم 💙';
    return 'مساء الخير 🌙';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(guardianControllerProvider);
    final record = state.record;
    final child = record.child;

    return RefreshIndicator(
      onRefresh: () async => ref.read(guardianControllerProvider.notifier).refresh(),
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 28),
        children: [
          // Greeting
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_greeting(),
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 2),
                    Text(
                      'عائلة ${child.firstName}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.mutedForeground,
                          ),
                    ),
                  ],
                ),
              ),
              _bell(context, state.unreadNotifications),
            ],
          ),
          const SizedBox(height: 16),

          // Check-in hero
          CheckInCard(
            fileNo: child.fileNoBasma,
            token: record.checkInToken,
            onTap: () => context.push('/qr'),
          ),
          const SizedBox(height: 16),

          // Next dose reminder
          _NextDoseCard(record: record),
          const SizedBox(height: 16),

          // Treatment journey strip
          _JourneyStrip(record: record),
          const SizedBox(height: 20),

          // Quick access grid
          const SectionHeader(title: 'وصول سريع', icon: Icons.grid_view_rounded),
          const SizedBox(height: 12),
          _QuickGrid(),
          const SizedBox(height: 20),

          // Latest updates
          SectionHeader(
            title: 'آخر المستجدات',
            icon: Icons.notifications_active_rounded,
            actionLabel: 'الكل',
            onAction: () => context.push('/notifications'),
          ),
          const SizedBox(height: 12),
          _LatestUpdates(notifications: state.notifications),
          const SizedBox(height: 20),

          // Supportive footer
          _SupportiveFooter(),
        ],
      ),
    );
  }

  Widget _bell(BuildContext context, int unread) {
    return Stack(
      children: [
        IconButton.filledTonal(
          style: IconButton.styleFrom(backgroundColor: AppColors.muted),
          icon: const Icon(Icons.notifications_none_rounded,
              color: AppColors.foreground),
          onPressed: () => context.push('/notifications'),
        ),
        if (unread > 0)
          Positioned(
            right: 6,
            top: 6,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                color: AppColors.destructive,
                shape: BoxShape.circle,
              ),
              constraints: const BoxConstraints(minWidth: 10, minHeight: 10),
            ),
          ),
      ],
    );
  }
}

class _NextDoseCard extends StatelessWidget {
  const _NextDoseCard({required this.record});
  final PatientRecord record;

  @override
  Widget build(BuildContext context) {
    final next = record.nextDoseDate;
    return AppCard(
      onTap: () => context.push('/appointments'),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.secondarySoft,
              borderRadius: BorderRadius.circular(AppRadii.lg),
            ),
            child: const Icon(Icons.medication_liquid_rounded,
                color: AppColors.secondary, size: 26),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('جرعتكم القادمة',
                    style: TextStyle(
                      color: AppColors.mutedForeground,
                      fontSize: 13,
                    )),
                const SizedBox(height: 4),
                if (next != null)
                  Text(
                    'جرعة ${record.child.firstName}: '
                    '${DateFormatAr.relativeDay(next)}'
                    '${_isFuture(next) ? '، ${DateFormatAr.time(next)}' : ''}',
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                else
                  const Text('لا توجد جرعة مجدولة حاليًا',
                      style: TextStyle(fontWeight: FontWeight.w700)),
              ],
            ),
          ),
          const Icon(Icons.chevron_left_rounded, color: AppColors.mutedForeground),
        ],
      ),
    );
  }

  bool _isFuture(DateTime d) => d.isAfter(DateTime.now());
}

class _JourneyStrip extends StatelessWidget {
  const _JourneyStrip({required this.record});
  final PatientRecord record;

  @override
  Widget build(BuildContext context) {
    final stages = record.treatmentPlan.stages;
    final currentIndex = stages.indexWhere((s) => s.status == StageStatus.current);
    final current = currentIndex >= 0 ? stages[currentIndex] : null;

    return AppCard(
      onTap: () => context.push('/journey'),
      color: AppColors.accentSoft,
      borderColor: AppColors.accentSoft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.route_rounded, color: AppColors.accent, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  current != null
                      ? 'أنتم الآن في ${current.name}'
                      : 'رحلة العلاج',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              const Icon(Icons.chevron_left_rounded,
                  color: AppColors.mutedForeground),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              for (var i = 0; i < stages.length; i++) ...[
                Expanded(
                  child: Container(
                    height: 8,
                    decoration: BoxDecoration(
                      color: stages[i].status == StageStatus.upcoming
                          ? Colors.white
                          : AppColors.secondary,
                      borderRadius: AppRadii.pill,
                    ),
                  ),
                ),
                if (i != stages.length - 1) const SizedBox(width: 6),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class _QuickGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = <_QuickItem>[
      const _QuickItem('السجل الطبي', Icons.folder_shared_rounded,
          AppColors.primary, AppColors.primarySoft, '/record'),
      const _QuickItem('خطة العلاج', Icons.route_rounded, AppColors.accent,
          AppColors.accentSoft, '/journey'),
      const _QuickItem('نتائج التحاليل', Icons.science_rounded, AppColors.secondary,
          AppColors.secondarySoft, '/results'),
      const _QuickItem('تقارير التخريج', Icons.description_rounded,
          Color(0xFF9A7B11), AppColors.highlightSoft, '/discharge'),
      const _QuickItem('المواعيد', Icons.event_rounded, AppColors.primary,
          AppColors.primarySoft, '/appointments'),
      const _QuickItem('الملف الشخصي', Icons.person_rounded, AppColors.accent,
          AppColors.accentSoft, '/profile'),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.95,
      ),
      itemBuilder: (context, i) {
        final item = items[i];
        return AppCard(
          padding: const EdgeInsets.all(10),
          onTap: () => context.push(item.route),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(11),
                decoration: BoxDecoration(
                  color: item.bg,
                  borderRadius: BorderRadius.circular(AppRadii.md),
                ),
                child: Icon(item.icon, color: item.color, size: 24),
              ),
              const SizedBox(height: 8),
              Text(
                item.label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.w700, fontSize: 12.5),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _QuickItem {
  const _QuickItem(this.label, this.icon, this.color, this.bg, this.route);
  final String label;
  final IconData icon;
  final Color color;
  final Color bg;
  final String route;
}

class _LatestUpdates extends StatelessWidget {
  const _LatestUpdates({required this.notifications});
  final List<NotificationItem> notifications;

  @override
  Widget build(BuildContext context) {
    final latest = notifications.take(3).toList();
    if (latest.isEmpty) {
      return const AppCard(
        child: Text('لا توجد مستجدات حاليًا 🌿',
            style: TextStyle(color: AppColors.mutedForeground)),
      );
    }
    return Column(
      children: [
        for (final n in latest)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: AppCard(
              padding: const EdgeInsets.all(12),
              onTap: () {
                if (n.deepLink != null) context.push(n.deepLink!);
              },
              child: Row(
                children: [
                  NotificationVisuals.avatar(n.type),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(n.message,
                            maxLines: 2, overflow: TextOverflow.ellipsis),
                        const SizedBox(height: 2),
                        Text(DateFormatAr.relativeDay(n.timestamp),
                            style: const TextStyle(
                                color: AppColors.mutedForeground,
                                fontSize: 12)),
                      ],
                    ),
                  ),
                  if (!n.isRead)
                    const Icon(Icons.circle, size: 9, color: AppColors.primary),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class _SupportiveFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: AppGradients.sun,
        borderRadius: BorderRadius.circular(AppRadii.xl2),
      ),
      child: Column(
        children: [
          const Text(
            'نحن معكم، وكل يوم خطوة نحو الأفضل 🌻',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF5A4708),
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 12),
          FilledButton.tonalIcon(
            style: FilledButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xFF9A7B11),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('سيتم تحويلكم للتواصل مع الوحدة')),
              );
            },
            icon: const Icon(Icons.headset_mic_rounded),
            label: const Text('تواصل مع الوحدة'),
          ),
        ],
      ),
    );
  }
}
