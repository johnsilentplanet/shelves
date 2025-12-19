# Product Requirements Document: Shelves

## Executive Summary

**Product Name:** Shelves
**Version:** 1.0
**Document Owner:** Product Team
**Last Updated:** December 18, 2025
**Status:** Ready for Development

### Overview
Shelves is a cross-platform mobile application for iOS and Android that enables users to digitally catalog, organize, and manage their personal home library. Built with Flutter for maximum code reuse and consistent user experience across platforms, the app combines smartphone barcode scanning with intelligent book metadata retrieval, cloud synchronization, and AI-powered organization features to create a delightful library management experience.

### Vision
To become the most intuitive and powerful home library management solution for book lovers on both iOS and Android, making it effortless to catalog collections of any size while providing intelligent insights and organization that enhance the reading experience.

### Business Objectives
1. Launch a freemium cross-platform app (iOS + Android) with sustainable recurring revenue model
2. Achieve 200,000+ downloads within first year (combined platforms)
3. Convert 5-10% of active users to premium subscriptions
4. Build foundation for expanding to tablet-optimized experiences and web
5. Create defensible moat through AI-powered features and data network effects

---

## Product Goals

### Primary Goals
1. **Effortless Cataloging**: Users can scan and add books to their library in under 5 seconds
2. **Intelligent Organization**: AI automatically categorizes and tags books with minimal user input
3. **Universal Access**: Library syncs across all user devices (iOS, Android, tablet) with offline support
4. **Cross-Platform Consistency**: Identical feature set and UX across iOS and Android
5. **Monetization**: Sustainable freemium model with clear value proposition for premium tier

### Success Metrics
- **Acquisition**: 200K downloads in Year 1 (120K iOS, 80K Android)
- **Activation**: 70% of users add at least 5 books within first week
- **Engagement**: 40% weekly active users (books added, viewed, or organized)
- **Retention**: 50% 30-day retention rate
- **Revenue**: 5-10% free-to-premium conversion rate
- **Performance**: <500ms average scan-to-add time
- **Quality**: 4.5+ rating on both App Store and Google Play

---

## Target Audience

### Primary Personas

#### 1. **The Collector** (Primary)
- **Demographics**: 25-45 years old, college-educated, household income $60K+
- **Behavior**: Owns 100-500+ books, actively acquires new books
- **Pain Points**:
  - Forgets which books they own, leading to duplicate purchases
  - Cannot find specific books when needed
  - No easy way to track loaned books
- **Goals**: Complete digital catalog, organization, loan tracking
- **Tech Savviness**: Moderate to high, iPhone or Android user
- **Willingness to Pay**: High for tools that save time and provide value

#### 2. **The Librarian** (Secondary)
- **Demographics**: 30-60 years old, organized personality, professional or hobbyist
- **Behavior**: 500+ book collection, highly organized, categorizes by system
- **Pain Points**:
  - Existing solutions (spreadsheets, legacy apps) are cumbersome
  - Wants professional-grade organization (Dewey Decimal, BISAC)
  - Needs import from existing catalogs (Goodreads)
- **Goals**: Professional organization, comprehensive metadata, statistics
- **Tech Savviness**: Moderate, values functionality over aesthetics
- **Willingness to Pay**: Very high for advanced features

#### 3. **The Reader** (Tertiary)
- **Demographics**: 18-35 years old, active reader, social media user
- **Behavior**: 20-100 books, tracks reading progress and ratings
- **Pain Points**:
  - Wants to track "to-read" vs "read" books
  - Needs recommendations based on existing library
  - Wants reading statistics and insights
- **Goals**: Reading tracking, discovery, social sharing
- **Tech Savviness**: High, expects modern UX
- **Willingness to Pay**: Low to moderate, prefers free tier

### Out of Scope Users
- Institutional libraries (schools, public libraries)
- Book retailers or resellers
- Users primarily focused on ebook/audiobook collections

---

## User Stories & Requirements

### Epic 1: Onboarding & Authentication

#### User Stories
- **US-1.1**: As a new user, I want to sign up with email/password (or platform sign-in) so I can create an account
- **US-1.2**: As a returning user, I want to sign in so I can access my library
- **US-1.3**: As a new user, I want to see an onboarding tutorial so I understand core features
- **US-1.4**: As a user, I want password recovery so I can regain access if forgotten

#### Requirements
- **REQ-1.1**: Implement Firebase Authentication with email/password
- **REQ-1.2**: Support Sign in with Apple (iOS) and Sign in with Google (both platforms)
- **REQ-1.3**: Display splash screen with app branding during launch
- **REQ-1.4**: Show 3-screen onboarding flow highlighting: (1) scanning/shelf scan, (2) AI organization, (3) cloud sync
- **REQ-1.5**: Secure credential storage using flutter_secure_storage (iOS Keychain / Android Keystore)
- **REQ-1.6**: Implement "Forgot Password" flow with email verification

#### Acceptance Criteria
- User can create account in <60 seconds
- User remains signed in across app launches
- Onboarding can be skipped and never shown again once completed
- Clear error messages for invalid credentials

---

### Epic 2: Book Scanning & Addition

#### User Stories
- **US-2.1**: As a user, I want to scan a book's barcode so I can quickly add it to my library
- **US-2.2**: As a user, I want the app to automatically fetch book details so I don't have to enter them manually
- **US-2.3**: As a user, I want to manually enter book details if barcode scanning fails
- **US-2.4**: As a user, I want to search for books by title/author so I can add them without a barcode
- **US-2.5**: As a user, I want to take a custom cover photo if the book cover isn't available
- **US-2.6**: As a user, I want haptic feedback when scanning succeeds so I know it worked

#### Requirements
- **REQ-2.1**: Implement camera-based barcode scanner using mobile_scanner package
- **REQ-2.2**: Support ISBN-10, ISBN-13, and EAN-13 barcode formats
- **REQ-2.3**: Integrate Google Books API as primary metadata source
- **REQ-2.4**: Integrate OpenLibrary API as fallback metadata source
- **REQ-2.5**: Display real-time camera preview with barcode detection overlay
- **REQ-2.6**: Enable flashlight toggle for low-light scanning
- **REQ-2.7**: Provide manual entry form with fields: title, author(s), ISBN, publisher, year, description
- **REQ-2.8**: Implement text search against Google Books API
- **REQ-2.9**: Allow custom cover photo capture using device camera (image_picker)
- **REQ-2.10**: Store cover images locally as compressed bytes in local database
- **REQ-2.11**: Provide visual and haptic feedback on successful scan (vibration package)
- **REQ-2.12**: Handle duplicate detection (same ISBN already in library)
- **REQ-2.13**: Display prominent "Scan Entire Shelf" option in scanner view (premium feature teaser)
- **REQ-2.14**: Show upgrade prompt when user taps shelf scan feature (if not premium)

#### Acceptance Criteria
- Barcode scan completes in <3 seconds from camera open to data fetched
- 95%+ successful metadata retrieval for scanned ISBNs
- Clear error state if book not found with option to enter manually
- Duplicate books prevented with clear warning message
- Cover images display within 1 second of book view loading

---

### Epic 3: Library Management & Viewing

#### User Stories
- **US-3.1**: As a user, I want to view all my books in a grid so I can browse visually
- **US-3.2**: As a user, I want to sort books by title/author/category so I can find what I need
- **US-3.3**: As a user, I want to search my library so I can quickly locate specific books
- **US-3.4**: As a user, I want to view detailed information about a book so I can see all metadata
- **US-3.5**: As a user, I want to edit book details so I can correct errors or add information
- **US-3.6**: As a user, I want to delete books so I can remove items no longer in my collection
- **US-3.7**: As a user, I want to see book count statistics so I know the size of my collection

