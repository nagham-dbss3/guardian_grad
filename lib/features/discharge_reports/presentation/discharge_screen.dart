import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/radii.dart';
import '../../../core/utils/date_format_ar.dart';
import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/empty_state.dart';
import '../../../models/clinical.dart';
import '../../shared/data/guardian_providers.dart';

class DischargeScreen extends ConsumerWidget {
  const DischargeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final record = ref.watch(activeRecordProvider);
    final reports = [...record.dischargeReports]
      ..sort((a, b) => b.generatedAt.compareTo(a.generatedAt));

    return Scaffold(
      appBar: AppBar(title: const Text('تقارير التخريج')),
      body: reports.isEmpty
          ? const EmptyState(
              message: 'لا توجد تقارير تخريج بعد',
              icon: Icons.description_outlined,
            )
          : ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
              itemCount: reports.length,
              itemBuilder: (context, i) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _ReportTile(report: reports[i]),
              ),
            ),
    );
  }
}

class _ReportTile extends StatelessWidget {
  const _ReportTile({required this.report});
  final DischargeReportView report;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: () => context.push('/discharge/${report.id}'),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.highlightSoft,
              borderRadius: BorderRadius.circular(AppRadii.md),
            ),
            child: const Icon(Icons.description_rounded,
                color: Color(0xFF9A7B11)),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('تقرير ${DateFormatAr.date(report.generatedAt)}',
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 4),
                Text('الجرعة القادمة: ${DateFormatAr.date(report.nextDoseDate)}',
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
