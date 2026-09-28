import 'package:flutter/material.dart';

/// 画面遷移クラス
class AppNavigator {
  const AppNavigator._(); // インスタンス化禁止

  /// 画面遷移
  static Future<void> push(BuildContext context, Widget screen) {
    return Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => screen));
  }
}
