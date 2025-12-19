import 'package:flutter/widgets.dart';

/// Spacing constants following a 4px grid system.
/// Used for consistent margins, paddings, and gaps across the app.
abstract final class AppSpacing {
  // Base unit
  static const double unit = 4.0;

  // Spacing scale
  static const double xxs = 2.0;   // 0.5x
  static const double xs = 4.0;    // 1x
  static const double sm = 8.0;    // 2x
  static const double md = 16.0;   // 4x
  static const double lg = 24.0;   // 6x
  static const double xl = 32.0;   // 8x
  static const double xxl = 48.0;  // 12x
  static const double xxxl = 64.0; // 16x

  // Common padding values
  static const EdgeInsets paddingXs = EdgeInsets.all(xs);
  static const EdgeInsets paddingSm = EdgeInsets.all(sm);
  static const EdgeInsets paddingMd = EdgeInsets.all(md);
  static const EdgeInsets paddingLg = EdgeInsets.all(lg);
  static const EdgeInsets paddingXl = EdgeInsets.all(xl);

  // Horizontal padding
  static const EdgeInsets paddingHorizontalSm = EdgeInsets.symmetric(horizontal: sm);
  static const EdgeInsets paddingHorizontalMd = EdgeInsets.symmetric(horizontal: md);
  static const EdgeInsets paddingHorizontalLg = EdgeInsets.symmetric(horizontal: lg);

  // Vertical padding
  static const EdgeInsets paddingVerticalSm = EdgeInsets.symmetric(vertical: sm);
  static const EdgeInsets paddingVerticalMd = EdgeInsets.symmetric(vertical: md);
  static const EdgeInsets paddingVerticalLg = EdgeInsets.symmetric(vertical: lg);

  // Screen padding (safe area + margin)
  static const EdgeInsets screenPadding = EdgeInsets.symmetric(horizontal: md);
  static const EdgeInsets screenPaddingWithTop = EdgeInsets.fromLTRB(md, md, md, 0);

  // Card padding
  static const EdgeInsets cardPadding = EdgeInsets.all(md);
  static const EdgeInsets cardPaddingCompact = EdgeInsets.all(sm);

  // List item padding
  static const EdgeInsets listItemPadding = EdgeInsets.symmetric(
    horizontal: md,
    vertical: sm,
  );

  // Border radius values
  static const double radiusXs = 4.0;
  static const double radiusSm = 8.0;
  static const double radiusMd = 12.0;
  static const double radiusLg = 16.0;
  static const double radiusXl = 24.0;
  static const double radiusFull = 9999.0;

  // Border radius objects
  static const BorderRadius borderRadiusXs = BorderRadius.all(Radius.circular(radiusXs));
  static const BorderRadius borderRadiusSm = BorderRadius.all(Radius.circular(radiusSm));
  static const BorderRadius borderRadiusMd = BorderRadius.all(Radius.circular(radiusMd));
  static const BorderRadius borderRadiusLg = BorderRadius.all(Radius.circular(radiusLg));
  static const BorderRadius borderRadiusXl = BorderRadius.all(Radius.circular(radiusXl));

  // Icon sizes
  static const double iconSm = 16.0;
  static const double iconMd = 24.0;
  static const double iconLg = 32.0;
  static const double iconXl = 48.0;

  // Touch target minimum (accessibility)
  static const double minTouchTarget = 48.0;

  // Book cover aspect ratio (standard book cover)
  static const double bookCoverAspectRatio = 0.65; // width / height

  // Grid columns for book grid (responsive)
  static int bookGridColumns(double screenWidth) {
    if (screenWidth >= 1200) return 6;
    if (screenWidth >= 900) return 5;
    if (screenWidth >= 600) return 4;
    if (screenWidth >= 400) return 3;
    return 2;
  }

  // Gap between grid items
  static const double gridGap = sm;
}

/// SizedBox shortcuts for spacing in layouts
class Gap extends SizedBox {
  const Gap.xxs({super.key}) : super(width: AppSpacing.xxs, height: AppSpacing.xxs);
  const Gap.xs({super.key}) : super(width: AppSpacing.xs, height: AppSpacing.xs);
  const Gap.sm({super.key}) : super(width: AppSpacing.sm, height: AppSpacing.sm);
  const Gap.md({super.key}) : super(width: AppSpacing.md, height: AppSpacing.md);
  const Gap.lg({super.key}) : super(width: AppSpacing.lg, height: AppSpacing.lg);
  const Gap.xl({super.key}) : super(width: AppSpacing.xl, height: AppSpacing.xl);
  const Gap.xxl({super.key}) : super(width: AppSpacing.xxl, height: AppSpacing.xxl);

  const Gap.horizontal(double width, {super.key}) : super(width: width);
  const Gap.vertical(double height, {super.key}) : super(height: height);
}