#### Requirements
- **REQ-3.1**: Display library in responsive grid using GridView.builder with SliverGrid
- **REQ-3.2**: Show book cover thumbnail, title, and author in grid cells
- **REQ-3.3**: Implement pull-to-refresh for manual sync (RefreshIndicator)
- **REQ-3.4**: Provide sorting options: Title (A-Z), Author (Last Name), Category, Dewey Number
- **REQ-3.5**: Implement global search with real-time filtering by title, author, ISBN, tags
- **REQ-3.6**: Display detailed book view with all metadata fields
- **REQ-3.7**: Allow editing of all book fields except ISBN (immutable)
- **REQ-3.8**: Support book deletion with confirmation dialog
- **REQ-3.9**: Show total book count in library header
- **REQ-3.10**: Display empty state with call-to-action for new users
- **REQ-3.11**: Optimize for large libraries (1000+ books) with efficient scrolling (ListView.builder)

#### Acceptance Criteria
- Grid scrolling is smooth at 60fps even with 1000+ books
- Search results appear within 200ms of keystroke
- Book detail view loads in <500ms
- Sorting completes within 1 second for 1000+ books
- Empty state clearly guides users to add first book

---

### Epic 4: Custom Shelves Organization

#### User Stories
- **US-4.1**: As a user, I want to create custom shelves so I can organize books by topic/room/category
- **US-4.2**: As a user, I want to assign books to shelves during/after adding so they're organized immediately
- **US-4.3**: As a user, I want to view all books on a specific shelf so I can see that collection
- **US-4.4**: As a user, I want to rename shelves so I can adjust organization over time
- **US-4.5**: As a user, I want to delete shelves so I can remove unused categories
- **US-4.6**: As a user, I want to move books between shelves so I can reorganize

#### Requirements
- **REQ-4.1**: Implement Shelf entity in local database with name and creation date
- **REQ-4.2**: Allow users to create unlimited custom shelves
- **REQ-4.3**: Provide shelf picker during book addition flow
- **REQ-4.4**: Show shelf name in book detail view with tap to change
- **REQ-4.5**: Display dedicated "Shelves" tab listing all shelves with book counts
- **REQ-4.6**: Enable shelf detail view showing all books on that shelf
- **REQ-4.7**: Support shelf renaming with inline editing
- **REQ-4.8**: Allow shelf deletion (books remain in library, shelf assignment removed)
- **REQ-4.9**: Filter library view by selected shelf
- **REQ-4.10**: Sync shelves to Firestore with same priority as books

#### Acceptance Criteria
- Users can create shelf in <5 seconds
- Shelf assignment during scanning is optional (1-tap to skip)
- Shelf filtering applies instantly
- Deleting shelf does not delete books
- Shelf changes sync within 5 seconds on good network

---

### Epic 5: Tags & Categorization

#### User Stories
- **US-5.1**: As a user, I want to add custom tags to books so I can create flexible categories
- **US-5.2**: As a user, I want tag autocomplete so I reuse existing tags consistently
- **US-5.3**: As a user, I want to browse all tags so I can see my tagging system
- **US-5.4**: As a user, I want to view all books with a specific tag so I can find related items
- **US-5.5**: As a premium user, I want AI-generated tags so I don't have to tag manually
- **US-5.6**: As a premium user, I want BISAC categories so my library uses industry standards

#### Requirements
- **REQ-5.1**: Store tags as List<String> on Book model
- **REQ-5.2**: Implement tag input UI with chip-style display (Wrap + Chip widgets)
- **REQ-5.3**: Provide tag autocomplete from existing tags across library
- **REQ-5.4**: Display "Tags" view showing all unique tags with usage counts
- **REQ-5.5**: Enable tag detail view showing all books with that tag
- **REQ-5.6**: Implement tag standardization (lowercase, trim whitespace)
- **REQ-5.7**: [Premium] Integrate Firebase AI Logic SDK for tag generation using Gemini API
- **REQ-5.8**: [Premium] Generate 3-7 relevant tags per book based on title, author, description
- **REQ-5.9**: [Premium] Implement BISAC classification via Firebase AI Logic (Gemini API)
- **REQ-5.10**: [Premium] Store bisacCategory and bisacSubcategory on Book model
- **REQ-5.11**: [Premium] Display BISAC category browsing view
- **REQ-5.12**: Make tags free for all users, AI generation premium-only

#### Acceptance Criteria
- Tags are free for all users to create and manage
- Tag autocomplete suggests matches after 2 characters
- AI tag generation (premium) completes in <5 seconds per book
- BISAC classification (premium) accuracy >85% for mainstream books
- Users can manually edit/remove AI-generated tags

---

### Epic 6: Reading Tracking & Statistics

#### User Stories
- **US-6.1**: As a user, I want to mark reading status (to-read, reading, read) so I can track progress
- **US-6.2**: As a user, I want to rate books 1-5 stars so I can remember my opinion
- **US-6.3**: As a user, I want to add notes to books so I can record thoughts
- **US-6.4**: As a user, I want to see reading statistics so I can track my reading habits
- **US-6.5**: As a user, I want to record when I finished books so I can track reading history
- **US-6.6**: As a user, I want to filter by reading status so I can focus on specific lists

#### Requirements
- **REQ-6.1**: Add readingStatus field: "to-read", "currently-reading", "read"
- **REQ-6.2**: Add userRating field (1-5 integer)
- **REQ-6.3**: Add dateRead field (DateTime, nullable)
- **REQ-6.4**: Add notes field (String, free for all users)
- **REQ-6.5**: Display reading status picker in book detail view
- **REQ-6.6**: Show star rating UI with tap-to-rate (flutter_rating_bar)
- **REQ-6.7**: Provide multiline text input for notes
- **REQ-6.8**: Implement reading statistics view showing:
  - Total books by status
  - Books read this year/month
  - Average rating
  - Pages read (if pageCount available)
  - Reading streak
- **REQ-6.9**: Allow filtering library by reading status
- **REQ-6.10**: Auto-populate dateRead when status changes to "read"

#### Acceptance Criteria
- Notes are free for all users (no paywall)
- Reading status changes reflect immediately in UI
- Statistics calculations are accurate and update in real-time
- Filter by status applies instantly
- Notes support up to 10,000 characters

---

### Epic 7: Loan Tracking

#### User Stories
- **US-7.1**: As a user, I want to mark books as loaned so I remember who has them
- **US-7.2**: As a user, I want to record who borrowed a book so I can track loans
- **US-7.3**: As a user, I want to see loan date so I know how long it's been out
- **US-7.4**: As a user, I want to mark books as returned so I can clear loan status
- **US-7.5**: As a user, I want visual indication of loaned books so I can identify them quickly

#### Requirements
- **REQ-7.1**: Add loanedTo field (String, nullable) for borrower name
- **REQ-7.2**: Add loanDate field (DateTime, nullable)
- **REQ-7.3**: Provide loan picker UI in book detail view
- **REQ-7.4**: Display loan badge/indicator on book covers in grid (Stack + Positioned)
- **REQ-7.5**: Show loan information prominently in book detail view
- **REQ-7.6**: Provide "Mark as Returned" action to clear loan fields
- **REQ-7.7**: Calculate days loaned from loanDate to present
- **REQ-7.8**: Allow filtering to show only loaned books
- **REQ-7.9**: Include loan status in search results

