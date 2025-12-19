import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/theme/app_theme.dart';
import 'core/widgets/adaptive/adaptive.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // TODO: Initialize Firebase
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  runApp(
    const ProviderScope(
      child: ShelvesApp(),
    ),
  );
}

class ShelvesApp extends StatelessWidget {
  const ShelvesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveApp(
      title: 'Shelves',
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

/// Temporary home page showing the tab bar structure.
/// This will be replaced by proper routing in Phase 5.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AdaptiveTabScaffold(
      currentIndex: _currentIndex,
      onDestinationSelected: (index) => setState(() => _currentIndex = index),
      destinations: ShelvesTabDestinations.all,
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          _PlaceholderTab(title: 'Library', icon: Icons.library_books),
          _PlaceholderTab(title: 'Scan', icon: Icons.qr_code_scanner),
          _PlaceholderTab(title: 'Shelves', icon: Icons.shelves),
          _PlaceholderTab(title: 'Reading', icon: Icons.auto_stories),
          _PlaceholderTab(title: 'Settings', icon: Icons.settings),
        ],
      ),
    );
  }
}

/// Placeholder tab content for development.
class _PlaceholderTab extends StatelessWidget {
  const _PlaceholderTab({
    required this.title,
    required this.icon,
  });

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      appBar: AdaptiveAppBar(title: title),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 64,
              color: AppColors.textTertiaryLight,
            ),
            const Gap.md(),
            Text(
              title,
              style: AppTypography.headlineMedium,
            ),
            const Gap.sm(),
            Text(
              'Coming soon...',
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondaryLight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
