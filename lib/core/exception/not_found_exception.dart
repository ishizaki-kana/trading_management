import 'package:trading_management/core/constants/app_message.dart';

/// データなし例外
class NotFoundException implements Exception {
  //
  // fields
  //

  /// 例外対象名
  final String targetName;

  /// 例外対象
  final Object target;

  //
  // constructor
  //

  const NotFoundException(this.targetName, this.target);

  //
  // getter
  //

  /// メッセージ取得
  ///
  /// 対象のデータが見つかりません。
  String get message => AppMessage.dataNotFound;

  //
  // public methods
  //

  @override
  String toString() {
    return '$message ($targetName: $target)';
  }
}