#### Acceptance Criteria
- Loan tracking is free for all users
- Visual indicator clearly distinguishes loaned books
- Days loaned calculation is accurate
- Marking as returned clears both loanedTo and loanDate
- Filter shows only currently loaned books

---

### Epic 8: Cloud Sync & Offline Support

#### User Stories
- **US-8.1**: As a user, I want my library synced to cloud so I don't lose data
- **US-8.2**: As a user, I want to access my library on multiple devices so I can use any phone/tablet
- **US-8.3**: As a user, I want offline access so I can view/add books without internet
- **US-8.4**: As a user, I want automatic sync so I don't have to think about it
- **US-8.5**: As a user, I want conflict resolution so data doesn't get lost

#### Requirements
- **REQ-8.1**: Implement local persistence using Drift (SQLite) or Isar for offline-first storage
- **REQ-8.2**: Integrate Firebase Firestore for cloud storage
- **REQ-8.3**: Build bidirectional sync service (Local DB ↔ Firestore)
- **REQ-8.4**: Implement offline-first architecture (local writes, background sync)
- **REQ-8.5**: Store cover images locally with Firebase Storage sync for cloud backup
- **REQ-8.6**: Sync on app launch, background, and after mutations
- **REQ-8.7**: Implement conflict resolution (last-write-wins with timestamp)
- **REQ-8.8**: Show sync status indicator in UI
- **REQ-8.9**: Queue offline changes for sync when online (connectivity_plus for detection)
- **REQ-8.10**: Handle sync errors gracefully with retry logic
- **REQ-8.11**: Optimize sync for large libraries (batch operations)

#### Acceptance Criteria
- Library accessible immediately on app launch (from cache)
- Changes sync within 5 seconds on good network
- App fully functional offline (view, add, edit, delete)
- Offline changes sync automatically when network returns
- No data loss during sync conflicts (user can resolve if needed)

---

### Epic 9: CSV Import/Export

#### User Stories
- **US-9.1**: As a user, I want to import Goodreads library CSV so I can migrate existing data
- **US-9.2**: As a user, I want to export my library to CSV so I can backup or use elsewhere
- **US-9.3**: As a user, I want import to preserve ratings and reading status so I don't lose history
- **US-9.4**: As a user, I want clear progress during import so I know it's working

#### Requirements
- **REQ-9.1**: Implement CSV parser for Goodreads export format (csv package)
- **REQ-9.2**: Map Goodreads fields to Shelves Book model:
  - Title → title
  - Author → authors
  - ISBN/ISBN13 → isbn
  - My Rating → userRating
  - Date Read → dateRead
  - Exclusive Shelf → readingStatus
  - My Review → notes
- **REQ-9.3**: Show file picker for CSV import (file_picker package)
- **REQ-9.4**: Display progress indicator during import (X of Y books)
- **REQ-9.5**: Generate CSV export in Goodreads-compatible format
- **REQ-9.6**: Provide share sheet for exporting CSV (share_plus package)
- **REQ-9.7**: Handle import errors gracefully (skip invalid rows, report errors)
- **REQ-9.8**: Prevent duplicate imports (check ISBN/title+author)

#### Acceptance Criteria
- Import successfully processes Goodreads CSV exports
- Progress indicator updates in real-time during import
- Export generates valid CSV readable by Goodreads/Excel
- Import of 500 books completes in <2 minutes
- Clear error reporting for malformed CSV

---

### Epic 10: Premium Subscription System

#### User Stories
- **US-10.1**: As a user, I want to understand free vs premium features so I can decide to upgrade
- **US-10.2**: As a user, I want to purchase monthly or annual subscription so I can unlock premium
- **US-10.3**: As a user, I want clear value proposition so I know what I'm paying for
- **US-10.4**: As a premium user, I want AI-powered features so I save time on organization
- **US-10.5**: As a free user, I want unlimited books so I can catalog my entire library
- **US-10.6**: As a free user, I want access to all core features without artificial limits

#### Requirements
- **REQ-10.1**: Integrate RevenueCat SDK for cross-platform subscription management (purchases_flutter)
- **REQ-10.2**: Configure RevenueCat with two subscription products for both stores:
  - Monthly: $2.99/month
  - Annual: $24.99/year (30% savings)
- **REQ-10.3**: Define free tier features:
  - Unlimited books (no book limit)
  - All core features (scanning, shelves, tags, notes, sync)
  - Manual organization and categorization
- **REQ-10.4**: Define premium tier features:
  - All free tier features
  - AI BISAC categorization
  - AI tag generation
  - Related books suggestions
  - Batch AI processing
  - AI Shelf Scan
  - Priority support
  - Early access to new features
- **REQ-10.5**: Implement RevenueCat Paywalls for seamless paywall UI
- **REQ-10.6**: Use RevenueCat Offerings to manage product presentation
- **REQ-10.7**: Check entitlements via RevenueCat SDK (isPremium)
- **REQ-10.8**: Gate premium AI features with entitlement checks
- **REQ-10.9**: Show "Upgrade to Premium" prompts at AI feature touchpoints
- **REQ-10.10**: Support subscription management through platform settings
- **REQ-10.11**: Implement OverridePremium feature for admin grants (via Firebase)
- **REQ-10.12**: Handle subscription lifecycle via RevenueCat webhooks and SDK
- **REQ-10.13**: Configure RevenueCat with both App Store Connect and Google Play Console
- **REQ-10.14**: Implement RevenueCat CustomerInfo listener for real-time updates

#### Acceptance Criteria
- RevenueCat paywall clearly communicates value proposition
- Purchase flow completes in <30 seconds via RevenueCat
- Premium features unlock immediately after purchase
- Free users can add unlimited books without restrictions
- Free users see upgrade prompts only at AI feature touchpoints
- RevenueCat entitlements sync across devices and platforms in real-time
- OverridePremium grants full access without purchase

---

### Epic 11: AI-Powered Features (Premium)

#### User Stories
- **US-11.1**: As a premium user, I want automatic BISAC categorization so my library is professionally organized
- **US-11.2**: As a premium user, I want AI-generated tags so I don't have to tag manually
- **US-11.3**: As a premium user, I want related book suggestions so I can discover similar titles
- **US-11.4**: As a premium user, I want batch processing so I can categorize my whole library at once
- **US-11.5**: As a premium user, I want to review AI suggestions before accepting
- **US-11.6**: As a premium user, I want to take a photo of my bookshelf and have AI identify all visible books so I can add my entire collection quickly

#### Requirements
- **REQ-11.1**: Integrate Firebase AI Logic SDK (`firebase_ai`) for direct Gemini API access from client
  - Initialize with `FirebaseAI.googleAI()` for Gemini Developer API (free tier available)
  - Or use `FirebaseAI.vertexAI()` for Vertex AI Gemini API (requires Blaze billing)
  - Use `gemini-2.5-flash` model for fast, cost-effective AI features
- **REQ-11.2**: Implement BISAC classification service:
  - Input: book title, author, description
  - Output: BISAC category + subcategory
  - Accuracy target: 85%+
- **REQ-11.3**: Implement tag generation service:
  - Input: book metadata
  - Output: 3-7 relevant tags
  - Include genre, themes, topics
- **REQ-11.4**: Implement related books service:
  - Calculate similarity based on: categories, tags, authors
  - Store top 5-10 related book IDs
  - Update when library changes
- **REQ-11.5**: Build batch processing UI:
  - Select multiple books for processing
  - Show progress queue
  - Display results and allow editing
