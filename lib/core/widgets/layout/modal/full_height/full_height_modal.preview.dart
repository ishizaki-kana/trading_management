import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/core/widgets/form/button/app_button_config.dart';
import 'package:trading_management/core/widgets/layout/modal/full_height/full_height_modal.dart';

const _group = 'layout/modal/full_height';

@AppPreview(group: _group, name: 'With title', size: Size(360, 640))
Widget fullHeightModalWithTitlePreview() {
  return _buildPreview(title: '取引内容を編集', child: const Text('モーダルのコンテンツ'));
}

@AppPreview(group: _group, name: 'Without title', size: Size(360, 640))
Widget fullHeightModalWithoutTitlePreview() {
  return _buildPreview(child: const Text('モーダルのコンテンツ'));
}

@AppPreview(group: _group, name: 'With action', size: Size(360, 640))
Widget fullHeightModalWithActionPreview() {
  return _buildPreview(
    title: '取引内容を編集',
    child: const Text('モーダルのコンテンツ'),
    positiveBtnConfig: const AppButtonConfig(text: '保存', onPressed: _onPressed),
  );
}

void _onPressed() {}

Widget _buildPreview({
  String? title,
  required Widget child,
  AppButtonConfig? positiveBtnConfig,
}) {
  return Navigator(
    onGenerateRoute: (_) {
      return MaterialPageRoute<void>(
        builder: (context) {
          return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.surface,
            body: Align(
              alignment: Alignment.bottomCenter,
              child: FullHeightModal(
                title: title,
                positiveBtnConfig: positiveBtnConfig,
                child: child,
              ),
            ),
          );
        },
      );
    },
  );
}
