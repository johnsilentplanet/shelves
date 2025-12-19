# CLAUDE.md - Shelves

## Project Overview

Shelves is a cross-platform mobile application for iOS and Android that enables users to digitally catalog, organize, and manage their personal home library. Built with Flutter for maximum code reuse.

See [docs/PRD.md](docs/PRD.md) for full product requirements, features, and technical specifications.

## Tech Stack

- **Framework**: Flutter 3.24+ / Dart 3.5+
- **Architecture**: Clean Architecture with Riverpod
- **Local Storage**: Drift (SQLite)
- **Backend**: Firebase (Auth, Firestore, Storage, AI Logic, Analytics, Crashlytics)
- **Subscriptions**: RevenueCat
- **APIs**: Google Books, OpenLibrary, Gemini (via Firebase AI Logic)

## Platform-Adaptive UI Guidelines

**Critical**: Both iOS and Android apps must look visually alike with a unified modern aesthetic, while using platform-native controls.

### iOS (Cupertino)
- Use `CupertinoApp`, `CupertinoPageScaffold`, `CupertinoNavigationBar`
- Use `CupertinoButton`, `CupertinoTextField`, `CupertinoSwitch`, `CupertinoSlider`
- Use `CupertinoAlertDialog`, `CupertinoActionSheet` for dialogs
- Use `CupertinoTabBar` for bottom navigation
- Use `CupertinoIcons` for iconography
- Use iOS-style page transitions (slide from right)

### Android (Material)
- Use `MaterialApp`, `Scaffold`, `AppBar`
- Use `ElevatedButton`, `TextField`, `Switch`, `Slider`
- Use `AlertDialog`, `BottomSheet` for dialogs
- Use `NavigationBar` (Material 3) for bottom navigation
- Use `Icons` (Material Icons) for iconography
- Use Material-style page transitions (fade/slide up)

### Unified Modern Aesthetic
Both platforms should share:
- **Same color palette**: Define colors in a shared theme file
- **Same typography scale**: Consistent font sizes and weights
- **Same spacing system**: 4px/8px/16px/24px grid
- **Same visual effects**: Glass-morphism, blur backgrounds, subtle gradients, smooth shadows
- **Same layout structure**: Identical screen layouts, just different control widgets
- **Same animations**: 60fps, smooth transitions using Hero, AnimatedContainer

### Implementation Pattern
Use platform checks to swap widgets while keeping layout identical:

```dart
import 'dart:io' show Platform;

Widget buildButton({required String label, required VoidCallback onPressed}) {
  if (Platform.isIOS) {
    return CupertinoButton.filled(onPressed: onPressed, child: Text(label));
  }
  return FilledButton(onPressed: onPressed, child: Text(label));
}
```

Consider creating adaptive widget wrappers in `lib/core/widgets/adaptive/` for common controls.

## App Structure & Navigation

The app uses a bottom tab bar with 5 tabs. Use `CupertinoTabBar` on iOS and `NavigationBar` on Android.

### Tab Bar Icons & Labels

| Tab | Label | iOS Icon | Android Icon |
|-----|-------|----------|--------------|
| 1 | Library | `CupertinoIcons.book` | `Icons.library_books` |
| 2 | Scan | `CupertinoIcons.barcode_viewfinder` | `Icons.qr_code_scanner` |
| 3 | Shelves | `CupertinoIcons.square_grid_2x2` | `Icons.shelves` |
| 4 | Reading | `CupertinoIcons.bookmark` | `Icons.auto_stories` |
| 5 | Settings | `CupertinoIcons.gear` | `Icons.settings` |

### Tab 1: Library
- Displays the full book collection in a grid/list view
- Search bar at top for filtering books
- Sort options (title, author, date added, category)
- Filter by tags, shelves, reading status
- Tap book to view details/edit

### Tab 2: Scan
- Opens directly to barcode scanner camera view
- Flashlight toggle for low-light scanning
- After successful scan, shows book metadata for confirmation
- **Shelf Scanner (Premium)**: Prominent button/link to AI-powered shelf scanning
  - Free users see upgrade prompt when tapped
  - Premium users access camera to photograph entire bookshelf

