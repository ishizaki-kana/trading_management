import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trading_management/core/theme/app_icon_size.dart';
import 'package:trading_management/core/theme/app_spacing.dart';
import 'package:trading_management/core/types/app_display_message.dart';
import 'package:trading_management/core/widgets/form/button/app_button.dart';

/// メッセージ画面
///
/// メッセージとアイコンを画面中央に表示します。
///
/// - [message] 表示メッセージ
/// - [onRetry] 再読み込み時の処理
class Message extends StatelessWidget {
  //
  // fields
  //

  /// 表示メッセージ
  final AppDisplayMessage message;

  /// 再読み込み時の処理
  final VoidCallback? onRetry;

  //
  // constructor
  //

  const Message(this.message, {super.key, this.onRetry});

  //
  // public methods
  //

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: AppSpacing.s24,
          children: [
            FaIcon(
              message.type.icon,
              size: AppIconSize.xxl,
              color: message.type.textColor(context),
            ),
            Flexible(
              child: Text(
                message.message,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ),
            if (onRetry != null)
              AppButton(
                text: '再読み込みする',
                padding: const EdgeInsets.symmetric(
                  vertical: AppSpacing.s12,
                  horizontal: AppSpacing.s24,
                ),
                backgroundColor: message.type.containerColor(context),
                onPressed: onRetry,
              ),
          ],
        ),
      ),
    );
  }
}
