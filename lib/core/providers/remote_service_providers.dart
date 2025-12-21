import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/datasources/remote/firebase_storage_service.dart';
import '../../data/datasources/remote/firestore_service.dart';
import '../../data/datasources/remote/google_books_api.dart';
import '../../data/datasources/remote/open_library_api.dart';
import 'firebase_providers.dart';

part 'remote_service_providers.g.dart';

/// Provides the FirestoreService instance.
@Riverpod(keepAlive: true)
FirestoreService firestoreService(Ref ref) =>
    FirestoreService(firestore: ref.watch(firestoreProvider));

/// Provides the FirebaseStorageService instance.
@Riverpod(keepAlive: true)
FirebaseStorageService firebaseStorageService(Ref ref) =>
    FirebaseStorageService(storage: ref.watch(firebaseStorageProvider));

/// Provides the GoogleBooksApi instance.
@Riverpod(keepAlive: true)
GoogleBooksApi googleBooksApi(Ref ref) => GoogleBooksApi();

/// Provides the OpenLibraryApi instance.
@Riverpod(keepAlive: true)
OpenLibraryApi openLibraryApi(Ref ref) => OpenLibraryApi();
