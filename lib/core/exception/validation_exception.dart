/// バリデーション例外
class ValidationException<T> implements Exception {
  //
  // fields
  //

  /// メッセージ
  final String? message;

  //
  // constructor
  //

  const ValidationException({required this.message});
}