### Tab 3: Shelves
- List of user-created shelves with book counts
- Create new shelf button (FAB or header action)
- Tap shelf to view books on that shelf
- Edit/rename/delete shelf via swipe or long-press
- **Rooms** (optional organization layer):
  - Group shelves by physical room (Living Room, Office, Bedroom, etc.)
  - Collapsible room sections containing shelves

### Tab 4: Reading
- **Currently Reading**: Default view showing books with status "currently-reading"
  - Shows reading progress if available (page number, percentage)
  - Quick action to update progress or mark as finished
- **Toggle: Recently Read**: Switch to view books marked as "read"
  - Sorted by `dateRead` (most recent first)
  - Shows star rating and date finished
- Empty states with calls-to-action when no books in either view

### Tab 5: Settings
- **Account**: Email, sign out, delete account
- **Display**: Theme (light/dark/system), Dewey Decimal toggle, default sort
- **Subscription**: Current plan, upgrade to premium, manage subscription
- **Data**:
  - Import CSV (Goodreads format)
  - Export CSV
- **Privacy**: Community contribution toggle
- **About**: App version, credits, privacy policy, terms of service

## Project Structure

```
lib/
├── core/
│   ├── theme/           # Shared colors, typography, spacing
│   ├── widgets/
│   │   └── adaptive/    # Platform-adaptive widget wrappers
│   └── utils/
├── features/
│   ├── auth/            # Login, signup, password recovery
│   ├── library/         # Tab 1: Book grid/list, search, filters
│   ├── scanning/        # Tab 2: Barcode scanner, shelf scanner
│   ├── shelves/         # Tab 3: Shelves list, rooms organization
│   ├── reading/         # Tab 4: Currently reading, recently read
│   ├── settings/        # Tab 5: Settings, import/export
│   └── premium/         # Subscription, paywalls, premium features
├── data/
│   ├── repositories/
│   ├── datasources/
│   └── models/
└── main.dart
```

## Commands

```bash
# Run the app
flutter run

# Run tests
flutter test

# Build for release
flutter build ios --release
flutter build appbundle --release

# Generate code (Drift, Freezed, JSON serialization)
dart run build_runner build --delete-conflicting-outputs

# Analyze code
flutter analyze
```

## Key Requirements from PRD

- **Performance**: <2s cold start, <3s barcode scan, 60fps animations
- **Offline-first**: Full functionality without network
- **Accessibility**: Dynamic type, screen reader support, 48x48dp touch targets
- **Free tier**: Unlimited books, all core features
- **Premium tier**: AI-powered features (BISAC categorization, auto-tagging, shelf scan)

---

## Implementation Plan

### Phase 1: Project Foundation

#### 1.1 Project Setup & Dependencies
- [x] Update `pubspec.yaml` with all required dependencies (see PRD Appendix)
- [x] Configure Flutter for iOS 15.5+ and Android API 24+ (mobile_scanner requires iOS 15.5)
- [x] Set up code generation: Freezed, JSON serializable, Drift (packages added, run `dart run build_runner build` when models created)
- [x] Configure linting rules in `analysis_options.yaml`
- [x] Create folder structure as defined in Project Structure section

#### 1.2 Firebase Configuration
- [x] Create Firebase project in Firebase Console
- [x] Add iOS app to Firebase (download `GoogleService-Info.plist`)
- [ ] Add Android app to Firebase (download `google-services.json`)
- [ ] Run `flutterfire configure` to generate `firebase_options.dart`
- [ ] Enable Firebase Auth (Email/Password, Google, Apple)
- [ ] Create Firestore database with security rules
- [ ] Enable Firebase Storage for cover images
- [ ] Enable Firebase Analytics and Crashlytics
- [ ] Enable Firebase AI Logic (Gemini API)

