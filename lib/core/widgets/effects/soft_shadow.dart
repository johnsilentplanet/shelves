import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';

/// A container with soft, diffused shadows for a modern elevated appearance.
class SoftShadowContainer extends StatelessWidget {
  const SoftShadowContainer({
    required this.child,
    super.key,
    this.borderRadius,
    this.color,
    this.shadowColor,
    this.elevation = SoftShadowElevation.medium,
    this.padding,
    this.margin,
  });

  final Widget child;
  final BorderRadius? borderRadius;
  final Color? color;
  final Color? shadowColor;
  final SoftShadowElevation elevation;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final effectiveColor =
        color ?? (isDark ? AppColors.cardDark : AppColors.cardLight);
    final effectiveShadowColor = shadowColor ??
        (isDark
            ? Colors.black.withOpacity(0.4)
            : Colors.black.withOpacity(0.08));
    final effectiveBorderRadius = borderRadius ?? AppSpacing.borderRadiusMd;

    return Container(
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: effectiveBorderRadius,
        boxShadow: _buildShadows(effectiveShadowColor, isDark),
      ),
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: effectiveColor,
          borderRadius: effectiveBorderRadius,
        ),
        child: child,
      ),
    );
  }

  List<BoxShadow> _buildShadows(Color shadowColor, bool isDark) {
    switch (elevation) {
      case SoftShadowElevation.none:
        return [];
      case SoftShadowElevation.low:
        return [
          BoxShadow(
            color: shadowColor,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ];
      case SoftShadowElevation.medium:
        return [
          BoxShadow(
            color: shadowColor.withOpacity(shadowColor.opacity * 0.5),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
          BoxShadow(
            color: shadowColor,
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ];
      case SoftShadowElevation.high:
        return [
          BoxShadow(
            color: shadowColor.withOpacity(shadowColor.opacity * 0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
          BoxShadow(
            color: shadowColor.withOpacity(shadowColor.opacity * 0.6),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
          BoxShadow(
            color: shadowColor,
            blurRadius: 40,
            offset: const Offset(0, 24),
          ),
        ];
    }
  }
}

/// Elevation levels for soft shadows.
enum SoftShadowElevation {
  none,
  low,
  medium,
  high,
}

/// Extension to easily apply soft shadows to any widget.
extension SoftShadowExtension on Widget {
  Widget withSoftShadow({
    SoftShadowElevation elevation = SoftShadowElevation.medium,
    BorderRadius? borderRadius,
    Color? color,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
  }) =>
      SoftShadowContainer(
        elevation: elevation,
        borderRadius: borderRadius,
        color: color,
        padding: padding,
        margin: margin,
        child: this,
      );
}
