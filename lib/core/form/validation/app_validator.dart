import 'package:trading_management/core/constants/app_message.dart';
import 'package:trading_management/core/form/app_form_field.dart';
import 'package:trading_management/core/form/validation/validation_result.dart';

/// アプリケーション共通のバリデーション
class AppValidator {
  AppValidator._(); // インスタンス化禁止

  /// 必須入力チェック
  ///
  /// - [field] フィールド
  static ValidationResult required<T>(AppFormField<T> field) {
    if (field.hasValue) {
      return ValidationResult.success();
    }

    return ValidationResult.failed(AppMessage.requiredField(field.name));
  }

  /// 最小値チェック
  ///
  /// - String型のとき: 文字列が`min`を超えていないこと
  ///
  /// - [field] フィールド
  static ValidationResult min<T>(AppFormField<T> field) {
    if (!field.hasValue || field.min == null) {
      return ValidationResult.success();
    }

    final min = field.min!;
    var result = true;

    if (field.value case String value) {
      result = value.length >= min;
    }

    if (!result) {
      return ValidationResult.failed(
        AppMessage.minLengthField(field.name, min),
      );
    }

    return ValidationResult.success();
  }

  /// 最大値チェック
  ///
  /// - String型のとき: 文字列が`max`を超えていないこと
  ///
  /// - [field] フィールド
  static ValidationResult max<T>(AppFormField<T> field) {
    if (!field.hasValue || field.max == null) {
      return ValidationResult.success();
    }

    final max = field.max!;
    var result = true;

    if (field.value case String value) {
      result = value.length <= max;
    }

    if (!result) {
      return ValidationResult.failed(
        AppMessage.maxLengthField(field.name, max),
      );
    }

    return ValidationResult.success();
  }

  /// 入力制限チェック
  ///
  /// - [field] フィールド
  static ValidationResult allowedCharacters<T>(AppFormField<T> field) {
    if (!field.hasValue || field.allowedCharacterTypes == null) {
      return ValidationResult.success();
    }

    if (field.value is! String) {
      return ValidationResult.success();
    }

    final value = field.value as String;
    final types = field.allowedCharacterTypes!;

    final pattern = types.map((type) => type.pattern).join('|');
    final isValid = RegExp('^(?:$pattern)*\$').hasMatch(value);

    if (!isValid) {
      final characterTypes = types.map((type) => type.patternName).join(', ');

      return ValidationResult.failed(
        AppMessage.allowedCharactersField(field.name, characterTypes),
      );
    }

    return ValidationResult.success();
  }
}
