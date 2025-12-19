import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';

/// Platform-adaptive app widget.
/// Uses CupertinoApp on iOS and MaterialApp on Android.
class AdaptiveApp extends StatelessWidget {
  const AdaptiveApp({
    super.key,
    this.title = '',
    required this.home,
    this.themeMode = ThemeMode.system,
    this.routerConfig,
    this.debugShowCheckedModeBanner = true,
    this.navigatorKey,
    this.onGenerateRoute,
    this.initialRoute,
    this.navigatorObservers = const [],
    this.builder,
    this.localizationsDelegates,
    this.supportedLocales = const [Locale('en', 'US')],
  });

  final String title;
  final Widget home;
  final ThemeMode themeMode;
  final RouterConfig<Object>? routerConfig;
  final bool debugShowCheckedModeBanner;
  final GlobalKey<NavigatorState>? navigatorKey;
  final RouteFactory? onGenerateRoute;
  final String? initialRoute;
  final List<NavigatorObserver> navigatorObservers;
  final TransitionBuilder? builder;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final Iterable<Locale> supportedLocales;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return _buildCupertinoApp(context);
    }
    return _buildMaterialApp(context);
  }

  Widget _buildCupertinoApp(BuildContext context) {
    // Determine the current theme based on themeMode
    final brightness = _resolveBrightness(context);
    final cupertinoTheme = brightness == Brightness.dark
        ? AppTheme.cupertinoDark
        : AppTheme.cupertinoLight;

    if (routerConfig != null) {
      return CupertinoApp.router(
        title: title,
        theme: cupertinoTheme,
        routerConfig: routerConfig!,
        debugShowCheckedModeBanner: debugShowCheckedModeBanner,
        builder: builder,
        localizationsDelegates: localizationsDelegates,
        supportedLocales: supportedLocales,
      );
    }

    return CupertinoApp(
      title: title,
      theme: cupertinoTheme,
      home: home,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      navigatorKey: navigatorKey,
      onGenerateRoute: onGenerateRoute,
      initialRoute: initialRoute,
      navigatorObservers: navigatorObservers,
      builder: builder,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
    );
  }

  Widget _buildMaterialApp(BuildContext context) {
    if (routerConfig != null) {
      return MaterialApp.router(
        title: title,
        theme: AppTheme.materialLight,
        darkTheme: AppTheme.materialDark,
        themeMode: themeMode,
        routerConfig: routerConfig!,
        debugShowCheckedModeBanner: debugShowCheckedModeBanner,
        builder: builder,
        localizationsDelegates: localizationsDelegates,
        supportedLocales: supportedLocales,
      );
    }

    return MaterialApp(
      title: title,
      theme: AppTheme.materialLight,
      darkTheme: AppTheme.materialDark,
      themeMode: themeMode,
      home: home,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      navigatorKey: navigatorKey,
      onGenerateRoute: onGenerateRoute,
      initialRoute: initialRoute,
      navigatorObservers: navigatorObservers,
      builder: builder,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
    );
  }

  Brightness _resolveBrightness(BuildContext context) {
    switch (themeMode) {
      case ThemeMode.light:
        return Brightness.light;
      case ThemeMode.dark:
        return Brightness.dark;
      case ThemeMode.system:
        return MediaQuery.platformBrightnessOf(context);
    }
  }
}
