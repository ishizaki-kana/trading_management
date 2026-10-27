import 'package:trading_management/core/constants/app_message.dart';
import 'package:trading_management/core/exception/validation_exception.dart';
import 'package:trading_management/core/form/validation/app_validator.dart';
import 'package:trading_management/features/partner/application/forms/partner_form.dart';

/// 取引相手バリデーション
class PartnerValidator {
  PartnerValidator._(); // インスタンス化禁止

  /// バリデーション
  ///
  /// - 入力チェック: すべての値が入力されていること
  ///
  /// 例外:
  /// - [ValidationException] バリデーションエラーが発生したとき
  static void validate(PartnerForm form) {
    // 入力チェック
    final hasUserId = AppValidator.required(form.userId);
    final hasUsername = AppValidator.required(form.username);

    if (hasUserId.isSuccess != hasUsername.isSuccess) {
      throw ValidationException(
        message: AppMessage.requiredField('取引相手のユーザーIDまたはユーザー名'),
      );
    }
  }
}
