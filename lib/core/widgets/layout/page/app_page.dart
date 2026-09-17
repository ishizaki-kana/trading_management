import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_spacing.dart';

/// アプリページ
///
/// - [appBar] アプリバー
/// - [child] 子要素
/// - [isLoading] ローディング中かどうか
/// - [error] エラーメッセージ
class AppPage extends StatelessWidget {
  final PreferredSizeWidget appBar;
  final Widget child;
  final bool isLoading;
  final String? error;

  const AppPage({
    super.key,
    required this.appBar,
    required this.child,
    this.isLoading = false,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    Widget body;

    if (isLoading) {
      // ロード時
      body = const Center(child: CircularProgressIndicator());
    } else if (error != null) {
      // エラー時
      body = Center(child: Text(error!));
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
