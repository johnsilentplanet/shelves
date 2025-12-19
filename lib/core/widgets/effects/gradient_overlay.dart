import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';

/// A widget that applies a gradient overlay on top of its child.
/// Useful for text readability over images.
class GradientOverlay extends StatelessWidget {
  const GradientOverlay({
    required this.child,
    super.key,
    this.gradient,
    this.begin = Alignment.topCenter,
    this.end = Alignment.bottomCenter,
    this.colors,
    this.stops,
  });

  /// The widget to display under the gradient.
  final Widget child;

  /// Custom gradient. If provided, overrides begin, end, colors, and stops.
  final Gradient? gradient;

  /// The start alignment of the gradient.
  final Alignment begin;

  /// The end alignment of the gradient.
  final Alignment end;

  /// The colors for the gradient. Defaults to transparent to black.
  final List<Color>? colors;

  /// The stops for each color in the gradient.
  final List<double>? stops;

  @override
  Widget build(BuildContext context) {
    final effectiveGradient = gradient ??
        LinearGradient(
          begin: begin,
          end: end,
          colors: colors ??
              [
                Colors.transparent,
                Colors.black.withOpacity(0.7),
              ],
          stops: stops,
        );

    return Stack(
      fit: StackFit.passthrough,
      children: [
        child,
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(gradient: effectiveGradient),
          ),
        ),
      ],
    );
  }
}

/// Pre-configured gradient overlays for common use cases.
abstract final class GradientOverlays {
  /// A subtle gradient from top (transparent) to bottom (dark).
  static Widget bottomFade({required Widget child}) => GradientOverlay(
        colors: [
          Colors.transparent,
          Colors.black.withOpacity(0.5),
        ],
        child: child,
      );

  /// A gradient for text on images - stronger at bottom.
  static Widget textOnImage({required Widget child}) => GradientOverlay(
        colors: [
          Colors.transparent,
          Colors.transparent,
          Colors.black.withOpacity(0.8),
        ],
        stops: const [0.0, 0.4, 1.0],
        child: child,
      );

  /// A vignette effect - darker at edges.
  static Widget vignette({required Widget child}) => Stack(
        fit: StackFit.passthrough,
        children: [
          child,
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.4),
                  ],
                  stops: const [0.5, 1.0],
                ),
              ),
            ),
          ),
        ],
      );

  /// A primary color accent gradient.
  static Widget primaryAccent({
    required Widget child,
    double opacity = 0.3,
  }) =>
      GradientOverlay(
        colors: [
          AppColors.primary.withOpacity(opacity),
          AppColors.primaryDark.withOpacity(opacity),
        ],
        child: child,
      );
}
