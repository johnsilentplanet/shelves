import 'dart:typed_data';

import 'package:http/http.dart' as http;

import '../datasources/remote/google_books_api.dart';
import '../datasources/remote/open_library_api.dart';

/// Result from book metadata lookup.
class BookMetadata {
  const BookMetadata({
    required this.isbn,
    this.title,
    this.subtitle,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.pageCount,
    this.categories,
    this.language,
    this.coverImageUrl,
    this.coverImageData,
    this.source,
  });

  final String isbn;
  final String? title;
  final String? subtitle;
  final List<String>? authors;
  final String? publisher;
  final String? publishedDate;
  final String? description;
  final int? pageCount;
  final List<String>? categories;
  final String? language;
  final String? coverImageUrl;
  final Uint8List? coverImageData;
  final MetadataSource? source;

  /// Returns true if we got meaningful data.
  bool get hasData => title != null && title!.isNotEmpty;

  /// Creates a copy with the specified fields replaced.
  BookMetadata copyWith({
    String? isbn,
    String? title,
    String? subtitle,
    List<String>? authors,
    String? publisher,
    String? publishedDate,
    String? description,
    int? pageCount,
    List<String>? categories,
    String? language,
    String? coverImageUrl,
    Uint8List? coverImageData,
    MetadataSource? source,
  }) {
    return BookMetadata(
      isbn: isbn ?? this.isbn,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      authors: authors ?? this.authors,
      publisher: publisher ?? this.publisher,
      publishedDate: publishedDate ?? this.publishedDate,
      description: description ?? this.description,
      pageCount: pageCount ?? this.pageCount,
      categories: categories ?? this.categories,
      language: language ?? this.language,
      coverImageUrl: coverImageUrl ?? this.coverImageUrl,
      coverImageData: coverImageData ?? this.coverImageData,
      source: source ?? this.source,
    );
  }
}

/// Source of metadata.
enum MetadataSource {
  googleBooks,
  openLibrary,
  manual,
}

/// Repository for fetching book metadata from external APIs.
class MetadataRepository {
  MetadataRepository({
    GoogleBooksApi? googleBooksApi,
    OpenLibraryApi? openLibraryApi,
    http.Client? httpClient,
  })  : _googleBooksApi = googleBooksApi ?? GoogleBooksApi(),
        _openLibraryApi = openLibraryApi ?? OpenLibraryApi(),
        _httpClient = httpClient ?? http.Client();

  final GoogleBooksApi _googleBooksApi;
  final OpenLibraryApi _openLibraryApi;
  final http.Client _httpClient;

  /// Looks up book metadata by ISBN.
  /// Tries Google Books first, falls back to OpenLibrary.
  Future<BookMetadata?> lookupByIsbn(String isbn) async {
    // Try Google Books first
    final googleResult = await _googleBooksApi.lookupByIsbn(isbn);
    if (googleResult != null && googleResult.hasData) {
      return _fromGoogleBooks(googleResult);
    }

    // Fall back to OpenLibrary
    final openLibraryResult = await _openLibraryApi.lookupByIsbn(isbn);
    if (openLibraryResult != null && openLibraryResult.hasData) {
      return _fromOpenLibrary(openLibraryResult);
    }

    return null;
  }

  /// Searches for books by query.
  Future<List<BookMetadata>> search(String query, {int maxResults = 10}) async {
    final results = await _googleBooksApi.search(query, maxResults: maxResults);
    return results.map(_fromGoogleBooks).toList();
  }

  /// Downloads a cover image from URL.
  Future<Uint8List?> downloadCoverImage(String url) async {
    try {
      final response = await _httpClient.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return response.bodyBytes;
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  /// Looks up metadata and downloads cover image if available.
  Future<BookMetadata?> lookupWithCover(String isbn) async {
    final metadata = await lookupByIsbn(isbn);
    if (metadata == null) return null;

    if (metadata.coverImageUrl != null) {
      final coverData = await downloadCoverImage(metadata.coverImageUrl!);
      if (coverData != null) {
        return metadata.copyWith(coverImageData: coverData);
      }
    }

    return metadata;
  }

  BookMetadata _fromGoogleBooks(GoogleBooksResult result) {
    return BookMetadata(
      isbn: result.isbn,
      title: result.title,
      subtitle: result.subtitle,
      authors: result.authors,
      publisher: result.publisher,
      publishedDate: result.publishedDate,
      description: result.description,
      pageCount: result.pageCount,
      categories: result.categories,
      language: result.language,
      coverImageUrl: result.coverImageUrl,
      source: MetadataSource.googleBooks,
    );
  }

  BookMetadata _fromOpenLibrary(OpenLibraryResult result) {
    return BookMetadata(
      isbn: result.isbn,
      title: result.title,
      subtitle: result.subtitle,
      authors: result.authors,
      publisher: result.publisher,
      publishedDate: result.publishDate,
      pageCount: result.numberOfPages,
      categories: result.subjects,
      coverImageUrl: result.coverUrl,
      source: MetadataSource.openLibrary,
    );
  }

  /// Disposes resources.
  void dispose() {
    _googleBooksApi.dispose();
    _openLibraryApi.dispose();
    _httpClient.close();
  }
}