- **REQ-11.6**: Implement AI Shelf Scan feature:
  - Camera interface for capturing bookshelf photos
  - Use Firebase AI Logic SDK with multimodal Gemini model for image analysis
  - Send image + prompt to Gemini for book spine detection and identification
  - Extract visible text from spines using Gemini's vision capabilities
  - Optionally use ML Kit text recognition as preprocessing step
  - Match identified books against Google Books API for full metadata
  - Present identified books for user review and confirmation
  - Allow user to correct misidentifications
  - Support multiple photos of same/different shelves
  - Track which books were added via shelf scan
- **REQ-11.7**: Implement shelf scan processing pipeline:
  - Image preprocessing (orientation, enhancement)
  - Spine detection and segmentation
  - OCR on detected spines (google_mlkit_text_recognition)
  - Fuzzy matching against book databases
  - Confidence scoring for each match
  - Batch import of confirmed books
- **REQ-11.8**: Build shelf scan review UI:
  - Display original photo with detected books highlighted
  - Show list of identified books with confidence scores
  - Allow tap to view/edit book details before adding
  - Support bulk accept/reject
  - Show which books are already in library (skip duplicates)
- **REQ-11.9**: Implement rate limiting to control AI costs:
  - 10 classifications per minute
  - Queue-based processing
  - Shelf scan: 3 images per session, cooldown period
- **REQ-11.10**: Cache AI results to avoid re-processing
- **REQ-11.11**: Allow manual override of AI suggestions
- **REQ-11.12**: Display AI confidence scores where applicable

#### Acceptance Criteria
- BISAC classification completes in <5 seconds per book
- Tag generation produces relevant, useful tags 90%+ of time
- Related books actually feel related/similar
- Batch processing can handle 100+ books without errors
- **Shelf scan identifies 70%+ of visible books correctly**
- **Shelf scan processing completes in <30 seconds per image**
- **Shelf scan UI clearly shows confidence levels for matches**
- **Users can easily correct misidentifications before importing**
- **Duplicate books are automatically detected and skipped**
- User can edit/reject AI suggestions
- Rate limiting prevents unexpected costs

---

### Epic 12: Search & Discovery

#### User Stories
- **US-12.1**: As a user, I want to search by title so I can find specific books
- **US-12.2**: As a user, I want to search by author so I can find all books by someone
- **US-12.3**: As a user, I want to filter by tags/categories so I can browse topics
- **US-12.4**: As a user, I want to filter by shelf so I can focus on one collection
- **US-12.5**: As a user, I want to filter by reading status so I can see my to-read list

#### Requirements
- **REQ-12.1**: Implement global search bar in library view
- **REQ-12.2**: Search across multiple fields: title, author, ISBN, tags, categories
- **REQ-12.3**: Support real-time filtering (as-you-type) with debounce
- **REQ-12.4**: Provide filter chips for: shelf, reading status, tags, category
- **REQ-12.5**: Support multiple simultaneous filters (AND logic)
- **REQ-12.6**: Highlight search matches in results
- **REQ-12.7**: Show result count and clear filter button
- **REQ-12.8**: Maintain filter state during session
- **REQ-12.9**: Implement efficient search algorithm (optimized for large libraries)

#### Acceptance Criteria
- Search results appear within 200ms of keystroke
- Search handles 1000+ book libraries smoothly
- Filters can be combined logically
- Clear visual indication of active filters
- Search works with partial matches and fuzzy matching

---

### Epic 13: Dewey Decimal System (Optional Feature)

#### User Stories
- **US-13.1**: As a librarian user, I want Dewey Decimal Numbers so I can organize professionally
- **US-13.2**: As a user, I want to toggle Dewey display so I can hide it if not needed
- **US-13.3**: As a user, I want Dewey categories shown so I understand the classification

#### Requirements
- **REQ-13.1**: Add deweyDecimalNumber field to Book model
- **REQ-13.2**: Implement DeweyDecimalHelper with category lookup
- **REQ-13.3**: Support manual Dewey number entry
- **REQ-13.4**: Attempt automatic Dewey lookup from Google Books/OpenLibrary
- **REQ-13.5**: Provide toggle in settings to show/hide Dewey information
- **REQ-13.6**: Display Dewey category name from number (e.g., "800" → "Literature")
- **REQ-13.7**: Allow sorting by Dewey number
- **REQ-13.8**: Show Dewey info in book detail view when enabled

#### Acceptance Criteria
- Dewey feature can be fully hidden if user doesn't want it
- Category names are accurate for valid Dewey numbers
- Sorting by Dewey number is numerically correct
- Feature doesn't clutter UI for users who don't use it

---

### Epic 14: Community Features

#### User Stories
- **US-14.1**: As a user, I want to see community statistics so I feel part of a community
- **US-14.2**: As a user, I want to contribute to anonymous book database so others benefit
- **US-14.3**: As a user, I want privacy so my personal library stays private

#### Requirements
- **REQ-14.1**: Implement Firestore public collection for anonymous book stats
- **REQ-14.2**: Track aggregate statistics:
  - Total books cataloged across all users
  - Most popular books
  - Popular categories/tags
- **REQ-14.3**: Display community stats view in settings
- **REQ-14.4**: Contribute anonymous book data (no user info):
  - ISBN
  - Title/Author (for popularity)
  - Categories (for trends)
- **REQ-14.5**: Ensure zero personal data in public database
- **REQ-14.6**: Make contribution opt-out (default on, user can disable)
- **REQ-14.7**: Use community data for improved metadata quality

#### Acceptance Criteria
- Community stats are interesting and engaging
- Absolutely no personal library data is shared publicly
- Users can opt out of contributing
- Community data improves over time with more users

---

### Epic 15: Settings & Customization

#### User Stories
- **US-15.1**: As a user, I want to customize display preferences so the app works for me
- **US-15.2**: As a user, I want to manage my subscription so I can upgrade/cancel
- **US-15.3**: As a user, I want to see app version and info so I can troubleshoot
- **US-15.4**: As a user, I want to sign out so I can switch accounts
- **US-15.5**: As a user, I want to delete my account so I can remove my data

#### Requirements
- **REQ-15.1**: Build settings view with sections:
  - Account (email, sign out, delete account)
  - Display (Dewey toggle, sort preference, theme)
  - Subscription (current plan, manage)
  - Data (import CSV, export CSV)
  - Privacy (community contribution toggle)
  - About (version, credits, privacy policy, terms)
- **REQ-15.2**: Implement sign out with confirmation
- **REQ-15.3**: Implement account deletion with strong confirmation:
  - Warning about data loss
  - Require re-authentication
  - Delete from Firestore and local database
- **REQ-15.4**: Link to subscription management (platform settings)
- **REQ-15.5**: Display current subscription status
- **REQ-15.6**: Show app version and build number (package_info_plus)
- **REQ-15.7**: Link to privacy policy and terms of service (url_launcher)

#### Acceptance Criteria
- All settings persist across app launches (shared_preferences)
- Sign out clears local data and returns to login
- Account deletion is irreversible and clearly warned
- Subscription status is accurate and real-time
- Links to legal documents work

---

### Epic 16: Visual Design & UX

#### User Stories
- **US-16.1**: As a user, I want a beautiful interface so using the app is enjoyable
- **US-16.2**: As a user, I want smooth animations so interactions feel responsive
- **US-16.3**: As a user, I want dark mode so I can read comfortably at night
- **US-16.4**: As a user, I want accessibility support so I can use the app regardless of ability

