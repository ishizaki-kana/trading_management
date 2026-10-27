import 'package:trading_management/core/form/app_form_field.dart';
import 'package:trading_management/core/form/validation/app_validator.dart';
import 'package:trading_management/core/widgets/form/field/text/character_type.dart';

/// 取引相手フォーム
class PartnerForm {
  //
  // fields
  //

  /// ユーザーID
  final AppFormField<String> userId;

  /// ユーザー名
  final AppFormField<String> username;

  //
  // constructor
  //

  PartnerForm({String? userId, String? username})
    : userId = AppFormField(
        id: 'userId',
        name: 'ユーザーID',
        value: userId ?? '',
        min: 5,
        max: 15,
        allowedCharacterTypes: [
          CharacterType.alphanumeric,
          CharacterType.underscore,
        ],
      ),
      username = AppFormField(
        id: 'username',
        name: 'ユーザー名',
        value: username ?? '',
        min: 1,
        max: 50,
      );

  PartnerForm._({required this.userId, required this.username});

  //
  // getter
  //

  /// すべての値が入力されているかどうか
  bool get hasAllValues => userId.hasValue && username.hasValue;

  //
  // public methods
  //

  /// バリデーション
  ///
  /// バリデーションを行い、結果とエラー情報を設定したフォームを返します。
  ///
  /// - 入力チェック: ユーザーIDとユーザー名の両方が入力されていること
  ///
  ({bool isValid, PartnerForm form}) validate() {
    // エラー初期化
    var result = true;
    var userId = this.userId.copyWith(error: null);
    var username = this.username.copyWith(error: null);

    // 入力チェック
    final hasUserId = AppValidator.required(userId);
    final hasUsername = AppValidator.required(username);

    if (hasUserId.isFailed || hasUsername.isFailed) {
      result = false;

      if (hasUserId.isFailed) {
        userId = userId.copyWith(error: hasUserId.error);
      }

      if (hasUsername.isFailed) {
        username = username.copyWith(error: hasUsername.error);
      }
    }

    return (
      isValid: result,
      form: PartnerForm._(userId: userId, username: username),
    );
  }

  /// コピー作成
  ///
  /// - [userId] ユーザーID
  /// - [username] ユーザー名
  PartnerForm copyWith({String? userId, String? username}) {
    return PartnerForm._(
      userId: this.userId.copyWith(value: userId ?? this.userId.value),
      username: this.username.copyWith(value: username ?? this.username.value),
    );
  }
}
