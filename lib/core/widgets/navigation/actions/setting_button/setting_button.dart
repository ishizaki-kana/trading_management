import 'package:flutter/material.dart';

/// 設定ボタン
class SettingButton extends StatelessWidget {
  const SettingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.settings_outlined),
      onPressed: null,
    );
  }
}
