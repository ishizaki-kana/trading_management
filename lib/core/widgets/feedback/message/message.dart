import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_icon_size.dart';
import 'package:trading_management/core/theme/app_spacing.dart';
import 'package:trading_management/core/types/app_feedback.dart';

/// メッセージ画面
///
/// メッセージとアイコンを画面中央に表示します。
///
/// - [type] フィードバックタイプ
/// - [message] メッセージ
class Message extends StatelessWidget {
  //
  // fields
  //

  /// フィードバックタイプ
  final AppFeedback type;

  /// メッセージ
  final String message;

  //
  // constructor
  //

  const Message({super.key, required this.type, required this.message});

  //
  // public methods
  //

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: AppSpacing.s8,
        children: [
          Icon(
            type.icon,
            size: AppIconSize.lg,
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
