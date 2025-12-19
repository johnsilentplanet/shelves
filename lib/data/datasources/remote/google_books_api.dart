import 'dart:convert';

import 'package:http/http.dart' as http;

/// Response from the Google Books API.
class GoogleBooksResult {
  const GoogleBooksResult({
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

  /// Returns true if we got meaningful data.
  bool get hasData => title != null && title!.isNotEmpty;
}

/// Service for Google Books API operations.
class GoogleBooksApi {
  GoogleBooksApi({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;
  static const String _baseUrl = 'https://www.googleapis.com/books/v1/volumes';

  /// Looks up a book by ISBN.
  Future<GoogleBooksResult?> lookupByIsbn(String isbn) async {
    final cleanIsbn = isbn.replaceAll(RegExp(r'[^0-9X]'), '');
    if (cleanIsbn.isEmpty) return null;

    try {
      final uri = Uri.parse('$_baseUrl?q=isbn:$cleanIsbn');
      final response = await _client.get(uri);

      if (response.statusCode != 200) {
        return null;
      }

      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final totalItems = json['totalItems'] as int? ?? 0;

      if (totalItems == 0) {
        return null;
      }

      final items = json['items'] as List<dynamic>?;
      if (items == null || items.isEmpty) {
        return null;
      }

      return _parseVolumeInfo(items.first as Map<String, dynamic>, cleanIsbn);
    } catch (e) {
      return null;
    }
  }

  /// Searches for books by query (title, author, etc.).
  Future<List<GoogleBooksResult>> search(String query, {int maxResults = 10}) async {
    if (query.trim().isEmpty) return [];

    try {
      final uri = Uri.parse(
        '$_baseUrl?q=${Uri.encodeComponent(query)}&maxResults=$maxResults',
      );
      final response = await _client.get(uri);

      if (response.statusCode != 200) {
        return [];
      }

      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final items = json['items'] as List<dynamic>?;

      if (items == null || items.isEmpty) {
        return [];
      }

      return items
          .map((item) => _parseVolumeInfo(item as Map<String, dynamic>, null))
          .where((result) => result.hasData)
          .toList();
    } catch (e) {
      return [];
    }
  }

  GoogleBooksResult _parseVolumeInfo(Map<String, dynamic> item, String? isbn) {
    final volumeInfo = item['volumeInfo'] as Map<String, dynamic>? ?? {};

    // Try to get ISBN from volume info if not provided
    String? resultIsbn = isbn;
    if (resultIsbn == null) {
      final identifiers =
          volumeInfo['industryIdentifiers'] as List<dynamic>? ?? [];
      for (final id in identifiers) {
        final idMap = id as Map<String, dynamic>;
        final type = idMap['type'] as String?;
        if (type == 'ISBN_13' || type == 'ISBN_10') {
          resultIsbn = idMap['identifier'] as String?;
          break;
        }
      }
    }

    // Get cover image URL (prefer larger thumbnail)
    String? coverUrl;
    final imageLinks = volumeInfo['imageLinks'] as Map<String, dynamic>?;
    if (imageLinks != null) {
      coverUrl = imageLinks['thumbnail'] as String? ??
          imageLinks['smallThumbnail'] as String?;
      // Convert to HTTPS and get larger image
      if (coverUrl != null) {
        coverUrl = coverUrl.replaceFirst('http://', 'https://');
        // Request larger zoom level
        coverUrl = coverUrl.replaceFirst('zoom=1', 'zoom=2');
      }
    }

    return GoogleBooksResult(
      isbn: resultIsbn ?? '',
      title: volumeInfo['title'] as String?,
      subtitle: volumeInfo['subtitle'] as String?,
      authors: (volumeInfo['authors'] as List<dynamic>?)
          ?.map((a) => a as String)
          .toList(),
      publisher: volumeInfo['publisher'] as String?,
      publishedDate: volumeInfo['publishedDate'] as String?,
      description: volumeInfo['description'] as String?,
      pageCount: volumeInfo['pageCount'] as int?,
      categories: (volumeInfo['categories'] as List<dynamic>?)
          ?.map((c) => c as String)
          .toList(),
      language: volumeInfo['language'] as String?,
      coverImageUrl: coverUrl,
    );
  }

  /// Closes the HTTP client.
  void dispose() {
    _client.close();
  }
}
