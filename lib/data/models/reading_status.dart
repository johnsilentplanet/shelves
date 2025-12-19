/// Reading status for books in the library.
enum ReadingStatus {
  /// Book is on the "to read" list.
  toRead('to-read'),

  /// Book is currently being read.
  currentlyReading('currently-reading'),

  /// Book has been read.
  read('read');

  const ReadingStatus(this.value);

  /// The string value stored in the database.
  final String value;

  /// Creates a [ReadingStatus] from a string value.
  static ReadingStatus? fromString(String? value) {
    if (value == null) return null;
    return ReadingStatus.values.cast<ReadingStatus?>().firstWhere(
          (status) => status?.value == value,
          orElse: () => null,
        );
  }
}
