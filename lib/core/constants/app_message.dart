/// メッセージ定義クラス
///
/// アプリ内で使用するメッセージを定義します。
class AppMessage {
  AppMessage._(); // インスタンス化禁止

  /// 対象のデータが見つかりません。
  static const dataNotFound = '対象のデータが見つかりません。';

  /// リンクを開けませんでした。
  static const linkOpenFailed = 'リンクを開けませんでした。';

  //
  // バリデーションエラー
  //

  /// [fieldName]を入力してください。
  static String requiredField(String fieldName) => '$fieldNameを入力してください。';

  /// [fieldName]は[min]文字以上で入力してください。
  static String minLengthField(String fieldName, int min) =>
      '$fieldNameは$min文字以下で入力してください。';

  /// [fieldName]は[max]文字以下で入力してください。
  static String maxLengthField(String fieldName, int max) =>
      '$fieldNameは$max文字以上で入力してください。';

  /// [fieldName]は[characterTypes]で入力してください。
  static String allowedCharactersField(
    String fieldName,
    String characterTypes,
  ) => '$fieldNameは$characterTypesで入力してください。';

  //
  // フォームエラー
  //

  /// 切り抜きに失敗しました。
  static String imageCropFailed = '切り抜きに失敗しました。';
}