#### 1.3 Core Theme & Design System
- [x] Create `lib/core/theme/app_colors.dart` - shared color palette
- [x] Create `lib/core/theme/app_typography.dart` - text styles
- [x] Create `lib/core/theme/app_spacing.dart` - spacing constants (4/8/16/24px)
- [x] Create `lib/core/theme/app_theme.dart` - ThemeData for light/dark modes
- [x] Implement glass-morphism helper widgets (blur, gradients, shadows) - see `lib/core/widgets/effects/`

#### 1.4 Adaptive Widget Library
Create platform-adaptive wrappers in `lib/core/widgets/adaptive/`:
- [x] `adaptive_app.dart` - CupertinoApp vs MaterialApp
- [x] `adaptive_scaffold.dart` - page scaffolding with nav bar
- [x] `adaptive_tab_bar.dart` - bottom tab navigation
- [x] `adaptive_button.dart` - buttons (filled, outlined, text)
- [x] `adaptive_text_field.dart` - text input
- [x] `adaptive_switch.dart` - toggle switches
- [x] `adaptive_dialog.dart` - alerts and action sheets
- [x] `adaptive_list_tile.dart` - list items with actions
- [x] `adaptive_icons.dart` - icon mapping helper

---

### Phase 2: Data Layer

#### 2.1 Data Models (Freezed)
Create in `lib/data/models/`:
- [ ] `book.dart` - Book model with all fields from PRD schema
  - id, isbn, title, subtitle, authors, publisher, publishedDate
  - description, coverImageData, pageCount, categories, language
  - dateAdded, deweyDecimalNumber, bisacCategory, bisacSubcategory
  - shelfId, notes, tags, relatedBookIds
  - loanedTo, loanDate, userRating, dateRead, readingStatus
  - updatedAt, isSynced
- [ ] `shelf.dart` - Shelf model (id, name, roomId, dateCreated, updatedAt, isSynced)
- [ ] `room.dart` - Room model (id, name, dateCreated, updatedAt, isSynced)
- [ ] `user_profile.dart` - User preferences and settings
- [ ] `reading_status.dart` - Enum: toRead, currentlyReading, read

#### 2.2 Local Database (Drift)
Create in `lib/data/datasources/local/`:
- [ ] `database.dart` - Main Drift database class
- [ ] `books_table.dart` - Books table definition
- [ ] `shelves_table.dart` - Shelves table definition
- [ ] `rooms_table.dart` - Rooms table definition
- [ ] `books_dao.dart` - Data access object for books (CRUD, queries)
- [ ] `shelves_dao.dart` - Data access object for shelves
- [ ] `rooms_dao.dart` - Data access object for rooms
- [ ] Run `dart run build_runner build` to generate database code

#### 2.3 Remote Data Sources
Create in `lib/data/datasources/remote/`:
- [ ] `firestore_service.dart` - Firestore CRUD operations
- [ ] `firebase_storage_service.dart` - Cover image upload/download
- [ ] `google_books_api.dart` - ISBN lookup, search
- [ ] `open_library_api.dart` - Fallback metadata source

#### 2.4 Repositories
Create in `lib/data/repositories/`:
- [ ] `book_repository.dart` - Abstracts local + remote book operations
- [ ] `shelf_repository.dart` - Abstracts local + remote shelf operations
- [ ] `room_repository.dart` - Abstracts local + remote room operations
- [ ] `metadata_repository.dart` - Book lookup from Google Books / OpenLibrary

---

### Phase 3: State Management & Providers

#### 3.1 Riverpod Setup
Create in `lib/core/providers/`:
- [ ] `database_provider.dart` - Drift database instance
- [ ] `firebase_providers.dart` - FirebaseAuth, Firestore, Storage instances
- [ ] `connectivity_provider.dart` - Network status stream
- [ ] `repository_providers.dart` - All repository providers

