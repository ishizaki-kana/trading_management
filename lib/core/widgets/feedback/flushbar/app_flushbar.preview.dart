import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/core/widgets/feedback/flushbar/app_flushbar.dart';

const _group = 'feedback/flushbar/app_flushbar';

@AppPreview(group: _group, name: 'Error')
Widget appFlushbarPreview() {
  return Scaffold(
    body: Center(
      child: Builder(
        builder: (context) {
          return ElevatedButton(
            onPressed: () {
              AppFlushbar.error(context, 'エラーが発生しました');
            },
            child: const Text('Show error'),
          );
        },
      ),
    ),
  );
}
