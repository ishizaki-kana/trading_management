import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/core/types/app_display_message.dart';
import 'package:trading_management/core/types/message_type/app_feedback_type.dart';
import 'package:trading_management/core/widgets/feedback/message/message.dart';

const _group = 'feedback/message';

@AppPreview(group: _group, name: 'Success', size: Size(360, 190))
Widget messageSuccessPreview() {
  return const Scaffold(
    body: Message(
      AppDisplayMessage(type: AppFeedbackType.success, message: '処理が完了しました。'),
    ),
  );
}

@AppPreview(group: _group, name: 'Info', size: Size(360, 190))
Widget messageInfoPreview() {
  return const Scaffold(
    body: Message(
      AppDisplayMessage(type: AppFeedbackType.info, message: '該当する取引がありません。'),
    ),
  );
}

@AppPreview(group: _group, name: 'Warning', size: Size(360, 190))
Widget messageWarningPreview() {
  return const Scaffold(
    body: Message(
      AppDisplayMessage(
        type: AppFeedbackType.warning,
        message: '入力内容を確認してください。',
      ),
    ),
  );
}

@AppPreview(group: _group, name: 'Error', size: Size(360, 190))
Widget messageErrorPreview() {
  return const Scaffold(
    body: Message(
      AppDisplayMessage(
        type: AppFeedbackType.error,
        message: 'データの読み込みに失敗しました。',
      ),
    ),
  );
}
