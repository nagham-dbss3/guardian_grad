import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/radii.dart';
import '../../../core/utils/date_format_ar.dart';
import '../../../core/utils/initials.dart';
import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/section_header.dart';
import '../../shared/data/guardian_providers.dart';

/// Read-only, offline child record. Sensitive identifiers masked; no
/// prognosis / life-status / death fields are shown by design.
class RecordScreen extends ConsumerWidget {
  const RecordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final record = ref.watch(activeRecordProvider);
    final child = ref.watch(activeChildProvider);

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 28),
      children: [
        _LastUpdated(record.lastUpdated),
        const SizedBox(height: 12),

        // Child identity card
        AppCard(
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: AppColors.primarySoft,
                    child: Text(
                      initialLetter(child.firstName),
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(child.fullName,
                            style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: const BoxDecoration(
                            color: AppColors.secondarySoft,
                            borderRadius: AppRadii.pill,
                          ),
                          child: Text(
                            child.currentPhase,
                            style: const TextStyle(
                              color: AppColors.success,
                              fontWeight: FontWeight.w700,
                              fontSize: 12.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        const SectionHeader(
            title: 'المعلومات الأساسية', icon: Icons.badge_rounded),
        const SizedBox(height: 12),
        AppCard(
          child: Column(
            children: [
              _InfoRow('العمر', '${child.age} سنوات'),
              const Divider(height: 20),
              _InfoRow('الجنس', child.gender),
              const Divider(height: 20),
              _InfoRow('رقم الإضبارة', child.fileNoBasma),
              const Divider(height: 20),
              _InfoRow('الرقم الوطني', child.nationalIdMasked ?? '—'),
              const Divider(height: 20),
              _InfoRow('صلة القرابة', child.guardianRelationship ?? '—'),
            ],
          ),
        ),
        const SizedBox(height: 16),

        const SectionHeader(
            title: 'لمحة عن الحالة', icon: Icons.favorite_rounded),
        const SizedBox(height: 12),
        AppCard(
          color: AppColors.primarySoft,
          borderColor: AppColors.primarySoft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (record.diseaseOverview.category != null) ...[
                Text(record.diseaseOverview.category!,
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                    )),
                const SizedBox(height: 8),
              ],
              Text(
                record.diseaseOverview.summary,
                style: const TextStyle(height: 1.7),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const _PrivacyNote(),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow(this.label, this.value);
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: AppColors.mutedForeground)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.w700)),
      ],
    );
  }
}

class _LastUpdated extends StatelessWidget {
  const _LastUpdated(this.time);
  final DateTime time;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.cloud_done_rounded,
            size: 15, color: AppColors.mutedForeground),
        const SizedBox(width: 6),
        Text(
          'آخر تحديث: ${DateFormatAr.dayDateTime(time)}',
          style: const TextStyle(
              color: AppColors.mutedForeground, fontSize: 12.5),
        ),
      ],
    );
  }
}

class _PrivacyNote extends StatelessWidget {
  const _PrivacyNote();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.muted,
        borderRadius: BorderRadius.circular(AppRadii.lg),
      ),
      child: const Row(
        children: [
          Icon(Icons.shield_rounded, color: AppColors.mutedForeground, size: 20),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              'هذا عرض مبسّط ومحمي لخصوصية طفلكم. للاستفسار التفصيلي يرجى '
              'التواصل مع الفريق الطبي.',
              style: TextStyle(
                  color: AppColors.mutedForeground, fontSize: 12.5, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}
