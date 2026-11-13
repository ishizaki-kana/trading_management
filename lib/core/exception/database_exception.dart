/// DB例外
class DatabaseException implements Exception {
  //
  // fields
  //

  /// エラー
  final Exception cause;

  /// メッセージ
  final String message;

  //
  // constructor
  //

  const DatabaseException(this.cause, this.message);

  //
  // getter
  //

  /// 画面メッセージ
  String get userMessage => message;

  /// ログメッセージ
  ///
  /// [DatabaseException] {エラーメッセージ}
  String get logMessage => '[DatabaseException] $message';

  //
  // public methods
  //

  @override
  String toString() {
    return logMessage;
  }
}