#### 3.2 Feature Providers
- [ ] `lib/features/auth/providers/auth_provider.dart` - Auth state, user
- [ ] `lib/features/library/providers/books_provider.dart` - Book list, filters, search
- [ ] `lib/features/shelves/providers/shelves_provider.dart` - Shelf list
- [ ] `lib/features/shelves/providers/rooms_provider.dart` - Room list
- [ ] `lib/features/reading/providers/reading_provider.dart` - Reading/read books
- [ ] `lib/features/settings/providers/settings_provider.dart` - User preferences
- [ ] `lib/features/premium/providers/subscription_provider.dart` - Premium status

---

### Phase 4: Authentication

#### 4.1 Auth Service
- [ ] `lib/features/auth/services/auth_service.dart`
  - Email/password sign up and sign in
  - Google Sign In (both platforms)
  - Apple Sign In (iOS)
  - Password reset
  - Sign out
  - Account deletion

#### 4.2 Auth UI
- [ ] `lib/features/auth/screens/splash_screen.dart` - App launch, auth check
- [ ] `lib/features/auth/screens/onboarding_screen.dart` - 3-screen intro
- [ ] `lib/features/auth/screens/login_screen.dart` - Sign in form
- [ ] `lib/features/auth/screens/signup_screen.dart` - Registration form
- [ ] `lib/features/auth/screens/forgot_password_screen.dart` - Password recovery
- [ ] `lib/features/auth/widgets/social_sign_in_buttons.dart` - Google/Apple buttons

#### 4.3 Auth Flow
- [ ] Implement auth state listener in main.dart
- [ ] Route to onboarding (first launch) or home (authenticated)
- [ ] Secure credential storage with flutter_secure_storage
- [ ] Create user profile document in Firestore on signup

---

### Phase 5: App Shell & Navigation

#### 5.1 Main App Shell
- [ ] `lib/main.dart` - App initialization, Firebase init, providers
- [ ] `lib/app.dart` - AdaptiveApp with theme, routing
- [ ] `lib/features/home/screens/home_screen.dart` - Tab bar shell

#### 5.2 Router Configuration
- [ ] `lib/core/router/app_router.dart` - GoRouter configuration
  - `/` - Home (tab bar)
  - `/library` - Tab 1
  - `/scan` - Tab 2
  - `/shelves` - Tab 3
  - `/shelves/:id` - Shelf detail
  - `/reading` - Tab 4
  - `/settings` - Tab 5
  - `/book/:id` - Book detail/edit
  - `/auth/*` - Auth flow routes

#### 5.3 Tab Bar Implementation
- [ ] Create adaptive tab bar with 5 tabs
- [ ] Implement tab state preservation (keep alive)
- [ ] Handle deep linking to specific tabs

---

### Phase 6: Tab 1 - Library

#### 6.1 Library Screen
- [ ] `lib/features/library/screens/library_screen.dart`
  - Adaptive scaffold with search bar in nav
  - Grid view of book covers (responsive columns)
  - Empty state for new users
  - Pull-to-refresh for manual sync

#### 6.2 Library Components
- [ ] `lib/features/library/widgets/book_grid.dart` - Responsive book grid
- [ ] `lib/features/library/widgets/book_card.dart` - Cover, title, author, loan badge
- [ ] `lib/features/library/widgets/search_bar.dart` - Real-time search input
- [ ] `lib/features/library/widgets/filter_chips.dart` - Active filter display
- [ ] `lib/features/library/widgets/sort_menu.dart` - Sort options dropdown
- [ ] `lib/features/library/widgets/empty_library.dart` - CTA to add first book

#### 6.3 Book Detail Screen
- [ ] `lib/features/library/screens/book_detail_screen.dart`
  - Cover image (large)
  - All metadata fields
  - Reading status picker
  - Star rating
  - Notes editor
  - Tags display/edit
  - Shelf assignment
  - Loan tracking
  - Edit/Delete actions

#### 6.4 Search & Filter
- [ ] Implement real-time search across title, author, ISBN, tags
- [ ] Filter provider with: shelf, reading status, tags, category
- [ ] Sort provider: title, author, date added, rating

---

### Phase 7: Tab 2 - Scanning

