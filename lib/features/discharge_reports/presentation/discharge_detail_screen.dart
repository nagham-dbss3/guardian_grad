import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/gradients.dart';
import '../../../core/theme/radii.dart';
import '../../../core/utils/date_format_ar.dart';
import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/empty_state.dart';
import '../../../core/widgets/section_header.dart';
import '../../../models/clinical.dart';
import '../../shared/data/guardian_providers.dart';

class DischargeDetailScreen extends ConsumerWidget {
  const DischargeDetailScreen({super.key, required this.reportId});
  final String reportId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final record = ref.watch(activeRecordProvider);
    final matches = record.dischargeReports
        .where((r) => r.id == reportId)
        .toList();
    final report = matches.isEmpty ? null : matches.first;

    return Scaffold(
      appBar: AppBar(title: const Text('تقرير التخريج')),
      body: report == null
          ? const EmptyState(message: 'تعذّر العثور على التقرير')
          : ListView(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
              children: [
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    gradient: AppGradients.care,
                    borderRadius: BorderRadius.circular(AppRadii.xl2),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.flag_rounded, color: Colors.white),
                          SizedBox(width: 8),
                          Text('ما الخطوة القادمة',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              )),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'الجرعة القادمة: ${DateFormatAr.dayDate(report.nextDoseDate)}',
                        style:
                            const TextStyle(color: Colors.white, height: 1.6),
                      ),
                      Text('الوجهة القادمة: ${report.nextVisitDepartment}',
                          style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                AppCard(
                  child: Column(
                    children: [
                      _row('تاريخ آخر جرعة',
                          DateFormatAr.date(report.lastDoseDate)),
                      const Divider(height: 20),
                      _row('تاريخ الجرعة القادمة',
                          DateFormatAr.date(report.nextDoseDate)),
                      const Divider(height: 20),
                      _row('الوجهة القادمة', report.nextVisitDepartment),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const SectionHeader(
                    title: 'الوصفة', icon: Icons.medication_rounded),
                const SizedBox(height: 12),
                AppCard(
                  child: Column(
                    children: [
                      for (var i = 0; i < report.prescription.length; i++) ...[
                        if (i > 0) const Divider(height: 20),
                        _PrescriptionRow(item: report.prescription[i]),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const SectionHeader(
                    title: 'تعليمات الطبيب', icon: Icons.notes_rounded),
                const SizedBox(height: 12),
                AppCard(
                  child: Text(report.doctorInstructions,
                      style: const TextStyle(height: 1.7)),
                ),
              ],
            ),
    );
  }

  Widget _row(String label, String value) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: AppColors.mutedForeground)),
          Flexible(
            child: Text(value,
                textAlign: TextAlign.end,
                style: const TextStyle(fontWeight: FontWeight.w700)),
          ),
        ],
      );
}

class _PrescriptionRow extends StatelessWidget {
  const _PrescriptionRow({required this.item});
  final PrescriptionItem item;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.medication_liquid_rounded,
            color: AppColors.secondary, size: 20),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.med,
                  style: const TextStyle(fontWeight: FontWeight.w700)),
              const SizedBox(height: 2),
              Text(item.dose,
                  style: const TextStyle(color: AppColors.mutedForeground)),
              if (item.instructions != null) ...[
                const SizedBox(height: 2),
                Text(item.instructions!,
                    style: const TextStyle(fontSize: 12.5)),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
