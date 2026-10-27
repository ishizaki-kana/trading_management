import 'package:flutter/material.dart';

/// 画面遷移クラス
class AppNavigator {
  const AppNavigator._(); // インスタンス化禁止

  /// 画面遷移
  ///
  /// - [context] コンテキスト
  /// - [screen] 遷移先の画面
  static Future<void> push(BuildContext context, Widget screen) {
    return Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => screen));
  }

  /// モーダル画面表示
  ///
  /// 処理の結果を呼び出し元の画面に通知するモーダル画面を表示します。
  ///
  /// - [context] コンテキスト
  /// - [modal] モーダル画面
  static Future<T?> pushFullHeightModal<T>(BuildContext context, Widget modal) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      showDragHandle: false,
      backgroundColor: Colors.transparent,
      builder: (_) => modal,
    );
  }
}
