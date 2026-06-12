import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/radii.dart';

/// Status communicated by color + icon + label (never color alone).
class StatusChip extends StatelessWidget {
  const StatusChip({
    super.key,
    required this.label,
    required this.color,
    required this.background,
    this.icon,
  });

  final String label;
  final Color color;
  final Color background;
  final IconData? icon;

  /// Hope / positive / completed.
  factory StatusChip.positive(String label, {IconData? icon}) => StatusChip(
        label: label,
        color: AppColors.success,
        background: AppColors.secondarySoft,
        icon: icon ?? Icons.check_circle_rounded,
      );

  /// Current / in-progress.
  factory StatusChip.current(String label, {IconData? icon}) => StatusChip(
        label: label,
        color: AppColors.primary,
        background: AppColors.primarySoft,
        icon: icon ?? Icons.play_circle_fill_rounded,
      );

  /// Upcoming / neutral.
  factory StatusChip.neutral(String label, {IconData? icon}) => StatusChip(
        label: label,
        color: AppColors.mutedForeground,
        background: AppColors.muted,
        icon: icon ?? Icons.schedule_rounded,
      );

  /// Warm highlight (e.g. new).
  factory StatusChip.highlight(String label, {IconData? icon}) => StatusChip(
        label: label,
        color: const Color(0xFF9A7B11),
        background: AppColors.highlightSoft,
        icon: icon ?? Icons.auto_awesome_rounded,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: background,
        borderRadius: AppRadii.pill,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 15, color: color),
            const SizedBox(width: 5),
          ],
          Text(
            label,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w700,
              fontSize: 12.5,
            ),
          ),
        ],
      ),
    );
  }
}
