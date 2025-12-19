import 'package:flutter/material.dart';

/// Shared color palette for Shelves app.
/// Used across both iOS (Cupertino) and Android (Material) platforms.
abstract final class AppColors {
  // Primary brand colors
  static const Color primary = Color(0xFF6366F1); // Indigo
  static const Color primaryLight = Color(0xFF818CF8);
  static const Color primaryDark = Color(0xFF4F46E5);

  // Secondary accent colors
  static const Color secondary = Color(0xFF8B5CF6); // Purple
  static const Color secondaryLight = Color(0xFFA78BFA);
  static const Color secondaryDark = Color(0xFF7C3AED);

  // Semantic colors
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  // Neutral colors - Light mode
  static const Color backgroundLight = Color(0xFFFAFAFA);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color cardLight = Color(0xFFFFFFFF);
  static const Color dividerLight = Color(0xFFE5E7EB);
  static const Color textPrimaryLight = Color(0xFF111827);
  static const Color textSecondaryLight = Color(0xFF6B7280);
  static const Color textTertiaryLight = Color(0xFF9CA3AF);

  // Neutral colors - Dark mode
  static const Color backgroundDark = Color(0xFF0F0F0F);
  static const Color surfaceDark = Color(0xFF1A1A1A);
  static const Color cardDark = Color(0xFF262626);
  static const Color dividerDark = Color(0xFF404040);
  static const Color textPrimaryDark = Color(0xFFF9FAFB);
  static const Color textSecondaryDark = Color(0xFF9CA3AF);
  static const Color textTertiaryDark = Color(0xFF6B7280);

  // Glass morphism colors
  static const Color glassLight = Color(0x80FFFFFF);
  static const Color glassDark = Color(0x80000000);
  static const Color glassBlur = Color(0x1AFFFFFF);

  // Book-related accent colors
  static const Color loanedBadge = Color(0xFFEF4444);
  static const Color readingStatus = Color(0xFF10B981);
  static const Color toReadStatus = Color(0xFF3B82F6);
  static const Color readStatus = Color(0xFF8B5CF6);

  // Rating stars
  static const Color starFilled = Color(0xFFFBBF24);
  static const Color starEmpty = Color(0xFFD1D5DB);
}

/// Color scheme extensions for easy theme access
extension AppColorScheme on ColorScheme {
  Color get cardBackground => brightness == Brightness.light
      ? AppColors.cardLight
      : AppColors.cardDark;

  Color get textPrimary => brightness == Brightness.light
      ? AppColors.textPrimaryLight
      : AppColors.textPrimaryDark;

  Color get textSecondary => brightness == Brightness.light
      ? AppColors.textSecondaryLight
      : AppColors.textSecondaryDark;

  Color get textTertiary => brightness == Brightness.light
      ? AppColors.textTertiaryLight
      : AppColors.textTertiaryDark;

  Color get dividerColor => brightness == Brightness.light
      ? AppColors.dividerLight
      : AppColors.dividerDark;

  Color get glassColor => brightness == Brightness.light
      ? AppColors.glassLight
      : AppColors.glassDark;
}
