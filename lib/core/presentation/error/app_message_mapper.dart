import 'package:trading_management/core/exception/database_exception.dart';
import 'package:trading_management/core/exception/not_found_exception.dart';
import 'package:trading_management/core/exception/validation_exception.dart';
import 'package:trading_management/core/presentation/error/app_message.dart';
import 'package:trading_management/core/types/app_display_message.dart';
import 'package:trading_management/core/types/message_type/app_feedback_type.dart';
import 'package:trading_management/core/types/message_type/app_status_type.dart';

class AppMessageMapper {
  const AppMessageMapper._(); // インスタンス化禁止

  //
  // public methods
  //

  /// 画面メッセージ変換
  ///
  /// - [error] 例外
  static AppDisplayMessage fromError(Object error) {
    return switch (error) {
      // データなし例外
      NotFoundException(:final userMessage) => AppDisplayMessage(
        type: AppStatusType.notfound,
        message: userMessage,
      ),
      // バリデーション例外
      ValidationException(:final message) => AppDisplayMessage(
        type: AppFeedbackType.warning,
        message: message,
      ),
      // DB例外
      DatabaseException(:final userMessage) => AppDisplayMessage(
        type: AppFeedbackType.error,
        message: userMessage,
      ),
      // その他の例外
      _ => const AppDisplayMessage(
        type: AppFeedbackType.error,
        message: AppMessage.unknownError,
      ),
    };
  }
}
