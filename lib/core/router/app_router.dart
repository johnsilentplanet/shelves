import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/providers/auth_provider.dart';
import '../../features/auth/screens/forgot_password_screen.dart';
import '../../features/auth/screens/login_screen.dart';
import '../../features/auth/screens/onboarding_screen.dart';
import '../../features/auth/screens/signup_screen.dart';
import '../../features/auth/screens/splash_screen.dart';
import '../../features/home/screens/home_screen.dart';
import '../../features/library/screens/library_screen.dart';
import '../../features/reading/screens/reading_screen.dart';
import '../../features/scanning/screens/scan_screen.dart';
import '../../features/settings/screens/settings_screen.dart';
import '../../features/shelves/screens/shelf_detail_screen.dart';
import '../../features/shelves/screens/shelves_screen.dart';

part 'app_router.g.dart';

/// Provider for the app's GoRouter instance.
@riverpod
GoRouter appRouter(Ref ref) {
  final isAuthenticated = ref.watch(isAuthenticatedProvider);

  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/splash',
    redirect: (context, state) {
      final isOnSplash = state.matchedLocation == '/splash';
      final isOnAuth = state.matchedLocation.startsWith('/login') ||
          state.matchedLocation.startsWith('/signup') ||
          state.matchedLocation.startsWith('/forgot-password') ||
          state.matchedLocation.startsWith('/onboarding');

      // Don't redirect if on splash - let splash screen handle navigation
      if (isOnSplash) {
        return null;
      }

      // If authenticated and trying to access auth screens, redirect to home
      if (isAuthenticated && isOnAuth) {
        return '/';
      }

      // If not authenticated and not on auth screens, redirect to login
      if (!isAuthenticated && !isOnAuth) {
        return '/login';
      }

      return null;
    },
    routes: [
      // Splash screen
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),

      // Auth flow routes
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: '/forgot-password',
        builder: (context, state) => const ForgotPasswordScreen(),
      ),

      // Main app shell with bottom navigation
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
        routes: [
          // Library tab (default)
          GoRoute(
            path: 'library',
            builder: (context, state) => const LibraryScreen(),
          ),

          // Scan tab
          GoRoute(
            path: 'scan',
            builder: (context, state) => const ScanScreen(),
          ),

          // Shelves tab
          GoRoute(
            path: 'shelves',
            builder: (context, state) => const ShelvesScreen(),
            routes: [
              // Shelf detail
              GoRoute(
                path: ':id',
                builder: (context, state) {
                  final shelfId = state.pathParameters['id']!;
                  return ShelfDetailScreen(shelfId: shelfId);
                },
              ),
            ],
          ),

          // Reading tab
          GoRoute(
            path: 'reading',
            builder: (context, state) => const ReadingScreen(),
          ),

          // Settings tab
          GoRoute(
            path: 'settings',
            builder: (context, state) => const SettingsScreen(),
          ),

          // Book detail/edit (can be accessed from any tab)
          // GoRoute(
          //   path: 'book/:id',
          //   builder: (context, state) {
          //     final bookId = state.pathParameters['id']!;
          //     return BookDetailScreen(bookId: bookId);
          //   },
          // ),
        ],
      ),
    ],
  );
}
