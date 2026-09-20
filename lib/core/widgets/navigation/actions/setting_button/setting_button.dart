import 'package:flutter/material.dart';

/// 設定ボタン
///
/// - [onPressed] タップ時のコールバック
class SettingButton extends StatelessWidget {
  //
  // fields
  //

  /// タップ時のコールバック
  final VoidCallback? onPressed;

  //
  // constructor
  //

  const SettingButton({super.key, this.onPressed});

  //
  // public methods
  //

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: '設定',
      icon: const Icon(Icons.settings_outlined),
      onPressed: onPressed,
    );
  }
}
