import 'dart:convert';

import 'package:http/http.dart' as http;

/// Response from the OpenLibrary API.
class OpenLibraryResult {
  const OpenLibraryResult({
    required this.isbn,
    this.title,
    this.subtitle,
    this.authors,
    this.publishers,
    this.publishDate,
    this.numberOfPages,
    this.subjects,
    this.coverUrl,
  });

  final String isbn;
  final String? title;
  final String? subtitle;
  final List<String>? authors;
  final List<String>? publishers;
  final String? publishDate;
  final int? numberOfPages;
  final List<String>? subjects;
  final String? coverUrl;

  /// Returns true if we got meaningful data.
  bool get hasData => title != null && title!.isNotEmpty;

  /// Returns the first publisher or null.
  String? get publisher => publishers?.isNotEmpty == true ? publishers!.first : null;
}

/// Service for OpenLibrary API operations (fallback for Google Books).
class OpenLibraryApi {
  OpenLibraryApi({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;
  static const String _baseUrl = 'https://openlibrary.org/api/books';
  static const String _coverBaseUrl = 'https://covers.openlibrary.org/b/isbn';

  /// Looks up a book by ISBN.
  Future<OpenLibraryResult?> lookupByIsbn(String isbn) async {
    final cleanIsbn = isbn.replaceAll(RegExp(r'[^0-9X]'), '');
    if (cleanIsbn.isEmpty) return null;

    try {
      final uri = Uri.parse(
        '$_baseUrl?bibkeys=ISBN:$cleanIsbn&format=json&jscmd=data',
      );
      final response = await _client.get(uri);

      if (response.statusCode != 200) {
        return null;
      }

      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final bookKey = 'ISBN:$cleanIsbn';

      if (!json.containsKey(bookKey)) {
        return null;
      }

      final bookData = json[bookKey] as Map<String, dynamic>;
      return _parseBookData(bookData, cleanIsbn);
    } catch (e) {
      return null;
    }
  }

  OpenLibraryResult _parseBookData(Map<String, dynamic> data, String isbn) {
    // Get authors
    List<String>? authors;
    final authorsData = data['authors'] as List<dynamic>?;
    if (authorsData != null && authorsData.isNotEmpty) {
      authors = authorsData
          .map((a) => (a as Map<String, dynamic>)['name'] as String?)
          .where((name) => name != null)
          .cast<String>()
          .toList();
    }

    // Get publishers
    List<String>? publishers;
    final publishersData = data['publishers'] as List<dynamic>?;
    if (publishersData != null && publishersData.isNotEmpty) {
      publishers = publishersData
          .map((p) => (p as Map<String, dynamic>)['name'] as String?)
          .where((name) => name != null)
          .cast<String>()
          .toList();
    }

    // Get subjects/categories
    List<String>? subjects;
    final subjectsData = data['subjects'] as List<dynamic>?;
    if (subjectsData != null && subjectsData.isNotEmpty) {
      subjects = subjectsData
          .map((s) => (s as Map<String, dynamic>)['name'] as String?)
          .where((name) => name != null)
          .cast<String>()
          .toList();
    }

    // Get cover URL
    String? coverUrl;
    final cover = data['cover'] as Map<String, dynamic>?;
    if (cover != null) {
      coverUrl = cover['large'] as String? ??
          cover['medium'] as String? ??
          cover['small'] as String?;
    }
    // Fallback to standard cover URL if not in response
    coverUrl ??= '$_coverBaseUrl/$isbn-L.jpg';

    return OpenLibraryResult(
      isbn: isbn,
      title: data['title'] as String?,
      subtitle: data['subtitle'] as String?,
      authors: authors,
      publishers: publishers,
      publishDate: data['publish_date'] as String?,
      numberOfPages: data['number_of_pages'] as int?,
      subjects: subjects,
      coverUrl: coverUrl,
    );
  }

  /// Checks if a cover image exists for an ISBN.
  Future<bool> coverExists(String isbn) async {
    final cleanIsbn = isbn.replaceAll(RegExp(r'[^0-9X]'), '');
    if (cleanIsbn.isEmpty) return false;

    try {
      final uri = Uri.parse('$_coverBaseUrl/$cleanIsbn-S.jpg');
      final response = await _client.head(uri);
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  /// Gets the cover URL for an ISBN.
  String getCoverUrl(String isbn, {CoverSize size = CoverSize.large}) {
    final cleanIsbn = isbn.replaceAll(RegExp(r'[^0-9X]'), '');
    final sizeCode = switch (size) {
      CoverSize.small => 'S',
      CoverSize.medium => 'M',
      CoverSize.large => 'L',
    };
    return '$_coverBaseUrl/$cleanIsbn-$sizeCode.jpg';
  }

  /// Closes the HTTP client.
  void dispose() {
    _client.close();
  }
}

/// Cover image sizes for OpenLibrary.
enum CoverSize {
  small,
  medium,
  large,
}