#### 7.1 Barcode Scanner
- [ ] `lib/features/scanning/screens/scan_screen.dart`
  - Camera preview with barcode overlay
  - Flashlight toggle button
  - "Scan Entire Shelf" premium CTA button
- [ ] `lib/features/scanning/services/scanner_service.dart`
  - mobile_scanner integration
  - ISBN extraction from barcode
  - Haptic feedback on successful scan

#### 7.2 Book Lookup Flow
- [ ] `lib/features/scanning/screens/book_confirm_screen.dart`
  - Display fetched metadata
  - Allow edits before saving
  - Shelf picker (optional)
  - Save / Cancel actions
- [ ] `lib/features/scanning/widgets/metadata_loading.dart` - Loading state
- [ ] `lib/features/scanning/widgets/book_not_found.dart` - Manual entry prompt

#### 7.3 Manual Entry
- [ ] `lib/features/scanning/screens/manual_entry_screen.dart`
  - Form for all book fields
  - Cover photo capture (image_picker)
  - ISBN validation
  - Duplicate detection

#### 7.4 Shelf Scanner (Premium) - Placeholder
- [ ] `lib/features/scanning/screens/shelf_scan_screen.dart` - Premium gate
- [ ] Show upgrade prompt for free users
- [ ] Full implementation in Phase 11

---

### Phase 8: Tab 3 - Shelves

#### 8.1 Shelves List Screen
- [ ] `lib/features/shelves/screens/shelves_screen.dart`
  - List of shelves grouped by room (optional)
  - Book count per shelf
  - Create shelf FAB
  - Swipe to edit/delete

#### 8.2 Shelves Components
- [ ] `lib/features/shelves/widgets/shelf_list_tile.dart` - Shelf name, count, actions
- [ ] `lib/features/shelves/widgets/room_section.dart` - Collapsible room header
- [ ] `lib/features/shelves/widgets/create_shelf_dialog.dart` - Name input, room picker
- [ ] `lib/features/shelves/widgets/edit_shelf_dialog.dart` - Rename, change room

#### 8.3 Shelf Detail Screen
- [ ] `lib/features/shelves/screens/shelf_detail_screen.dart`
  - Books on this shelf (grid view)
  - Edit shelf action in nav
  - Empty state if no books

#### 8.4 Rooms Management
- [ ] `lib/features/shelves/screens/rooms_screen.dart` - List of rooms
- [ ] `lib/features/shelves/widgets/create_room_dialog.dart`
- [ ] Room CRUD operations

---

### Phase 9: Tab 4 - Reading

#### 9.1 Reading Screen
- [ ] `lib/features/reading/screens/reading_screen.dart`
  - Segmented control / toggle: "Currently Reading" | "Recently Read"
  - List view of books (not grid - more detail visible)

#### 9.2 Currently Reading View
- [ ] `lib/features/reading/widgets/currently_reading_list.dart`
  - Books with status "currently-reading"
  - Progress indicator (if page/percentage tracked)
  - Quick actions: Update progress, Mark finished
- [ ] `lib/features/reading/widgets/reading_book_card.dart`
  - Cover, title, author
  - Progress bar
  - "Update Progress" button

#### 9.3 Recently Read View
- [ ] `lib/features/reading/widgets/recently_read_list.dart`
  - Books with status "read", sorted by dateRead DESC
  - Star rating display
  - Date finished
- [ ] `lib/features/reading/widgets/read_book_card.dart`

#### 9.4 Progress Tracking
- [ ] `lib/features/reading/widgets/progress_update_sheet.dart`
  - Current page input
  - Or percentage slider
  - "Mark as Finished" button (sets status, dateRead)

#### 9.5 Empty States
- [ ] Empty state for no currently reading books
- [ ] Empty state for no recently read books

---

### Phase 10: Tab 5 - Settings

#### 10.1 Settings Screen
- [ ] `lib/features/settings/screens/settings_screen.dart`
  - Grouped list sections
  - Platform-adaptive list tiles

