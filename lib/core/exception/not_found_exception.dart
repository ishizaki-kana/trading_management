import 'package:trading_management/core/constants/app_message.dart';

/// データなし例外
class NotFoundException implements Exception {
  //
  // fields
  //

  /// 例外対象
  final Object target;

  //
  // constructor
  //

  const NotFoundException(this.target);

  //
  // getter
  //

  /// メッセージ取得
  ///
  /// 表示するデータがありません。
  String get message => AppMessage.dataNotFound;

  //
  // public methods
  //

  @override
  String toString() {
    return 'NotFoundException: $message (target: $target)';
  }
}