#### Requirements
- **REQ-16.1**: Implement custom design system:
  - Glass-morphism effects (BackdropFilter, ClipRRect)
  - Blur backgrounds
  - Subtle gradients
  - Smooth shadows
  - Consistent spacing and typography via ThemeData
- **REQ-16.2**: Use Material Icons and Cupertino Icons for platform-appropriate iconography
- **REQ-16.3**: Support Dynamic Type / font scaling for accessibility
- **REQ-16.4**: Implement full Dark Mode support (ThemeMode.dark)
- **REQ-16.5**: Add loading states and skeleton screens (shimmer package)
- **REQ-16.6**: Implement smooth transitions and animations (Hero, AnimatedContainer, etc.)
- **REQ-16.7**: Use haptic feedback for important actions (HapticFeedback class)
- **REQ-16.8**: Ensure minimum touch target size (48x48 dp per Material guidelines)
- **REQ-16.9**: Provide Semantics labels for all interactive elements (accessibility)
- **REQ-16.10**: Support landscape orientation on phone/tablet
- **REQ-16.11**: Optimize layout for tablet screen sizes (LayoutBuilder, MediaQuery)
- **REQ-16.12**: Adapt UI patterns per platform (Material on Android, Cupertino on iOS) where appropriate

#### Acceptance Criteria
- App follows Material Design 3 guidelines with platform adaptations
- All animations run at 60fps
- Dark mode works throughout entire app
- Screen readers can navigate all screens
- Design feels premium and modern
- No jarring transitions or loading states

---

## Technical Requirements

### Platform Requirements
- **iOS**: 14.0+ (broad device support including older iPhones)
- **Android**: API 24+ (Android 7.0 Nougat and above, ~95% of devices)
- **Devices**: Phones and tablets (responsive layout)
- **Orientation**: Portrait primary, landscape supported
- **Languages**: English (v1.0), internationalization-ready (flutter_localizations)

### Technology Stack
- **Framework**: Flutter 3.24+ (latest stable)
- **Language**: Dart 3.5+
- **Architecture**: Clean Architecture with Riverpod
  - Riverpod for state management and dependency injection
  - Repository pattern for data access abstraction
  - Use cases for business logic
  - Feature-based folder organization
- **Local Persistence**: Drift (SQLite) or Isar for offline-first storage
- **Backend**: Firebase
  - Authentication (email/password, Apple Sign In, Google Sign In)
  - Cloud Firestore (cloud storage and sync)
  - Firebase Storage (cover images)
  - Firebase Analytics (usage tracking)
  - Firebase AI Logic SDK (BISAC categorization, tag generation, book similarity, shelf scan AI)
  - Firebase Crashlytics (crash reporting)
- **Monetization**: RevenueCat (purchases_flutter for cross-platform subscriptions)
- **APIs**: Google Books API v1, OpenLibrary API, Gemini API (via Firebase AI Logic)
- **Camera/Scanner**: mobile_scanner package
- **ML/OCR**: google_mlkit_text_recognition for shelf scan OCR

### Key Flutter Packages
```yaml
dependencies:
  # Core
  flutter_riverpod: ^2.5.0
  freezed_annotation: ^2.4.0
  json_annotation: ^4.8.0
  
  # Firebase
  firebase_core: ^2.27.0
  firebase_auth: ^4.17.0
  cloud_firestore: ^4.15.0
  firebase_storage: ^11.6.0
  firebase_analytics: ^10.8.0
  firebase_crashlytics: ^3.4.0
  firebase_ai: ^0.3.0  # Firebase AI Logic SDK for Gemini API access
  
  # Local Storage
  drift: ^2.15.0
  sqlite3_flutter_libs: ^0.5.0
  path_provider: ^2.1.0
  shared_preferences: ^2.2.0
  flutter_secure_storage: ^9.0.0
  
  # UI/UX
  go_router: ^13.0.0
  flutter_rating_bar: ^4.0.0
  shimmer: ^3.0.0
  cached_network_image: ^3.3.0
  
  # Camera & Scanning
  mobile_scanner: ^4.0.0
  image_picker: ^1.0.0
  google_mlkit_text_recognition: ^0.11.0
  
  # Subscriptions
  purchases_flutter: ^6.0.0
  
  # Utilities
  connectivity_plus: ^5.0.0
  package_info_plus: ^5.0.0
  share_plus: ^7.0.0
  url_launcher: ^6.2.0
  file_picker: ^6.0.0
  csv: ^5.0.0
  uuid: ^4.0.0
  intl: ^0.19.0

dev_dependencies:
  build_runner: ^2.4.0
  freezed: ^2.4.0
  json_serializable: ^6.7.0
  drift_dev: ^2.15.0
  flutter_lints: ^3.0.0
  mocktail: ^1.0.0
```

### Firebase AI Logic Setup

The app uses the **Firebase AI Logic SDK** (`firebase_ai`) to access Gemini models directly from the client app. This provides AI-powered features without requiring custom Cloud Functions.

#### Prerequisites
1. Firebase project with billing enabled (Blaze plan) OR Gemini Developer API (free tier available)
2. Firebase AI Logic enabled in the Firebase console
3. Required APIs enabled automatically through Firebase console setup

#### Initialization Pattern
```dart
import 'package:firebase_ai/firebase_ai.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// Initialize Firebase
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);

// Option 1: Gemini Developer API (recommended for getting started, free tier available)
final model = FirebaseAI.googleAI().generativeModel(model: 'gemini-2.5-flash');

// Option 2: Vertex AI Gemini API (requires Blaze billing)
// final model = FirebaseAI.vertexAI().generativeModel(model: 'gemini-2.5-flash');
```

#### AI Service Implementation
```dart
class AIService {
  late final GenerativeModel _model;
  
  AIService() {
    // Initialize with Gemini Developer API backend
    _model = FirebaseAI.googleAI().generativeModel(model: 'gemini-2.5-flash');
  }
  
  /// Generate BISAC category for a book
  Future<BISACResult> classifyBook({
    required String title,
    required String author,
    String? description,
  }) async {
    final prompt = '''
    Classify this book into a BISAC category and subcategory.
    
    Title: $title
    Author: $author
    ${description != null ? 'Description: $description' : ''}
    
    Respond in JSON format:
    {
      "category": "FICTION",
      "subcategory": "Literary",
      "confidence": 0.95
    }
    ''';
    
    final response = await _model.generateContent([Content.text(prompt)]);
    return BISACResult.fromJson(jsonDecode(response.text!));
  }
  
  /// Generate tags for a book
  Future<List<String>> generateTags({
    required String title,
    required String author,
    String? description,
    List<String>? categories,
  }) async {
    final prompt = '''
    Generate 3-7 relevant tags for this book. Tags should include genre, themes, 
    time period, and notable characteristics.
    
    Title: $title
    Author: $author
    ${description != null ? 'Description: $description' : ''}
    ${categories != null ? 'Categories: ${categories.join(', ')}' : ''}
    
    Respond with a JSON array of strings only:
    ["tag1", "tag2", "tag3"]
    ''';
    
    final response = await _model.generateContent([Content.text(prompt)]);
    return List<String>.from(jsonDecode(response.text!));
  }
  
  /// Identify books from shelf scan image
  Future<List<IdentifiedBook>> identifyBooksFromImage(Uint8List imageBytes) async {
    final prompt = '''
    Analyze this bookshelf image and identify all visible books.
    For each book you can identify, provide:
    - The title (as best you can read it)
    - The author (if visible)
    - Your confidence level (0.0 to 1.0)
    
    Respond in JSON format:
    {
      "books": [
        {"title": "Book Title", "author": "Author Name", "confidence": 0.85},
        ...
      ]
    }
    ''';
    
    final response = await _model.generateContent([
      Content.multi([
        TextPart(prompt),
        InlineDataPart('image/jpeg', imageBytes),
      ])
    ]);
    
    final result = jsonDecode(response.text!);
    return (result['books'] as List)
        .map((b) => IdentifiedBook.fromJson(b))
        .toList();
  }
}
```

