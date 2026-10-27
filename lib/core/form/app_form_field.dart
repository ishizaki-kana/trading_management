import 'package:trading_management/core/form/unset.dart';
import 'package:trading_management/core/widgets/form/field/text/character_type.dart';

/// フォームフィールド
class AppFormField<T> {
  //
  // fields
  //

  /// ID
  final String id;

  /// ラベル
  final String name;

  /// 値
  final T value;

  /// エラーメッセージ
  final String? error;

  /// 入力必須かどうか
  final bool isRequired;

  /// 最小値
  final int? min;

  /// 最大値
  final int? max;

  /// 入力を許可する文字タイプリスト
  final List<CharacterType>? allowedCharacterTypes;

  //
  // constructor
  //

  const AppFormField({
    required this.id,
    required this.name,
    required this.value,
    this.error,
    this.isRequired = false,
    this.min,
    this.max,
    this.allowedCharacterTypes,
  });

  const AppFormField._({
    required this.id,
    required this.name,
    required this.value,
    required this.error,
    required this.isRequired,
    required this.min,
    required this.max,
    required this.allowedCharacterTypes,
  });

  //
  // getter
  //

  /// 値が入力されているかどうか
  bool get hasValue {
    final fieldValue = value;
    return (fieldValue is! String || fieldValue.trim().isNotEmpty);
  }

  //
  // public methods
  //

  /// コピー作成
  ///
  /// - [value] 値
  /// - [error] エラーメッセージ
  AppFormField<T> copyWith({Object? value = unset, Object? error = unset}) {
    return AppFormField._(
      id: id,
      name: name,
      value: identical(value, unset) ? this.value : value as T,
      error: identical(error, unset) ? this.error : error as String?,
      isRequired: isRequired,
      min: min,
      max: max,
      allowedCharacterTypes: allowedCharacterTypes,
    );
  }
}
