/// DB実行時例外
class DatabaseException implements Exception {
  //
  // fields
  //

  /// エラー
  final Object cause;

  //
  // constructor
  //

  const DatabaseException(this.cause);
}