#### Production Considerations
- **App Check**: Enable Firebase App Check to protect against API abuse
- **Rate Limiting**: Implement client-side rate limiting (10 classifications/minute)
- **Caching**: Cache AI results to avoid re-processing identical requests
- **Remote Config**: Use Firebase Remote Config to change model names without app updates
- **Error Handling**: Implement proper error handling for API failures and quota limits

### Performance Requirements
- **App Launch**: <2 seconds to interactive state (cold start)
- **Barcode Scan**: <3 seconds from scan to metadata fetched
- **Search**: <200ms response time for queries
- **Sync**: <5 seconds for typical sync operations
- **Offline**: Fully functional with no network
- **Large Libraries**: Support 10,000+ books without degradation
- **Frame Rate**: 60fps animations and scrolling
- **APK/IPA Size**: <50MB initial download
- **Memory**: <150MB RAM usage for typical library (500 books)

### Security Requirements
- **Authentication**: Firebase Auth with secure token management
- **Data Encryption**: HTTPS for all network traffic, encrypted Firestore
- **Local Storage**: Encrypted local database, flutter_secure_storage for credentials
- **Privacy**: No PII collection beyond email, no tracking without consent
- **Compliance**: GDPR-ready (data export, account deletion)
- **Platform Security**: iOS Keychain / Android Keystore via flutter_secure_storage

### Quality Requirements
- **Test Coverage**: 80%+ unit test coverage for business logic
- **Crash Rate**: <0.1% crash-free sessions
- **API Success Rate**: 99%+ for book metadata retrieval
- **Sync Success Rate**: 99.5%+ successful sync operations
- **Store Ratings**: 4.5+ stars target on both App Store and Google Play

---

## Pricing Model

### Free Tier
- **Price**: Free forever
- **Book Limit**: Unlimited books
- **Features**:
  - **Unlimited books** (no restrictions)
  - Barcode scanning
  - Manual entry and search
  - Book metadata from APIs
  - Custom shelves (unlimited)
  - Tags (manual, unlimited)
  - Notes (unlimited)
  - Reading status tracking
  - Ratings
  - Loan tracking
  - Cloud sync
  - CSV import/export
  - Advanced search and filtering
  - Reading statistics
  - Dewey Decimal support

### Premium Tier
- **Monthly**: $2.99/month
- **Annual**: $24.99/year ($2.08/month, 30% savings)
- **Features**: Everything in free, plus:
  - **AI Shelf Scan** (take a photo of your bookshelf, AI identifies and adds all visible books)
  - **AI BISAC categorization** (automatic professional categorization)
  - **AI tag generation** (intelligent auto-tagging)
  - **Related books suggestions** (discover similar titles in your library)
  - **Batch AI processing** (organize entire library at once)
  - **Priority support**
  - **Early access to new features**

### Target Conversion Funnel
1. **Acquisition**: 200K downloads/year (combined platforms)
2. **Activation**: 140K add 5+ books (70%)
3. **Engagement**: 56K weekly active (40% of activated)
4. **Retention**: 28K 30-day retained (50% of engaged)
5. **Conversion**: 2.8K premium subscribers (10% of retained)
6. **Revenue**: $100K ARR (2,800 × $2.99 × 12)

### Premium Upgrade Triggers
- **Shelf Scan**: Show "Scan Your Entire Bookshelf with AI" prominent CTA in scanner view
- **AI features**: Show "Unlock AI categorization" CTA when viewing book details
- **Batch processing**: "Upgrade to organize entire library with AI" in settings
- **Related books**: "Discover similar books with Premium" when browsing
- **Tag generation**: "Auto-generate tags with AI" prompt when manually tagging
- **Onboarding**: Feature shelf scan as hero benefit during tutorial
- **Settings**: Dedicated "Premium Features" section showcasing AI capabilities

---

## Analytics & Metrics

### Key Metrics to Track

#### Acquisition
- Daily/Weekly/Monthly downloads (by platform)
- Install source (organic, ads, referral)
- Onboarding completion rate
- Platform split (iOS vs Android)

#### Activation
- % users who add first book
- % users who add 5+ books
- Time to first book added
- Books added per session

#### Engagement
- Daily/Weekly/Monthly active users
- Session frequency
- Session duration
- Books added per user per week
- Features used per session

#### Retention
- Day 1, 7, 30 retention rates
- Cohort retention curves
- Churn rate by cohort
- Platform retention comparison

#### Monetization
- Free to premium conversion rate (by platform)
- Monthly vs annual split
- Upgrade trigger attribution
- Subscription lifetime value
- Churn rate by subscription type

#### Technical
- Crash-free session rate (by platform)
- API success/failure rates
- Sync success rate and latency
- Search performance
- Scan success rate

#### Feature Usage
- Barcode scan vs manual entry ratio
- CSV import usage
- Tag usage (free users)
- AI feature usage (premium users)
- Loan tracking usage
- Reading stats views

### Firebase Analytics Events
```
- book_scanned
- book_added_manual
- book_edited
- book_deleted
- shelf_created
- tag_added
- reading_status_changed
- loan_tracked
- csv_imported
- csv_exported
- shelf_scan_started (premium)
- shelf_scan_completed (premium)
- shelf_scan_books_identified (premium)
- shelf_scan_books_added (premium)
- ai_categorization_used (premium)
- ai_tags_generated (premium)
- related_books_viewed (premium)
- upgrade_prompt_shown
- upgrade_prompt_source (shelf_scan, categorization, tags, etc.)
- subscription_purchased
- subscription_cancelled
```

---

## Success Criteria

### Launch (Month 1)
- ✅ App approved and live on App Store and Google Play
- ✅ 10,000 downloads in first month (combined)
- ✅ <0.5% crash rate
- ✅ 4.0+ rating on both stores
- ✅ 60% onboarding completion
- ✅ 50% of users add at least 1 book

### Growth (Month 3)
- ✅ 50,000 total downloads
- ✅ 20,000 monthly active users
- ✅ 50% 30-day retention
- ✅ 2% free-to-premium conversion
- ✅ 4.3+ store ratings
- ✅ 400+ premium subscribers

### Maturity (Month 12)
- ✅ 200,000 total downloads
- ✅ 80,000 monthly active users
- ✅ 50% 30-day retention maintained
- ✅ 5-10% free-to-premium conversion
- ✅ 4.5+ store ratings
- ✅ 4,000+ premium subscribers
- ✅ $100K+ annual recurring revenue

---

## Release Strategy

### Phase 1: Private Beta (Weeks 1-4)
- **Goal**: Validate core functionality, identify critical bugs
- **Audience**: 100 internal testers and friends/family (50 iOS, 50 Android)
- **Scope**: Full feature set, both free and premium tiers
- **Distribution**: TestFlight (iOS), Firebase App Distribution (Android)
- **Success Metrics**:
  - <1% crash rate on both platforms
  - Positive qualitative feedback
  - Average 50+ books added per tester
  - All critical bugs resolved

