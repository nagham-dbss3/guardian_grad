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

class AppointmentsScreen extends ConsumerWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final record = ref.watch(activeRecordProvider);
    final appointments = [...record.appointments]
      ..sort((a, b) => a.dateTime.compareTo(b.dateTime));
    final nextDose = appointments.where((a) => a.isNextDose).toList();
    final others = appointments.where((a) => !a.isNextDose).toList();

    if (appointments.isEmpty) {
      return const EmptyState(
        message: 'لا توجد مواعيد قادمة حاليًا',
        subtitle: 'نتمنى لكم يومًا طيبًا 🌿',
        icon: Icons.event_available_outlined,
      );
    }

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
      children: [
        if (nextDose.isNotEmpty) ...[
          _NextDoseHero(appointment: nextDose.first),
          const SizedBox(height: 20),
        ],
        const SectionHeader(
            title: 'المواعيد القادمة', icon: Icons.event_rounded),
        const SizedBox(height: 12),
        ...others.map((a) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _AppointmentTile(appointment: a),
            )),
        if (others.isEmpty)
          const Text('لا توجد مواعيد أخرى حاليًا.',
              style: TextStyle(color: AppColors.mutedForeground)),
      ],
    );
  }
}

class _NextDoseHero extends StatelessWidget {
  const _NextDoseHero({required this.appointment});
  final AppointmentView appointment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppGradients.hope,
        borderRadius: BorderRadius.circular(AppRadii.xl2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.medication_liquid_rounded, color: Colors.white),
              SizedBox(width: 8),
              Text('جرعتكم القادمة',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  )),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            DateFormatAr.dayDate(appointment.dateTime),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '${DateFormatAr.time(appointment.dateTime)} · '
            '${appointment.department}',
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 4),
          Text(
            DateFormatAr.relativeDay(appointment.dateTime),
            style: const TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

class _AppointmentTile extends StatelessWidget {
  const _AppointmentTile({required this.appointment});
  final AppointmentView appointment;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Row(
        children: [
          Container(
            width: 56,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.primarySoft,
              borderRadius: BorderRadius.circular(AppRadii.md),
            ),
            child: Column(
              children: [
                Text('${appointment.dateTime.day}',
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    )),
                Text(DateFormatAr.time(appointment.dateTime),
                    style: const TextStyle(
                        color: AppColors.primary, fontSize: 11)),
              ],
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(appointment.type,
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 2),
                Text(appointment.department,
                    style: const TextStyle(
                        color: AppColors.mutedForeground, fontSize: 12.5)),
                const SizedBox(height: 2),
                Text(DateFormatAr.relativeDay(appointment.dateTime),
                    style: const TextStyle(
                        color: AppColors.secondary,
                        fontSize: 12.5,
                        fontWeight: FontWeight.w700)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
