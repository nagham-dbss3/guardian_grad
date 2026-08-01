import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/gradients.dart';
import '../../../../core/theme/radii.dart';
import '../../../../core/utils/date_format_ar.dart';
import '../../../../models/checkin.dart';

/// Hero check-in card on Home: QR (file number) + token + booking time.
class CheckInCard extends StatelessWidget {
  const CheckInCard({
    super.key,
    required this.fileNo,
    required this.token,
    required this.onTap,
  });

  final String fileNo;
  final CheckInToken? token;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.xl),
        decoration: BoxDecoration(
          gradient: AppGradients.hope,
          borderRadius: BorderRadius.circular(AppRadii.xl2),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.22),
              blurRadius: 24,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: Row(
          children: [
            // QR
            RepaintBoundary(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppRadii.lg),
                ),
                child: QrImageView(
                  data: fileNo,
                  size: 92,
                  padding: EdgeInsets.zero,
                  backgroundColor: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.qr_code_2_rounded,
                          color: Colors.white, size: 18),
                      SizedBox(width: 6),
                      Text(
                        'رمز تسجيل الوصول',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  if (token != null) ...[
                    _pill('رقم الدور: ${token!.number}'),
                    const SizedBox(height: 6),
                    if (token!.bookingTime != null)
                      _pill(
                          'وقت الحجز: ${DateFormatAr.time(token!.bookingTime!)}')
                    else
                      _pill(
                          'وقت الإصدار: ${DateFormatAr.time(token!.issueTime)}'),
                  ] else
                    _pill('لا يوجد دور صادر اليوم'),
                  const SizedBox(height: 10),
                  const Text(
                    'اعرض هذا الرمز عند الاستقبال لتسجيل وصولكم',
                    style: TextStyle(color: Colors.white, fontSize: 12.5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _pill(String text) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.22),
          borderRadius: AppRadii.pill,
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 13,
          ),
        ),
      );
}
