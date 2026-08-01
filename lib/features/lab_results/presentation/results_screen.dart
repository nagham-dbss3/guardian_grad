import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/radii.dart';
import '../../../core/utils/date_format_ar.dart';
import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/empty_state.dart';
import '../../../core/widgets/status_chip.dart';
import '../../../models/clinical.dart';
import '../../shared/data/guardian_providers.dart';

class ResultsScreen extends ConsumerWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final results = ref.watch(labResultsProvider);

    if (results.isEmpty) {
      return const EmptyState(
        message: 'لا توجد نتائج جديدة',
        subtitle: 'سنخبركم فور وصول أي نتيجة 🌿',
        icon: Icons.science_outlined,
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
      itemCount: results.length,
      itemBuilder: (context, i) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: _ResultTile(result: results[i]),
      ),
    );
  }
}

class _ResultTile extends StatelessWidget {
  const _ResultTile({required this.result});
  final LabResultView result;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: () => context.push('/results/${result.id}'),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: result.isBiopsy
                  ? AppColors.accentSoft
                  : AppColors.primarySoft,
              borderRadius: BorderRadius.circular(AppRadii.md),
            ),
            child: Icon(
              result.isBiopsy ? Icons.biotech_rounded : Icons.science_rounded,
              color: result.isBiopsy ? AppColors.accent : AppColors.primary,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(result.testType,
                          style: Theme.of(context).textTheme.titleMedium),
                    ),
                    if (!result.isRead)
                      StatusChip.highlight('جديد',
                          icon: Icons.fiber_new_rounded),
                  ],
                ),
                const SizedBox(height: 4),
                Text(DateFormatAr.date(result.resultDate),
                    style: const TextStyle(
                        color: AppColors.mutedForeground, fontSize: 12.5)),
              ],
            ),
          ),
          const Icon(Icons.chevron_left_rounded,
              color: AppColors.mutedForeground),
        ],
      ),
    );
  }
}
