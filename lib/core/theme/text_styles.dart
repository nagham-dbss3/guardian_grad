import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// Tajawal-based typography. Arabic is primary.
/// Falls back to the bundled system font if Google Fonts cannot be fetched
/// (e.g. fully offline first launch); google_fonts caches after first load.
class AppTextStyles {
  AppTextStyles._();

  static TextTheme textTheme(TextTheme base) {
    final tajawal = GoogleFonts.tajawalTextTheme(base);
    return tajawal
        .apply(
          bodyColor: AppColors.foreground,
          displayColor: AppColors.foreground,
        )
        .copyWith(
          displayLarge: tajawal.displayLarge?.copyWith(
            fontWeight: FontWeight.w700,
            letterSpacing: -0.4,
            height: 1.2,
          ),
          headlineSmall: tajawal.headlineSmall?.copyWith(
            fontWeight: FontWeight.w700,
            letterSpacing: -0.2,
          ),
          titleLarge: tajawal.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
            letterSpacing: -0.2,
            height: 1.3,
          ),
          titleMedium: tajawal.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
            height: 1.35,
          ),
          bodyLarge: tajawal.bodyLarge?.copyWith(height: 1.6),
          bodyMedium: tajawal.bodyMedium?.copyWith(height: 1.6),
          labelLarge: tajawal.labelLarge?.copyWith(fontWeight: FontWeight.w700),
        );
  }
}
