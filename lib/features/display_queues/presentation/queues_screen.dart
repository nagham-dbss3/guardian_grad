import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/radii.dart';
import '../../../core/utils/date_format_ar.dart';
import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/empty_state.dart';
import '../../../core/widgets/section_header.dart';
import '../../../models/display_queue.dart';
import '../../shared/data/guardian_providers.dart';
import '../data/display_queues_providers.dart';

/// Public waiting boards — design aligned with the rest of the guardian app.
class QueuesScreen extends ConsumerWidget {
  const QueuesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncQueues = ref.watch(displayQueuesProvider);
    final myToken = ref.watch(checkInTokenProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('طوابير الانتظار')),
      body: asyncQueues.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => const EmptyState(
          message: 'تعذّر تحميل الطوابير',
          subtitle: 'تحققوا من الاتصال وحاولوا مرة أخرى',
          icon: Icons.wifi_off_rounded,
        ),
        data: (queues) {
          final departments = queues.departments;
          if (departments.isEmpty) {
            return RefreshIndicator(
              onRefresh: () =>
                  ref.read(displayQueuesProvider.notifier).refresh(),
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: const [
                  SizedBox(height: 120),
                  EmptyState(
                    message: 'لا توجد طوابير حالياً',
                    subtitle: 'سيتم عرض الأرقام هنا عند فتح الاستقبال',
                    icon: Icons.hourglass_empty_rounded,
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () =>
                ref.read(displayQueuesProvider.notifier).refresh(),
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
              children: [
                if (myToken != null) ...[
                  AppCard(
                    color: AppColors.primarySoft,
                    borderColor: AppColors.primarySoft,
                    child: Row(
                      children: [
                        const Icon(Icons.confirmation_number_rounded,
                            color: AppColors.primary),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'رقمكم الحالي: ${myToken.number} — ${myToken.department}',
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
                for (final dept in departments) ...[
                  SectionHeader(
                    title: dept.departmentLabelAr,
                    icon: _deptIcon(dept.department),
                  ),
                  const SizedBox(height: 12),
                  if (dept.tokens.isEmpty)
                    const AppCard(
                      child: Text(
                        'لا توجد أرقام في هذا القسم حالياً',
                        style: TextStyle(color: AppColors.mutedForeground),
                      ),
                    )
                  else
                    AppCard(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 4),
                      child: Column(
                        children: [
                          for (var i = 0; i < dept.tokens.length; i++) ...[
                            if (i > 0) const Divider(height: 1),
                            _TokenRow(
                              token: dept.tokens[i],
                              isMine: myToken?.number == dept.tokens[i].number,
                            ),
                          ],
                        ],
                      ),
                    ),
                  const SizedBox(height: 20),
                ],
              ],
            ),
          );
        },
      ),
    );
  }

  IconData _deptIcon(String department) {
    switch (department.toLowerCase()) {
      case 'clinic':
        return Icons.local_hospital_rounded;
      case 'daycare':
        return Icons.child_care_rounded;
      case 'inpatient':
        return Icons.hotel_rounded;
      default:
        return Icons.queue_rounded;
    }
  }
}

class _TokenRow extends StatelessWidget {
  const _TokenRow({required this.token, required this.isMine});

  final DisplayQueueToken token;
  final bool isMine;

  @override
  Widget build(BuildContext context) {
    final called = token.status.toLowerCase() == 'called';
    final waiting = token.status.toLowerCase() == 'waiting';

    return Container(
      color: isMine ? AppColors.primarySoft.withValues(alpha: 0.45) : null,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Row(
        children: [
          Container(
            width: 54,
            height: 54,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: token.isEmergency
                  ? AppColors.destructive.withValues(alpha: 0.12)
                  : called
                      ? AppColors.secondarySoft
                      : AppColors.muted,
              borderRadius: BorderRadius.circular(AppRadii.md),
            ),
            child: Text(
              token.number,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 15,
                color: token.isEmergency
                    ? AppColors.destructive
                    : called
                        ? AppColors.success
                        : AppColors.foreground,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _statusLabel(token),
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: called ? AppColors.success : AppColors.foreground,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'صدر: ${DateFormatAr.time(token.issueTime)}',
                  style: const TextStyle(
                    color: AppColors.mutedForeground,
                    fontSize: 12.5,
                  ),
                ),
              ],
            ),
          ),
          if (token.isEmergency)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: const BoxDecoration(
                color: Color(0xFFFFE5E6),
                borderRadius: AppRadii.pill,
              ),
              child: const Text(
                'طارئ',
                style: TextStyle(
                  color: AppColors.destructive,
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              ),
            )
          else if (waiting)
            const Icon(Icons.hourglass_top_rounded,
                color: AppColors.mutedForeground, size: 20)
          else if (called)
            const Icon(Icons.campaign_rounded,
                color: AppColors.success, size: 20),
          if (isMine) ...[
            const SizedBox(width: 8),
            const Icon(Icons.person_pin_rounded,
                color: AppColors.primary, size: 20),
          ],
        ],
      ),
    );
  }

  String _statusLabel(DisplayQueueToken token) {
    switch (token.status.toLowerCase()) {
      case 'called':
        return 'تم النداء';
      case 'waiting':
        return 'في الانتظار';
      default:
        return token.status;
    }
  }
}
