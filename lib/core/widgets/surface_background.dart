import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// Page background: soft surface with a subtle blue glow (top-start) and a
/// yellow glow (top-end) behind content. Gentle and warm.
class SurfaceBackground extends StatelessWidget {
  const SurfaceBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    // In RTL, top-start is the top-right corner.
    return Stack(
      children: [
        const Positioned.fill(
          child: ColoredBox(color: AppColors.background),
        ),
        Positioned(
          top: -120,
          right: -80,
          child: _glow(AppColors.primary.withValues(alpha: 0.10)),
        ),
        Positioned(
          top: -100,
          left: -90,
          child: _glow(AppColors.highlight.withValues(alpha: 0.12)),
        ),
        Positioned.fill(child: child),
      ],
    );
  }

  Widget _glow(Color color) {
    return Container(
      width: 280,
      height: 280,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(colors: [color, color.withValues(alpha: 0)]),
      ),
    );
  }
}
