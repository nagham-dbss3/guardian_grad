import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/services/notification_service.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/initials.dart';
import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/section_header.dart';
import '../../../models/child.dart';
import '../../auth/data/auth_providers.dart';
import '../../shared/data/guardian_providers.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    // Refresh children from API when the profile (switcher) is opened.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(guardianControllerProvider.notifier).syncChildren();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(guardianControllerProvider);
    final controller = ref.read(guardianControllerProvider.notifier);
    final guardian = ref.watch(guardianProfileProvider);
    final prefs = state.prefs;

    return Scaffold(
      appBar: AppBar(title: const Text('الملف الشخصي')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
        children: [
          // Guardian header
          AppCard(
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 28,
                  backgroundColor: AppColors.accentSoft,
                  child: Icon(Icons.person_rounded,
                      color: AppColors.accent, size: 30),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(guardian.name,
                          style: Theme.of(context).textTheme.titleLarge),
                      Text(guardian.relationshipToChild,
                          style: const TextStyle(
                              color: AppColors.mutedForeground)),
                      if (guardian.contactPhone != null)
                        Text(guardian.contactPhone!,
                            style: const TextStyle(
                                color: AppColors.mutedForeground,
                                fontSize: 12.5)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Child switcher
          if (guardian.children.length > 1) ...[
            const SectionHeader(
                title: 'تبديل الطفل', icon: Icons.switch_account_rounded),
            const SizedBox(height: 12),
            ...guardian.children.map((child) => _ChildOption(
                  child: child,
                  selected: child.fileNoBasma == state.activeFileNo,
                  onTap: () => controller.switchChild(child.fileNoBasma),
                )),
            const SizedBox(height: 20),
          ],

          // Notification preferences
          const SectionHeader(
              title: 'إعدادات الإشعارات',
              icon: Icons.notifications_active_rounded),
          const SizedBox(height: 12),
          AppCard(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Column(
              children: [
                SwitchListTile(
                  value: prefs.doseReminders,
                  activeTrackColor: AppColors.secondary,
                  title: const Text('تذكيرات الجرعات'),
                  subtitle: const Text('تذكير قبل موعد الجرعة'),
                  onChanged: (v) async {
                    await controller
                        .updatePrefs(prefs.copyWith(doseReminders: v));
                    // Re-apply scheduling immediately.
                    await NotificationService.instance.rescheduleDoseReminders(
                      ref.read(activeRecordProvider),
                      enabled: v,
                    );
                  },
                ),
                const Divider(height: 1),
                SwitchListTile(
                  value: prefs.resultAlerts,
                  activeTrackColor: AppColors.secondary,
                  title: const Text('إشعارات النتائج'),
                  subtitle: const Text('تنبيه عند وصول نتيجة جديدة'),
                  onChanged: (v) =>
                      controller.updatePrefs(prefs.copyWith(resultAlerts: v)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Language
          const SectionHeader(title: 'اللغة', icon: Icons.language_rounded),
          const SizedBox(height: 12),
          const AppCard(
            child: Row(
              children: [
                Icon(Icons.check_circle_rounded, color: AppColors.success),
                SizedBox(width: 10),
                Text('العربية', style: TextStyle(fontWeight: FontWeight.w700)),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Logout
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.destructive,
              side: const BorderSide(color: AppColors.destructive),
            ),
            onPressed: () => _logout(context, ref),
            icon: const Icon(Icons.logout_rounded),
            label: const Text('تسجيل الخروج'),
          ),
        ],
      ),
    );
  }

  Future<void> _logout(BuildContext context, WidgetRef ref) async {
    // Unregister FCM while auth Bearer is still valid, then clear session.
    await ref.read(guardianControllerProvider.notifier).clearSessionCache();
    await ref.read(authServiceProvider).logout();
    if (context.mounted) context.go('/login');
  }
}

class _ChildOption extends StatelessWidget {
  const _ChildOption({
    required this.child,
    required this.selected,
    required this.onTap,
  });
  final ChildSummary child;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: AppCard(
        onTap: onTap,
        color: selected ? AppColors.primarySoft : null,
        borderColor: selected ? AppColors.primary : null,
        child: Row(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor:
                  selected ? AppColors.primary : AppColors.muted,
              child: Text(
                initialLetter(child.firstName),
                style: TextStyle(
                  color: selected ? Colors.white : AppColors.foreground,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(child.fullName,
                      style: const TextStyle(fontWeight: FontWeight.w700)),
                  Text(child.currentPhase,
                      style: const TextStyle(
                          color: AppColors.mutedForeground, fontSize: 12.5)),
                ],
              ),
            ),
            if (selected)
              const Icon(Icons.check_circle_rounded,
                  color: AppColors.primary),
          ],
        ),
      ),
    );
  }
}
