import 'dart:ui';

import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';

/// A container with a glass-morphism effect.
/// Uses backdrop blur and translucent background for a frosted glass appearance.
class GlassContainer extends StatelessWidget {
  const GlassContainer({
    required this.child,
    super.key,
    this.blur = 10.0,
    this.opacity = 0.1,
    this.borderRadius,
    this.border,
    this.padding,
    this.margin,
    this.color,
  });

  /// The widget to display inside the glass container.
  final Widget child;

  /// The blur intensity. Higher values create a more frosted appearance.
  final double blur;

  /// The opacity of the background color (0.0 to 1.0).
  final double opacity;

  /// The border radius of the container.
  final BorderRadius? borderRadius;

  /// Optional border decoration.
  final Border? border;

  /// Padding inside the container.
  final EdgeInsetsGeometry? padding;

  /// Margin outside the container.
  final EdgeInsetsGeometry? margin;

  /// Custom background color. Defaults to surface color based on theme.
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final effectiveColor = color ??
        (isDark ? AppColors.surfaceDark : AppColors.surfaceLight);
    final effectiveBorderRadius = borderRadius ?? AppSpacing.borderRadiusMd;

    return Container(
      margin: margin,
      child: ClipRRect(
        borderRadius: effectiveBorderRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              color: effectiveColor.withOpacity(opacity),
              borderRadius: effectiveBorderRadius,
              border: border ??
                  Border.all(
                    color: (isDark ? Colors.white : Colors.black)
                        .withOpacity(0.1),
                  ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

/// A card with glass-morphism effect.
class GlassCard extends StatelessWidget {
  const GlassCard({
    required this.child,
    super.key,
    this.blur = 10.0,
    this.opacity = 0.15,
    this.borderRadius,
    this.padding,
    this.margin,
    this.onTap,
  });

  final Widget child;
  final double blur;
  final double opacity;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final card = GlassContainer(
      blur: blur,
      opacity: opacity,
      borderRadius: borderRadius ?? AppSpacing.borderRadiusLg,
      padding: padding ?? AppSpacing.paddingMd,
      margin: margin,
      child: child,
    );

    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: card,
      );
    }

    return card;
  }
}
