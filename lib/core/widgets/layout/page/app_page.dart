import 'package:flutter/material.dart';
import 'package:trading_management/core/presentation/error/app_message_mapper.dart';
import 'package:trading_management/core/types/app_display_message.dart';
import 'package:trading_management/core/widgets/feedback/loading/loading.dart';
import 'package:trading_management/core/widgets/feedback/message/message.dart';

/// アプリページ
///
/// - [appBar] アプリバー
/// - [body] ボディ
/// - [bottomNavigationBar] 下部バー
/// - [message] メッセージ
/// - [backgroundColor] 背景色
/// - [isLoading] ローディング中かどうか
/// - [onRetry] 再読み込み時の処理
class AppPage extends StatelessWidget {
  //
  // fields
  //

  /// アプリバー
  final PreferredSizeWidget appBar;

  /// ボディ
  final Widget body;

  /// 下部バー
  final Widget? bottomNavigationBar;

  /// メッセージ
  final AppDisplayMessage? message;

  /// 背景色
  final Color? backgroundColor;

  /// 再読み込み時の処理
  final VoidCallback? onRetry;

  /// ローディング中かどうか
  final bool isLoading;

  //
  // constructor
  //

  const AppPage({
    super.key,
    required this.appBar,
    required this.body,
    this.bottomNavigationBar,
    this.message,
    this.backgroundColor,
    this.isLoading = false,
    this.onRetry,
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
      (false, final message?) => Message(message, onRetry: onRetry),
      // 正常
      (false, null) => body,
    };

    return Scaffold(
      appBar: appBar,
      body: displayBody,
      backgroundColor: backgroundColor,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}

abstract class AppPageState<T extends StatefulWidget> extends State<T> {
  //
  // fields
  //

  /// メッセージ
  AppDisplayMessage? message;

  /// ローディング中かどうか
  bool isLoading = false;

  /// 読み込み処理を開始済みかどうか
  bool _isLoadStarted = false;

  /// 最新のリクエストID
  int _currentRequestId = 0;

  //
  // public methods
  //

  /// 初回読み込み開始
  ///
  /// 読み込み処理が実行されていないときのみ処理を実行します。
  /// すでに読み込み処理が実行されている時はなにもしません。
  ///
  /// - [action] 実行する処理
  Future<void> tryStartLoading({
    required Future<void> Function() action,
  }) async {
    // 実行済みなら何もしない
    if (_isLoadStarted) return;

    _isLoadStarted = true;
    await action();
  }

  /// ページ処理実行
  ///
  /// ローディング状態・画面メッセージの管理と処理の実行を行います。
  ///
  /// - [action] 実行する処理
  /// - [onSuccess] 成功時の処理
  Future<void> runPageAction<R>({
    required Future<R> Function() action,
    required void Function(R result) onSuccess,
  }) async {
    // リクエストID更新
    final requestId = ++_currentRequestId;

    // ローディング状態・画面メッセージ初期化
    setState(() {
      isLoading = true;
      message = null;
    });

    try {
      // 処理実行
      final result = await action();

      if (!mounted || requestId != _currentRequestId) return;

      setState(() {
        onSuccess(result);
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        message = AppMessageMapper.fromError(e);
      });
    } finally {
      if (mounted || requestId != _currentRequestId) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }
}
