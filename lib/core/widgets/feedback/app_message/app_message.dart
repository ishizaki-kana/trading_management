import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_icon_size.dart';
import 'package:trading_management/core/theme/app_spacing.dart';

/// メッセージ画面
///
/// メッセージとアイコンを画面中央に表示します。
///
/// - [message] メッセージ
/// - [icon] アイコン
class AppMessage extends StatelessWidget {
  //
  // fields
  //

  /// メッセージ
  final String message;

  /// アイコン
  final IconData? icon;

  //
  // constructor
  //

  const AppMessage({super.key, required this.message, this.icon});

  //
  // public methods
  //

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: AppSpacing.s12,
        children: [
          if (icon != null)
            Icon(
              icon,
              size: AppIconSize.xxl,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          Text(
            message,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
