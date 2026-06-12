import 'package:flutter/widgets.dart';
import 'app_colors.dart';

/// Brand gradients. RTL-aware: 135deg in LTR maps to top-right -> bottom-left,
/// which reads naturally in an Arabic RTL layout.
class AppGradients {
  AppGradients._();

  static const Alignment _begin = Alignment.topRight;
  static const Alignment _end = Alignment.bottomLeft;

  /// Brand 135deg #008FD2 -> #B25EC5 -> #51C672
  static const LinearGradient brand = LinearGradient(
    begin: _begin,
    end: _end,
    colors: [AppColors.primary, AppColors.accent, AppColors.secondary],
  );

  /// Sun 135deg #FACB39 -> #F5C06A — celebratory.
  static const LinearGradient sun = LinearGradient(
    begin: _begin,
    end: _end,
    colors: [AppColors.highlight, Color(0xFFF5C06A)],
  );

  /// Hope 135deg #51C672 -> #008FD2
  static const LinearGradient hope = LinearGradient(
    begin: _begin,
    end: _end,
    colors: [AppColors.secondary, AppColors.primary],
  );

  /// Care 135deg #B25EC5 -> #008FD2
  static const LinearGradient care = LinearGradient(
    begin: _begin,
    end: _end,
    colors: [AppColors.accent, AppColors.primary],
  );
}
