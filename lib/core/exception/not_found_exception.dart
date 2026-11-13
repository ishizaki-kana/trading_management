import 'package:trading_management/core/presentation/error/app_message.dart';

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

  /// 画面メッセージ
  ///
  /// 対象のデータが見つかりません。
  String get userMessage => AppMessage.dataNotFound;

  /// ログメッセージ
  ///
  /// [NotFoundException] 対象のデータが見つかりません。(target = {target})
  String get logMessage =>
      '[NotFoundException] $userMessage (target = $target)';

  //
  // public methods
  //

  @override
  String toString() {
    return logMessage;
  }
}
