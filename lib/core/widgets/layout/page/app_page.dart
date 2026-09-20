import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_spacing.dart';
import 'package:trading_management/core/widgets/feedback/app_message/app_message.dart';
import 'package:trading_management/core/widgets/feedback/loading/loading.dart';

/// アプリページ
///
/// - [appBar] アプリバー
/// - [child] 子要素
/// - [error] エラーメッセージ
/// - [isLoading] ローディング中かどうか
class AppPage extends StatelessWidget {
  //
  // fields
  //

  /// アプリバー
  final PreferredSizeWidget appBar;

  /// 子要素
  final Widget child;

  /// エラーメッセージ
  final String? error;

  /// ローディング中かどうか
  final bool isLoading;

  //
  // constructor
  //

  const AppPage({
    super.key,
    required this.appBar,
    required this.child,
    this.error,
    this.isLoading = false,
  });

  //
  // public methods
  //

  @override
  Widget build(BuildContext context) {
    Widget body;

    if (isLoading) {
      // ロード時
      body = const Loading();
    } else if (error != null) {
      // エラー時
      body = AppMessage(message: error!);
    } else {
      // 正常時
      body = SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.pageHorizontal(context),
          vertical: AppSpacing.pageVertical(context),
        ),
        child: child,
      );
    }

    return Scaffold(appBar: appBar, body: body);
  }
}
