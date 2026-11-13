import 'package:trading_management/core/types/message_type/app_message_type.dart';

/// アプリ表示メッセージ
///
/// - [type] メッセージ種別
/// - [message] メッセージ
class AppDisplayMessage {
  //
  // fields
  //

  final AppMessageType type;

  final String message;

  //
  // constructor
  //

  const AppDisplayMessage({required this.type, required this.message});
}
