import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screen_brightness/screen_brightness.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/radii.dart';
import '../../../core/utils/date_format_ar.dart';
import '../../shared/data/guardian_providers.dart';

/// Full-screen check-in QR. Boosts screen brightness while open and restores
/// it on exit. The QR encodes the file number (رقم الإضبارة) for reception.
class QrScreen extends ConsumerStatefulWidget {
  const QrScreen({super.key});

  @override
  ConsumerState<QrScreen> createState() => _QrScreenState();
}

class _QrScreenState extends ConsumerState<QrScreen> {
  @override
  void initState() {
    super.initState();
    _boostBrightness();
  }

  Future<void> _boostBrightness() async {
    try {
      await ScreenBrightness().setApplicationScreenBrightness(1.0);
    } catch (_) {
      // Brightness control unsupported (e.g. desktop) — ignore gracefully.
    }
  }

  @override
  void dispose() {
    // Restore the system-managed brightness on exit.
    ScreenBrightness().resetApplicationScreenBrightness().catchError((_) {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final child = ref.watch(activeChildProvider);
    final token = ref.watch(checkInTokenProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('رمز تسجيل الوصول'),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  child.fullName,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 4),
                Text('رقم الإضبارة: ${child.fileNoBasma}',
                    style: const TextStyle(color: AppColors.mutedForeground)),
                const SizedBox(height: 24),
                RepaintBoundary(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(AppRadii.xl2),
                      border: Border.all(color: AppColors.border),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.12),
                          blurRadius: 30,
                          offset: const Offset(0, 14),
                        ),
                      ],
                    ),
                    child: QrImageView(
                      data: child.fileNoBasma,
                      size: 240,
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                if (token != null) ...[
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    decoration: const BoxDecoration(
                      color: AppColors.primarySoft,
                      borderRadius: AppRadii.pill,
                    ),
                    child: Text(
                      'رقم الدور: ${token.number}',
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (token.bookingTime != null)
                    Text('وقت الحجز: ${DateFormatAr.time(token.bookingTime!)}',
                        style: Theme.of(context).textTheme.titleMedium)
                  else
                    Text(
                      'وقت الإصدار: ${DateFormatAr.time(token.issueTime)}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  Text(token.department,
                      style: const TextStyle(color: AppColors.mutedForeground)),
                ] else
                  const Text('لا يوجد دور صادر اليوم',
                      style: TextStyle(color: AppColors.mutedForeground)),
                const SizedBox(height: 24),
                const Text(
                  'اعرض هذا الرمز لموظف الاستقبال',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
