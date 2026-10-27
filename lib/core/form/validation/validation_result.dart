/// バリデーション結果クラス
class ValidationResult {
  //
  // fields
  //

  /// 結果
  final bool result;

  /// エラー
  final String? error;

  //
  // constructor
  //

  /// 成功時のコンストラクタ
  ValidationResult.success() : this._(result: true);

  /// 失敗時のコンストラクタ
  ///
  /// - [error] エラーメッセージ
  const ValidationResult.failed(String error)
    : this._(result: false, error: error);

  const ValidationResult._({required this.result, this.error});

  //
  // getter
  //

  /// 成功かどうか
  bool get isSuccess => result == true;

  /// 失敗かどうか
  bool get isFailed => result == false;
}
