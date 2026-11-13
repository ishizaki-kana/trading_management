/// メッセージ定義クラス
///
/// アプリ内で使用するメッセージを定義します。
class AppMessage {
  AppMessage._(); // インスタンス化禁止

  //
  // 画面操作エラー
  //

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

  /// 予期せぬエラーが発生しました。
  static const String unknownError = '予期せぬエラーが発生しました。';

  //
  // DBエラー
  //

  /// 対象のデータが見つかりません。
  static const dataNotFound = '対象のデータが見つかりません。';

  /// データの読み込みに失敗しました。時間をおいて再度お試しください。
  static const dataLoadFailed = 'データの読み込みに失敗しました。時間をおいて再度お試しください。';

  /// データの登録に失敗しました。もう一度お試しください。
  static const dataInsertFailed = 'データの登録に失敗しました。もう一度お試しください。';

  /// データの更新に失敗しました。もう一度お試しください。
  static const dataUpdateFailed = 'データの更新に失敗しました。もう一度お試しください。';

  /// データの削除に失敗しました。もう一度お試しください。
  static const dataDeleteFailed = 'データの削除に失敗しました。もう一度お試しください。';
}
