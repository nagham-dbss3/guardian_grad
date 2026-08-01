import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/gradients.dart';
import '../../../core/theme/radii.dart';
import '../../../core/utils/date_format_ar.dart';
import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/status_chip.dart';
import '../../../models/treatment.dart';
import '../../shared/data/guardian_providers.dart';

/// Treatment plan as a hopeful vertical journey. Completed stages in green,
/// current highlighted, upcoming muted.
class JourneyScreen extends ConsumerWidget {
  const JourneyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final plan = ref.watch(treatmentJourneyProvider);
    final completed =
        plan.stages.where((s) => s.status == StageStatus.completed).length;

    return Scaffold(
      appBar: AppBar(title: const Text('رحلة العلاج')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 28),
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: AppGradients.hope,
              borderRadius: BorderRadius.circular(AppRadii.xl2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(plan.planName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    )),
                const SizedBox(height: 6),
                Text(
                  'أنجزتم $completed من ${plan.stages.length} مراحل — '
                  'كل خطوة إنجاز 🌟',
                  style: const TextStyle(color: Colors.white, fontSize: 13),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          for (var i = 0; i < plan.stages.length; i++)
            _StageTile(
              stage: plan.stages[i],
              isLast: i == plan.stages.length - 1,
            ),
        ],
      ),
    );
  }
}

class _StageTile extends StatelessWidget {
  const _StageTile({required this.stage, required this.isLast});
  final StageView stage;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final color = switch (stage.status) {
      StageStatus.completed => AppColors.secondary,
      StageStatus.current => AppColors.primary,
      StageStatus.upcoming => AppColors.border,
    };
    final icon = switch (stage.status) {
      StageStatus.completed => Icons.check_rounded,
      StageStatus.current => Icons.play_arrow_rounded,
      StageStatus.upcoming => Icons.circle_outlined,
    };

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline rail
          Column(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: Colors.white, size: 20),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 3,
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    color: stage.status == StageStatus.upcoming
                        ? AppColors.border
                        : AppColors.secondary,
                  ),
                ),
            ],
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: AppCard(
                color: stage.status == StageStatus.current
                    ? AppColors.primarySoft
                    : null,
                borderColor: stage.status == StageStatus.current
                    ? AppColors.primary
                    : null,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(stage.name,
                              style:
                                  Theme.of(context).textTheme.titleMedium),
                        ),
                        _chip(stage.status),
                      ],
                    ),
                    if (stage.startDate != null || stage.endDate != null) ...[
                      const SizedBox(height: 6),
                      Text(
                        _dateRange(stage),
                        style: const TextStyle(
                            color: AppColors.mutedForeground, fontSize: 12.5),
                      ),
                    ],
                    if (stage.medsSummary != null) ...[
                      const SizedBox(height: 8),
                      _detail(Icons.medication_rounded, stage.medsSummary!),
                    ],
                    if (stage.visitsSummary != null) ...[
                      const SizedBox(height: 6),
                      _detail(Icons.event_rounded, stage.visitsSummary!),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _chip(StageStatus status) => switch (status) {
        StageStatus.completed => StatusChip.positive('مكتملة'),
        StageStatus.current => StatusChip.current('الحالية'),
        StageStatus.upcoming => StatusChip.neutral('قادمة'),
      };

  Widget _detail(IconData icon, String text) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 16, color: AppColors.mutedForeground),
          const SizedBox(width: 6),
          Expanded(
            child: Text(text, style: const TextStyle(fontSize: 13)),
          ),
        ],
      );

  String _dateRange(StageView s) {
    final start = s.startDate != null ? DateFormatAr.date(s.startDate!) : '';
    final end = s.endDate != null ? DateFormatAr.date(s.endDate!) : '';
    if (start.isNotEmpty && end.isNotEmpty) return '$start — $end';
    return start.isNotEmpty ? start : end;
  }
}