### Phase 2: Public Beta (Weeks 5-8)
- **Goal**: Stress test at scale, refine UX, validate pricing
- **Audience**: 1,000 beta users (600 iOS, 400 Android)
- **Scope**: Complete app with subscription pricing
- **Distribution**: TestFlight public link, Google Play Open Testing
- **Success Metrics**:
  - <0.2% crash rate
  - 4.0+ beta tester rating
  - 5%+ conversion to premium (among engaged users)
  - Performance validated with large libraries (1000+ books)

### Phase 3: v1.0 Launch (Week 9)
- **Goal**: Public release to both stores
- **Marketing**:
  - Product Hunt launch
  - Reddit (r/books, r/androidapps, r/iOSapps)
  - Book community forums
  - Press outreach to tech blogs
- **Scope**: Full featured app as specified in this PRD
- **Success Metrics**: See "Success Criteria - Launch" above

### Phase 4: Iteration & Growth (Months 2-12)
- **Goal**: Achieve product-market fit, optimize conversion, grow user base
- **Focus Areas**:
  - A/B test paywall messaging and pricing
  - Improve AI accuracy based on feedback
  - Optimize onboarding for activation
  - Add community-requested features
  - Expand marketing channels
  - Consider tablet-optimized layouts
  - Plan for web version

---

## Future Roadmap (Post v1.0)

### v1.1 - Enhanced Discovery & Social
- Advanced search with additional filters
- Enhanced reading statistics dashboard with charts (fl_chart)
- AI-powered book recommendations (beyond related books)
- Social features (share library, book clubs)
- Shelf scan improvements (better accuracy, multi-angle stitching)

### v1.2 - Tablet & Web Expansion
- Tablet-optimized interface with multi-column layout
- Flutter web version for desktop access
- Responsive design improvements

### v1.3 - Social & Community
- Follow other users
- Public/private library sharing
- Book clubs and discussions
- Reading challenges

### v1.4 - Advanced Features
- Wishlists with price tracking
- Location tracking (which room/shelf physically)
- Book condition tracking for collectors
- Estimated library value
- Lending reminders (notifications via firebase_messaging)

### v2.0 - Platform Maturity
- Widgets for iOS and Android home screens
- Wear OS / watchOS companion apps
- Deep linking and app shortcuts
- Advanced offline capabilities

---

## Architecture Decisions

### Why Flutter?
- **Cross-platform**: Single codebase for iOS and Android, 95%+ code reuse
- **Performance**: Native compilation delivers near-native performance
- **UI flexibility**: Custom design system without platform constraints
- **Developer productivity**: Hot reload, excellent tooling
- **Growing ecosystem**: Strong package ecosystem, active community
- **Future-ready**: Easy expansion to web, desktop, embedded

### Why Drift/Isar + Firebase?
- **Local-first**: Fast local access, offline support, type-safe
- **Firebase**: Real-time sync, authentication, scalability, cloud storage
- **Best of both worlds**: Local performance + cloud backup/sync
- **Cross-platform**: Works identically on iOS and Android

### Why Firebase AI Logic SDK?
- **Direct client access**: Call Gemini API directly from Flutter app without Cloud Functions
- **Two API provider options**: 
  - Gemini Developer API (free tier available, no billing required to start)
  - Vertex AI Gemini API (production-grade, requires Blaze billing)
- **Seamless Firebase integration**: Works with existing Firebase Auth, App Check, and analytics
- **Cross-platform**: Same SDK works on iOS, Android, Web, and other Flutter platforms
- **Built-in security**: Firebase App Check integration to prevent API abuse
- **No API key management**: SDK handles authentication automatically via Firebase project
- **Cost-effective**: Use `gemini-2.5-flash` for fast, affordable AI features

### Why RevenueCat for Subscriptions?
- **Cross-platform**: Single SDK for iOS and Android
- **Server-side receipt validation**: Enhanced security
- **Real-time webhooks**: Instant entitlement updates across all platforms
- **No-code paywall updates**: Modify pricing/messaging without app releases
- **Advanced analytics built-in**: MRR, churn, cohorts, LTV - out of the box
- **A/B testing support**: Test pricing strategies without code changes
- **Customer management**: Built-in refund handling and support tools
- **Reduced engineering overhead**: Abstracts store complexity

### Why Unlimited Free Tier?
- **Lower friction to adoption**: Users can catalog entire library before deciding on premium
- **Demonstrates value first**: Users experience the app fully before upgrade prompt
- **AI as differentiator**: Premium value is time-savings through AI, not artificial limits
- **Shelf scan as hero feature**: Most compelling upgrade trigger
- **Competitive advantage**: Most library apps limit free tier, we differentiate with generosity
- **Better word-of-mouth**: Happy free users recommend the app more
- **Data network effects**: More free users = better AI training data

### Why Riverpod Architecture?
- **Compile-safe**: No runtime errors from missing providers
- **Testable**: Easy to mock and test
- **Scalable**: Works well for small and large apps
- **No context needed**: Access state anywhere without BuildContext
- **Flutter-native**: Designed specifically for Flutter patterns
- **Clear data flow**: Unidirectional data flow, easy to debug

---

## Risks & Mitigation

### Technical Risks

**Risk**: Firebase AI Logic / Gemini API costs exceed projections (especially with shelf scan)
- **Mitigation**: Start with Gemini Developer API free tier, implement strict rate limiting (3 shelf scans per session), cache results, monitor costs daily, optimize image preprocessing to reduce API calls
- **Fallback**: Reduce shelf scan quota, increase premium pricing, upgrade to Vertex AI for better quotas, offer shelf scan as add-on purchase

**Risk**: Google Books/OpenLibrary API reliability issues
- **Mitigation**: Implement fallback chain, caching, manual entry always available
- **Fallback**: Add additional API sources (Amazon, etc.)

**Risk**: Sync conflicts causing data loss
- **Mitigation**: Last-write-wins with timestamp, comprehensive testing, user conflict resolution UI
- **Fallback**: Maintain version history, allow manual merge

**Risk**: Platform-specific bugs in Flutter
- **Mitigation**: Thorough testing on both platforms, platform channels for native features when needed
- **Fallback**: Platform-specific implementations where necessary

**Risk**: Shelf scan accuracy lower than expected
- **Mitigation**: Set realistic expectations (70% target), extensive testing with diverse bookshelves, iterate on AI prompts and image preprocessing
- **Fallback**: Allow manual correction UI, fall back to individual barcode scanning

### Business Risks

**Risk**: Low free-to-premium conversion rate
- **Mitigation**: A/B test pricing, paywall messaging, premium feature set
- **Fallback**: Adjust pricing, increase free tier limits, add more premium features

**Risk**: High churn rate after subscription
- **Mitigation**: Deliver continuous value, improve AI features, add community features
- **Fallback**: Win-back campaigns, annual discounts, new feature releases

**Risk**: App store rejection (either platform)
- **Mitigation**: Follow platform guidelines strictly, review before submission
- **Fallback**: Address feedback quickly, have legal review if needed

**Risk**: Competitor launches similar app
- **Mitigation**: Build defensible moat with AI features, data quality, design excellence
- **Fallback**: Differentiate with unique features, faster iteration

### Market Risks

**Risk**: Market too small (not enough home library owners)
- **Mitigation**: Validate demand in beta, test marketing channels early
- **Fallback**: Pivot to adjacent markets (book clubs, teachers, libraries)

**Risk**: Users satisfied with free tier, don't upgrade
- **Mitigation**: Make AI features compelling and clearly valuable, position as time-savers
- **Fallback**: Add more premium AI features, introduce premium-only analytics

