import 'package:flutter/material.dart';

/// Basma platform color tokens (light mode only).
/// Hex values are the converted source-of-truth from the platform oklch tokens.
class AppColors {
  AppColors._();

  static const background = Color(0xFFF9FDFF);
  static const foreground = Color(0xFF112438);
  static const card = Color(0xFFFFFFFF);

  // Blue — trust / care / main actions & headings.
  static const primary = Color(0xFF008FD2);
  static const primarySoft = Color(0xFFDFF1FF);

  // Green — hope / healing / progress / positive.
  static const secondary = Color(0xFF51C672);
  static const secondarySoft = Color(0xFFD8F9DD);

  // Purple — compassion / comfort tags & accents.
  static const accent = Color(0xFFB25EC5);
  static const accentSoft = Color(0xFFFBE7FF);

  // Yellow — warmth / joy / celebratory.
  static const highlight = Color(0xFFFACB39);
  static const highlightSoft = Color(0xFFFFF6D1);

  static const muted = Color(0xFFEDF5FB);
  static const mutedForeground = Color(0xFF5C6B7A);

  // Red — critical only (rare in this app).
  static const destructive = Color(0xFFEE343B);
  static const success = Color(0xFF2BBB71);
  static const warning = Color(0xFFF7B83D);
  static const border = Color(0xFFDCE6EE);
}
