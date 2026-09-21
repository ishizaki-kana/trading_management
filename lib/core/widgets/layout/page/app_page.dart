import 'package:flutter/material.dart';
import 'package:trading_management/core/widgets/feedback/loading/loading.dart';
import 'package:trading_management/core/widgets/feedback/message/message.dart';

/// アプリページ
///
/// - [appBar] アプリバー
/// - [child] 子要素
/// - [message] メッセージ
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
    this.isLoading = false,
  });

  //
  // public methods
  //

  @override
  Widget build(BuildContext context) {
    final displayBody = switch ((isLoading, message)) {
      (true, _) => const Loading(),
      (false, final message?) => Message(message: message),
      (false, null) => body,
    };

    return Scaffold(appBar: appBar, body: displayBody);
  }
}