**Risk**: RevenueCat costs scale with revenue
- **Mitigation**: RevenueCat's 1% revenue fee is only charged on success, aligns incentives
- **Fallback**: If at scale (>$2.5M ARR), consider custom implementation

---

## Appendices

### Appendix A: API Specifications

#### Google Books API v1
- **Endpoint**: `https://www.googleapis.com/books/v1/volumes`
- **Query by ISBN**: `?q=isbn:{ISBN}`
- **Rate Limit**: 1000 requests/day (free), higher with API key
- **Response**: JSON with title, authors, publisher, description, categories, pageCount, imageLinks

#### OpenLibrary API
- **Endpoint**: `https://openlibrary.org/api/books`
- **Query by ISBN**: `?bibkeys=ISBN:{ISBN}&format=json&jscmd=data`
- **Rate Limit**: No official limit, be respectful
- **Response**: JSON with book metadata

### Appendix B: Firebase Schema

#### Firestore Structure
```
users/{userId}/
  profile/
    info/
      - email: String
      - createdAt: Timestamp
      - OverridePremium: Number (0 or 1)

  books/{bookId}/
    - id: String
    - isbn: String
    - title: String
    - authors: [String]
    - [all Book fields]
    - updatedAt: Timestamp

  shelves/{shelfId}/
    - id: String
    - name: String
    - dateCreated: Timestamp
    - updatedAt: Timestamp
```

#### Community Stats (Public Collection)
```
community_books/
  {isbn}/
    - isbn: String (indexed)
    - title: String
    - author: String
    - category: String
    - timesAdded: Int (popularity counter)
```

### Appendix C: Drift Database Schema

```dart
// books.dart
class Books extends Table {
  TextColumn get id => text()();
  TextColumn get isbn => text()();
  TextColumn get title => text()();
  TextColumn get subtitle => text().nullable()();
  TextColumn get authors => text()(); // JSON array
  TextColumn get publisher => text().nullable()();
  TextColumn get publishedDate => text().nullable()();
  TextColumn get bookDescription => text().nullable()();
  BlobColumn get coverImageData => blob().nullable()();
  IntColumn get pageCount => integer().nullable()();
  TextColumn get categories => text().nullable()(); // JSON array
  TextColumn get language => text().nullable()();
  DateTimeColumn get dateAdded => dateTime()();
  TextColumn get deweyDecimalNumber => text().nullable()();
  TextColumn get bisacCategory => text().nullable()();
  TextColumn get bisacSubcategory => text().nullable()();
  TextColumn get shelfId => text().nullable()();
  TextColumn get notes => text().nullable()();
  TextColumn get tags => text().nullable()(); // JSON array
  TextColumn get relatedBookIds => text().nullable()(); // JSON array
  TextColumn get loanedTo => text().nullable()();
  DateTimeColumn get loanDate => dateTime().nullable()();
  IntColumn get userRating => integer().nullable()();
  DateTimeColumn get dateRead => dateTime().nullable()();
  TextColumn get readingStatus => text().nullable()();
  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

// shelves.dart
class Shelves extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  DateTimeColumn get dateCreated => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
```

### Appendix D: RevenueCat Configuration

```dart
// RevenueCat initialization
import 'package:purchases_flutter/purchases_flutter.dart';

Future<void> initRevenueCat() async {
  await Purchases.setLogLevel(LogLevel.debug);
  
  PurchasesConfiguration configuration;
  if (Platform.isIOS) {
    configuration = PurchasesConfiguration('ios_api_key');
  } else {
    configuration = PurchasesConfiguration('android_api_key');
  }
  
  await Purchases.configure(configuration);
}

// Check entitlements
Future<bool> checkPremiumStatus() async {
  final customerInfo = await Purchases.getCustomerInfo();
  return customerInfo.entitlements.all['premium']?.isActive ?? false;
}

// Present paywall
Future<void> showPaywall() async {
  final offerings = await Purchases.getOfferings();
  final offering = offerings.current;
  
  if (offering != null) {
    // Show paywall UI with offering
  }
}

// Product IDs (configured in both stores)
// iOS: com.shelves.premium.monthly, com.shelves.premium.annual
// Android: com.shelves.premium.monthly, com.shelves.premium.annual

// RevenueCat Entitlement Identifier: "premium"
```

### Appendix E: Design Assets Required

- App icon (1024x1024, adaptive for Android)
- Launch screen / Splash screen
- Empty state illustrations
- Onboarding screen graphics
- Paywall hero image
- App Store screenshots (6.7", 6.5", 5.5" displays)
- Google Play screenshots (phone, 7" tablet, 10" tablet)
- Feature graphic for Google Play (1024x500)
- App Store preview video (optional but recommended)

### Appendix F: Legal Requirements

- Privacy Policy (required for both stores)
- Terms of Service
- End User License Agreement (EULA)
- In-app subscription terms
- Data deletion policy (GDPR compliance)
- Google Play Data Safety section
- App Store Privacy Nutrition Labels

---

## Document Approval

**Product Owner**: [Name]
**Engineering Lead**: [Name]
**Design Lead**: [Name]
**Date**: December 18, 2025

---

## Revision History

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | Dec 15, 2025 | Product Team | Initial PRD for iOS-only SwiftUI version |
| 2.0 | Dec 18, 2025 | Product Team | Complete rewrite for Flutter cross-platform (iOS + Android); Updated tech stack to Flutter/Dart with Riverpod; Added Android-specific requirements; Updated download/revenue targets for dual platform; Changed persistence from SwiftData to Drift |
| 2.1 | Dec 18, 2025 | Product Team | Updated AI integration to use Firebase AI Logic SDK (`firebase_ai`) for direct Gemini API access; Added detailed implementation patterns for BISAC classification, tag generation, and shelf scan; Added Appendix G with Firebase AI Logic configuration |

### Appendix G: Firebase AI Logic Configuration

#### Console Setup
1. Go to Firebase Console → Your Project → AI Logic
2. Click "Get started" to enable required APIs
3. Choose API provider:
   - **Gemini Developer API**: Free tier available, recommended for development
   - **Vertex AI Gemini API**: Requires Blaze plan, recommended for production
4. Enable Firebase App Check for production security

#### Flutter Integration

```dart
// pubspec.yaml
dependencies:
  firebase_ai: ^0.3.0

// Initialize Firebase AI Logic
import 'package:firebase_ai/firebase_ai.dart';

// Option 1: Gemini Developer API (free tier available)
final model = FirebaseAI.googleAI().generativeModel(model: 'gemini-2.5-flash');

// Option 2: Vertex AI (requires Blaze billing)
final model = FirebaseAI.vertexAI().generativeModel(model: 'gemini-2.5-flash');

// Generate content
final prompt = [Content.text('Classify this book...')];
final response = await model.generateContent(prompt);
print(response.text);

// Multimodal (image + text) for shelf scan
final response = await model.generateContent([
  Content.multi([
    TextPart('Identify books in this image...'),
    InlineDataPart('image/jpeg', imageBytes),
  ])
]);
```

#### Supported Models
| Model | Best For | Speed | Cost |
|-------|----------|-------|------|
| `gemini-2.5-flash` | Most use cases, fast responses | Fast | Low |
| `gemini-2.5-pro` | Complex reasoning, higher accuracy | Medium | Medium |
| `gemini-2.0-flash` | Multimodal, image analysis | Fast | Low |

#### Security Best Practices
- Enable Firebase App Check before production launch
- Use Remote Config to change model names without app updates
- Implement client-side rate limiting
- Cache AI responses to reduce API calls
- Monitor usage in Firebase Console

---

**End of Document**