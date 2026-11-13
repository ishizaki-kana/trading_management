import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/core/types/message_type/app_feedback_type.dart';
import 'package:trading_management/core/widgets/feedback/flushbar/app_flushbar.dart';

const _group = 'feedback/flushbar';

@AppPreview(group: _group, name: 'Success')
Widget appFlushbarSuccessPreview() {
  return _buildPreview(label: 'Show success', type: AppFeedbackType.success);
}

@AppPreview(group: _group, name: 'Info')
Widget appFlushbarInfoPreview() {
  return _buildPreview(label: 'Show info', type: AppFeedbackType.info);
}

@AppPreview(group: _group, name: 'Warning')
Widget appFlushbarWarningPreview() {
  return _buildPreview(label: 'Show warning', type: AppFeedbackType.warning);
}

@AppPreview(group: _group, name: 'Error')
Widget appFlushbarErrorPreview() {
  return _buildPreview(label: 'Show error', type: AppFeedbackType.error);
}

Widget _buildPreview({required String label, required AppFeedbackType type}) {
  return Scaffold(
    body: Center(
      child: Builder(
        builder: (context) {
          return TextButton(
            onPressed: () {
              AppFlushbar.show(context, type: type, message: 'フィードバックメッセージ');
            },
            child: Text(label),
          );
        },
      ),
    ),
  );
}
