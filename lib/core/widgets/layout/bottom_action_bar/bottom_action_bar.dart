import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_spacing.dart';
import 'package:trading_management/core/widgets/form/button/app_button.dart';

/// 底部アクションバー
///
/// - [buttonText] ボタンテキスト
/// - [onPressed] タップ時のコールバック
class BottomActionBar extends StatelessWidget {
  //
  // fields
  //

  /// ボタンテキスト
  final String buttonText;

  /// タップ時のコールバック
  final VoidCallback? onPressed;

  //
  // constructor
  //

  const BottomActionBar({super.key, required this.buttonText, this.onPressed});

  //
  // public methods
  //

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.s16,
          vertical: AppSpacing.s8,
        ),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.shadow.withValues(alpha: 0.12),
              blurRadius: 4,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SizedBox(
          width: double.infinity,
          child: AppButton(
            onPressed: onPressed,
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.s16),
            text: buttonText,
          ),
        ),
      ),
    );
  }
}