#### 10.2 Account Section
- [ ] Display current user email
- [ ] Sign out button with confirmation
- [ ] Delete account with strong confirmation (re-auth required)

#### 10.3 Display Section
- [ ] Theme picker: Light / Dark / System
- [ ] Dewey Decimal toggle
- [ ] Default sort preference

#### 10.4 Subscription Section
- [ ] Current plan display (Free / Premium)
- [ ] "Upgrade to Premium" button (if free)
- [ ] "Manage Subscription" link (platform settings)

#### 10.5 Data Section
- [ ] `lib/features/settings/screens/import_screen.dart`
  - File picker for CSV
  - Import progress indicator
  - Goodreads format parsing
- [ ] `lib/features/settings/screens/export_screen.dart`
  - Generate CSV
  - Share sheet

#### 10.6 Privacy Section
- [ ] Community contribution toggle
- [ ] Explanation text

#### 10.7 About Section
- [ ] App version (package_info_plus)
- [ ] Credits
- [ ] Privacy policy link
- [ ] Terms of service link

---

### Phase 11: Cloud Sync

#### 11.1 Sync Service
- [ ] `lib/data/services/sync_service.dart`
  - Bidirectional sync: Local DB ↔ Firestore
  - Offline queue for pending changes
  - Conflict resolution (last-write-wins with timestamp)
  - Batch operations for efficiency

#### 11.2 Sync Triggers
- [ ] Sync on app launch (if online)
- [ ] Sync after any local mutation
- [ ] Sync on app resume (lifecycle observer)
- [ ] Manual sync via pull-to-refresh

#### 11.3 Connectivity Handling
- [ ] Monitor network status (connectivity_plus)
- [ ] Queue offline changes
- [ ] Auto-sync when network returns
- [ ] Sync status indicator in UI

#### 11.4 Cover Image Sync
- [ ] Upload new cover images to Firebase Storage
- [ ] Download missing covers on new device
- [ ] Cache downloaded covers locally

---

### Phase 12: Premium & Subscriptions

#### 12.1 RevenueCat Setup
- [ ] Create RevenueCat account and project
- [ ] Configure iOS products in App Store Connect
- [ ] Configure Android products in Google Play Console
- [ ] Add products to RevenueCat dashboard
- [ ] Create "premium" entitlement

#### 12.2 Subscription Service
- [ ] `lib/features/premium/services/subscription_service.dart`
  - Initialize RevenueCat SDK
  - Check entitlements (isPremium)
  - Purchase flow
  - Restore purchases
  - Listen for subscription changes

