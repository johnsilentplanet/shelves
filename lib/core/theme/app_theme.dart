import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_typography.dart';
import 'app_spacing.dart';

export 'app_colors.dart';
export 'app_typography.dart';
export 'app_spacing.dart';

/// App theme configuration for both Material and Cupertino.
abstract final class AppTheme {
  // ---------------------------------------------------------------------------
  // Material Themes
  // ---------------------------------------------------------------------------

  /// Light theme for Material (Android)
  static ThemeData get materialLight => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: _materialColorSchemeLight,
        textTheme: AppTypography.materialTextTheme.apply(
          bodyColor: AppColors.textPrimaryLight,
          displayColor: AppColors.textPrimaryLight,
        ),
        scaffoldBackgroundColor: AppColors.backgroundLight,
        cardColor: AppColors.cardLight,
        dividerColor: AppColors.dividerLight,
        appBarTheme: _appBarThemeLight,
        cardTheme: _cardTheme,
        elevatedButtonTheme: _elevatedButtonTheme,
        filledButtonTheme: _filledButtonTheme,
        outlinedButtonTheme: _outlinedButtonTheme,
        textButtonTheme: _textButtonTheme,
        inputDecorationTheme: _inputDecorationThemeLight,
        floatingActionButtonTheme: _fabTheme,
        bottomNavigationBarTheme: _bottomNavThemeLight,
        navigationBarTheme: _navigationBarThemeLight,
        chipTheme: _chipThemeLight,
        dialogTheme: _dialogTheme,
        snackBarTheme: _snackBarTheme,
        listTileTheme: _listTileThemeLight,
        switchTheme: _switchTheme,
        checkboxTheme: _checkboxTheme,
        radioTheme: _radioTheme,
        sliderTheme: _sliderTheme,
        progressIndicatorTheme: _progressIndicatorTheme,
      );

  /// Dark theme for Material (Android)
  static ThemeData get materialDark => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: _materialColorSchemeDark,
        textTheme: AppTypography.materialTextTheme.apply(
          bodyColor: AppColors.textPrimaryDark,
          displayColor: AppColors.textPrimaryDark,
        ),
        scaffoldBackgroundColor: AppColors.backgroundDark,
        cardColor: AppColors.cardDark,
        dividerColor: AppColors.dividerDark,
        appBarTheme: _appBarThemeDark,
        cardTheme: _cardThemeDark,
        elevatedButtonTheme: _elevatedButtonTheme,
        filledButtonTheme: _filledButtonTheme,
        outlinedButtonTheme: _outlinedButtonTheme,
        textButtonTheme: _textButtonTheme,
        inputDecorationTheme: _inputDecorationThemeDark,
        floatingActionButtonTheme: _fabTheme,
        bottomNavigationBarTheme: _bottomNavThemeDark,
        navigationBarTheme: _navigationBarThemeDark,
        chipTheme: _chipThemeDark,
        dialogTheme: _dialogThemeDark,
        snackBarTheme: _snackBarThemeDark,
        listTileTheme: _listTileThemeDark,
        switchTheme: _switchTheme,
        checkboxTheme: _checkboxTheme,
        radioTheme: _radioTheme,
        sliderTheme: _sliderTheme,
        progressIndicatorTheme: _progressIndicatorTheme,
      );

  // ---------------------------------------------------------------------------
  // Cupertino Themes
  // ---------------------------------------------------------------------------

  /// Light theme for Cupertino (iOS)
  static CupertinoThemeData get cupertinoLight => CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: AppColors.primary,
        primaryContrastingColor: Colors.white,
        scaffoldBackgroundColor: AppColors.backgroundLight,
        barBackgroundColor: AppColors.surfaceLight.withOpacity(0.9),
        textTheme: AppTypography.cupertinoTextTheme(AppColors.primary),
      );

  /// Dark theme for Cupertino (iOS)
  static CupertinoThemeData get cupertinoDark => CupertinoThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors.primaryLight,
        primaryContrastingColor: Colors.white,
        scaffoldBackgroundColor: AppColors.backgroundDark,
        barBackgroundColor: AppColors.surfaceDark.withOpacity(0.9),
        textTheme: AppTypography.cupertinoTextTheme(AppColors.primaryLight),
      );

  // ---------------------------------------------------------------------------
  // Color Schemes
  // ---------------------------------------------------------------------------

  static ColorScheme get _materialColorSchemeLight => ColorScheme.light(
        primary: AppColors.primary,
        onPrimary: Colors.white,
        primaryContainer: AppColors.primaryLight.withOpacity(0.2),
        onPrimaryContainer: AppColors.primaryDark,
        secondary: AppColors.secondary,
        onSecondary: Colors.white,
        secondaryContainer: AppColors.secondaryLight.withOpacity(0.2),
        onSecondaryContainer: AppColors.secondaryDark,
        surface: AppColors.surfaceLight,
        onSurface: AppColors.textPrimaryLight,
        surfaceContainerHighest: AppColors.cardLight,
        onSurfaceVariant: AppColors.textSecondaryLight,
        error: AppColors.error,
        onError: Colors.white,
        outline: AppColors.dividerLight,
        outlineVariant: AppColors.dividerLight.withOpacity(0.5),
      );

  static ColorScheme get _materialColorSchemeDark => ColorScheme.dark(
        primary: AppColors.primaryLight,
        onPrimary: Colors.black,
        primaryContainer: AppColors.primaryDark,
        onPrimaryContainer: AppColors.primaryLight,
        secondary: AppColors.secondaryLight,
        onSecondary: Colors.black,
        secondaryContainer: AppColors.secondaryDark,
        onSecondaryContainer: AppColors.secondaryLight,
        surface: AppColors.surfaceDark,
        onSurface: AppColors.textPrimaryDark,
        surfaceContainerHighest: AppColors.cardDark,
        onSurfaceVariant: AppColors.textSecondaryDark,
        error: AppColors.error,
        onError: Colors.white,
        outline: AppColors.dividerDark,
        outlineVariant: AppColors.dividerDark.withOpacity(0.5),
      );

  // ---------------------------------------------------------------------------
  // Component Themes
  // ---------------------------------------------------------------------------

  static AppBarTheme get _appBarThemeLight => AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0.5,
        backgroundColor: AppColors.surfaceLight,
        foregroundColor: AppColors.textPrimaryLight,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: AppTypography.titleLarge.copyWith(
          color: AppColors.textPrimaryLight,
        ),
      );

  static AppBarTheme get _appBarThemeDark => AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0.5,
        backgroundColor: AppColors.surfaceDark,
        foregroundColor: AppColors.textPrimaryDark,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: AppTypography.titleLarge.copyWith(
          color: AppColors.textPrimaryDark,
        ),
      );

  static CardThemeData get _cardTheme => CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusMd,
        ),
        color: AppColors.cardLight,
      );

  static CardThemeData get _cardThemeDark => CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusMd,
        ),
        color: AppColors.cardDark,
      );

  static ElevatedButtonThemeData get _elevatedButtonTheme =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: AppSpacing.borderRadiusMd,
          ),
          minimumSize: const Size(AppSpacing.minTouchTarget, AppSpacing.minTouchTarget),
        ),
      );

  static FilledButtonThemeData get _filledButtonTheme => FilledButtonThemeData(
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: AppSpacing.borderRadiusMd,
          ),
          minimumSize: const Size(AppSpacing.minTouchTarget, AppSpacing.minTouchTarget),
        ),
      );

  static OutlinedButtonThemeData get _outlinedButtonTheme =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: AppSpacing.borderRadiusMd,
          ),
          minimumSize: const Size(AppSpacing.minTouchTarget, AppSpacing.minTouchTarget),
        ),
      );

  static TextButtonThemeData get _textButtonTheme => TextButtonThemeData(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: AppSpacing.borderRadiusMd,
          ),
          minimumSize: const Size(AppSpacing.minTouchTarget, AppSpacing.minTouchTarget),
        ),
      );

  static InputDecorationTheme get _inputDecorationThemeLight =>
      InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceLight,
        border: OutlineInputBorder(
          borderRadius: AppSpacing.borderRadiusMd,
          borderSide: BorderSide(color: AppColors.dividerLight),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppSpacing.borderRadiusMd,
          borderSide: BorderSide(color: AppColors.dividerLight),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppSpacing.borderRadiusMd,
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppSpacing.borderRadiusMd,
          borderSide: const BorderSide(color: AppColors.error),
        ),
        contentPadding: AppSpacing.paddingMd,
      );

  static InputDecorationTheme get _inputDecorationThemeDark =>
      InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceDark,
        border: OutlineInputBorder(
          borderRadius: AppSpacing.borderRadiusMd,
          borderSide: BorderSide(color: AppColors.dividerDark),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppSpacing.borderRadiusMd,
          borderSide: BorderSide(color: AppColors.dividerDark),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppSpacing.borderRadiusMd,
          borderSide: const BorderSide(color: AppColors.primaryLight, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppSpacing.borderRadiusMd,
          borderSide: const BorderSide(color: AppColors.error),
        ),
        contentPadding: AppSpacing.paddingMd,
      );

  static FloatingActionButtonThemeData get _fabTheme =>
      FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusLg,
        ),
      );

  static BottomNavigationBarThemeData get _bottomNavThemeLight =>
      BottomNavigationBarThemeData(
        backgroundColor: AppColors.surfaceLight,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textSecondaryLight,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      );

  static BottomNavigationBarThemeData get _bottomNavThemeDark =>
      BottomNavigationBarThemeData(
        backgroundColor: AppColors.surfaceDark,
        selectedItemColor: AppColors.primaryLight,
        unselectedItemColor: AppColors.textSecondaryDark,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      );

  static NavigationBarThemeData get _navigationBarThemeLight =>
      NavigationBarThemeData(
        backgroundColor: AppColors.surfaceLight,
        indicatorColor: AppColors.primary.withOpacity(0.15),
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        height: 80,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      );

  static NavigationBarThemeData get _navigationBarThemeDark =>
      NavigationBarThemeData(
        backgroundColor: AppColors.surfaceDark,
        indicatorColor: AppColors.primaryLight.withOpacity(0.15),
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        height: 80,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      );

  static ChipThemeData get _chipThemeLight => ChipThemeData(
        backgroundColor: AppColors.surfaceLight,
        selectedColor: AppColors.primary.withOpacity(0.15),
        padding: AppSpacing.paddingHorizontalSm,
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusMd,
        ),
      );

  static ChipThemeData get _chipThemeDark => ChipThemeData(
        backgroundColor: AppColors.surfaceDark,
        selectedColor: AppColors.primaryLight.withOpacity(0.15),
        padding: AppSpacing.paddingHorizontalSm,
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusMd,
        ),
      );

  static DialogThemeData get _dialogTheme => DialogThemeData(
        backgroundColor: AppColors.surfaceLight,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusLg,
        ),
      );

  static DialogThemeData get _dialogThemeDark => DialogThemeData(
        backgroundColor: AppColors.surfaceDark,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusLg,
        ),
      );

  static SnackBarThemeData get _snackBarTheme => SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusMd,
        ),
      );

  static SnackBarThemeData get _snackBarThemeDark => SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.cardDark,
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusMd,
        ),
      );

  static ListTileThemeData get _listTileThemeLight => const ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.xs,
        ),
        minVerticalPadding: AppSpacing.sm,
      );

  static ListTileThemeData get _listTileThemeDark => const ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.xs,
        ),
        minVerticalPadding: AppSpacing.sm,
      );

  static SwitchThemeData get _switchTheme => SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.white;
          }
          return AppColors.textSecondaryLight;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primary;
          }
          return AppColors.dividerLight;
        }),
      );

  static CheckboxThemeData get _checkboxTheme => CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primary;
          }
          return Colors.transparent;
        }),
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusXs,
        ),
      );

  static RadioThemeData get _radioTheme => RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primary;
          }
          return AppColors.textSecondaryLight;
        }),
      );

  static SliderThemeData get _sliderTheme => SliderThemeData(
        activeTrackColor: AppColors.primary,
        inactiveTrackColor: AppColors.dividerLight,
        thumbColor: AppColors.primary,
        overlayColor: AppColors.primary.withOpacity(0.2),
      );

  static ProgressIndicatorThemeData get _progressIndicatorTheme =>
      const ProgressIndicatorThemeData(
        color: AppColors.primary,
        linearTrackColor: AppColors.dividerLight,
      );
}
