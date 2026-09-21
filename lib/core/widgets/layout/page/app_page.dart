import 'package:flutter/material.dart';
import 'package:trading_management/core/widgets/feedback/loading/loading.dart';
import 'package:trading_management/core/widgets/feedback/message/message.dart';

/// アプリページ
///
/// - [appBar] アプリバー
/// - [body] ボディ
/// - [message] メッセージ
/// - [messageIcon] メッセージ画面のアイコン
/// - [isLoading] ローディング中かどうか
class AppPage extends StatelessWidget {
  //
  // fields
  //

  /// アプリバー
  final PreferredSizeWidget appBar;

  /// ボディ
  final Widget body;

  /// メッセージ
  final String? message;

  /// メッセージ画面のアイコン
  final IconData? messageIcon;

  /// ローディング中かどうか
  final bool isLoading;

  //
  // constructor
  //

  const AppPage({
    super.key,
    required this.appBar,
    required this.body,
    this.message,
    this.messageIcon,
    this.isLoading = false,
  });

  //
  // public methods
  //

  @override
  Widget build(BuildContext context) {
    final displayBody = switch ((isLoading, message)) {
      // ローディング中
      (true, _) => const Loading(),
      // メッセージ
      (false, final message?) => Message(message: message, icon: messageIcon),
      // 正常
      (false, null) => body,
    };

    return Scaffold(appBar: appBar, body: displayBody);
  }
}