#### 12.3 Paywall UI
- [ ] `lib/features/premium/screens/paywall_screen.dart`
  - Feature list (what's included)
  - Pricing display (monthly/annual)
  - Purchase buttons
  - Restore purchases link
  - Terms and privacy links

#### 12.4 Premium Gates
- [ ] `lib/features/premium/widgets/premium_gate.dart` - Wrapper widget
- [ ] Gate AI features behind premium check
- [ ] Show upgrade prompt when free user taps premium feature

#### 12.5 Override Premium (Admin)
- [ ] Check Firestore `users/{uid}/profile/info.OverridePremium` field
- [ ] Grant premium access if set to 1

---

### Phase 13: AI Features (Premium)

#### 13.1 AI Service Setup
- [ ] `lib/features/premium/services/ai_service.dart`
  - Initialize Firebase AI Logic SDK
  - Configure gemini-2.5-flash model
  - Rate limiting (10 requests/minute)
  - Response caching

#### 13.2 BISAC Classification
- [ ] `classifyBook()` method - send title, author, description
- [ ] Parse JSON response for category/subcategory
- [ ] Update book with BISAC fields
- [ ] UI to trigger classification on book detail

#### 13.3 AI Tag Generation
- [ ] `generateTags()` method - send book metadata
- [ ] Parse JSON array of tags
- [ ] Merge with existing tags
- [ ] UI to trigger tag generation

#### 13.4 Shelf Scanner (Full Implementation)
- [ ] `lib/features/scanning/screens/shelf_scan_screen.dart`
  - Camera UI for bookshelf photo
  - Capture and send to Gemini multimodal
  - Parse identified books from response
- [ ] `lib/features/scanning/screens/shelf_scan_review_screen.dart`
  - Display original photo
  - List identified books with confidence
  - Checkboxes to select which to add
  - Duplicate detection
  - Bulk add selected books
- [ ] `lib/features/scanning/services/shelf_scan_service.dart`
  - Image preprocessing
  - Gemini API call with image
  - Match results against Google Books for full metadata

#### 13.5 Batch Processing
- [ ] `lib/features/premium/screens/batch_process_screen.dart`
  - Select multiple books
  - Queue for AI processing
  - Progress indicator
  - Review results

---

### Phase 14: Polish & Quality

#### 14.1 Loading States
- [ ] Shimmer loading skeletons for all lists
- [ ] Loading indicators for async operations
- [ ] Skeleton screens for book detail

#### 14.2 Error Handling
- [ ] Global error handler
- [ ] User-friendly error messages
- [ ] Retry mechanisms for network failures
- [ ] Offline mode indicators

#### 14.3 Animations
- [ ] Hero transitions for book covers
- [ ] Smooth list animations (add/remove)
- [ ] Tab transition animations
- [ ] Button feedback animations

#### 14.4 Accessibility
- [ ] Semantics labels on all interactive elements
- [ ] Dynamic type support (text scaling)
- [ ] Minimum 48x48dp touch targets
- [ ] Screen reader testing

#### 14.5 Performance
- [ ] Profile and optimize for 60fps
- [ ] Lazy loading for large lists
- [ ] Image caching and compression
- [ ] Memory profiling for large libraries

---

### Phase 15: Testing

#### 15.1 Unit Tests
- [ ] Model serialization tests
- [ ] Repository tests (with mocked data sources)
- [ ] Provider/state management tests
- [ ] Utility function tests

#### 15.2 Widget Tests
- [ ] Key widget rendering tests
- [ ] User interaction tests
- [ ] Platform-adaptive widget tests

#### 15.3 Integration Tests
- [ ] Auth flow tests
- [ ] Book CRUD flow tests
- [ ] Sync flow tests
- [ ] Subscription flow tests

#### 15.4 Manual Testing
- [ ] Test on iOS simulator + physical device
- [ ] Test on Android emulator + physical device
- [ ] Test offline scenarios
- [ ] Test large library (1000+ books)

---

### Phase 16: Release Preparation

#### 16.1 App Store Assets
- [ ] App icon (1024x1024, adaptive for Android)
- [ ] Screenshots for all required sizes
- [ ] App preview video (optional)
- [ ] Feature graphic for Google Play

#### 16.2 Legal Documents
- [ ] Privacy Policy
- [ ] Terms of Service
- [ ] EULA

#### 16.3 Store Listings
- [ ] App Store Connect listing
- [ ] Google Play Console listing
- [ ] App Store privacy labels
- [ ] Google Play data safety section

#### 16.4 Beta Testing
- [ ] TestFlight distribution (iOS)
- [ ] Firebase App Distribution or Play Console testing (Android)
- [ ] Gather feedback, fix critical issues

#### 16.5 Launch
- [ ] Submit to App Store review
- [ ] Submit to Google Play review
- [ ] Monitor crash reports (Crashlytics)
- [ ] Monitor analytics

---

### Implementation Order Summary

1. **Foundation** (Phases 1-3): Setup, data layer, providers
2. **Auth** (Phase 4): Authentication flow
3. **Shell** (Phase 5): Tab bar and navigation
4. **Core Features** (Phases 6-10): All 5 tabs with basic functionality
5. **Sync** (Phase 11): Cloud synchronization
6. **Monetization** (Phase 12): Subscriptions and paywalls
7. **AI** (Phase 13): Premium AI features
8. **Polish** (Phases 14-15): Quality, testing
9. **Launch** (Phase 16): Store submission

