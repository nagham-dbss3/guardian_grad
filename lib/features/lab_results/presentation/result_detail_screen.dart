import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/services/pdf_service.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/radii.dart';
import '../../../core/utils/date_format_ar.dart';
import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/empty_state.dart';
import '../../../core/widgets/primary_button.dart';
import '../../../models/clinical.dart';
import '../../shared/data/guardian_providers.dart';

class ResultDetailScreen extends ConsumerStatefulWidget {
  const ResultDetailScreen({super.key, required this.resultId});
  final String resultId;

  @override
  ConsumerState<ResultDetailScreen> createState() =>
      _ResultDetailScreenState();
}

class _ResultDetailScreenState extends ConsumerState<ResultDetailScreen> {
  bool _sharing = false;

  @override
  void initState() {
    super.initState();
    // Mark as read once opened (links from the results notification).
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(guardianControllerProvider.notifier)
          .markResultRead(widget.resultId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final record = ref.watch(activeRecordProvider);
    final matches =
        record.labResults.where((r) => r.id == widget.resultId).toList();
    final result = matches.isEmpty ? null : matches.first;

    return Scaffold(
      appBar: AppBar(title: const Text('تفاصيل النتيجة')),
      body: result == null
          ? const EmptyState(message: 'تعذّر العثور على النتيجة')
          : ListView(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
              children: [
                AppCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
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
                              result.isBiopsy
                                  ? Icons.biotech_rounded
                                  : Icons.science_rounded,
                              color: result.isBiopsy
                                  ? AppColors.accent
                                  : AppColors.primary,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(result.testType,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge),
                                Text(DateFormatAr.date(result.resultDate),
                                    style: const TextStyle(
                                      color: AppColors.mutedForeground,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Divider(height: 24),
                      _row('الحالة', result.status),
                      if (result.summary != null) ...[
                        const SizedBox(height: 12),
                        const Text('ملخص',
                            style: TextStyle(fontWeight: FontWeight.w700)),
                        const SizedBox(height: 6),
                        Text(result.summary!,
                            style: const TextStyle(height: 1.7)),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // PDF view placeholder (mock PDF). The generated PDF is what
                // gets shared/exported.
                AppCard(
                  child: Column(
                    children: [
                      const Icon(Icons.picture_as_pdf_rounded,
                          size: 48, color: AppColors.destructive),
                      const SizedBox(height: 8),
                      const Text('نسخة PDF من النتيجة',
                          style: TextStyle(fontWeight: FontWeight.w700)),
                      const SizedBox(height: 4),
                      const Text(
                        'يمكنكم عرض النسخة أو مشاركتها مع الطبيب.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColors.mutedForeground, fontSize: 12.5),
                      ),
                      const SizedBox(height: 14),
                      PrimaryButton(
                        label: 'عرض / مشاركة PDF',
                        icon: Icons.ios_share_rounded,
                        loading: _sharing,
                        onPressed: () => _share(result, record.child.fullName),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  Future<void> _share(LabResultView result, String childName) async {
    setState(() => _sharing = true);
    try {
      await PdfService.instance.shareLabResult(result, childName);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('تعذّر إنشاء الملف: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _sharing = false);
    }
  }

  Widget _row(String label, String value) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: AppColors.mutedForeground)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w700)),
        ],
      );
}
