import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const ProviderScope(
      child: ShelvesApp(),
    ),
  );
}

class ShelvesApp extends ConsumerWidget {
  const ShelvesApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    if (Platform.isIOS) {
      return CupertinoApp.router(
        title: 'Shelves',
        theme: AppTheme.cupertinoLight,
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      );
    }

    return MaterialApp.router(
      title: 'Shelves',
      theme: AppTheme.materialLight,
      darkTheme: AppTheme.materialDark,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
