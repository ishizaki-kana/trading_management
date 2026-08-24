import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_icon_size.dart';
import 'package:trading_management/core/theme/app_spacing.dart';

/// ボタン
///
/// - [text] 表示するテキスト
/// - [padding] ボタンの余白
/// - [isLoading] ローディング
/// - [onPressed] ボタンがタップされたときのコールバック
class AppButton extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry? padding;
  final bool isLoading;
  final VoidCallback? onPressed;

  const AppButton({
    super.key,
    required this.text,
    this.padding,
    this.isLoading = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final padding =
        this.padding ??
        const EdgeInsets.symmetric(
          horizontal: AppSpacing.s24,
          vertical: AppSpacing.s20,
        );

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(padding: padding),
      child: isLoading
          ? const SizedBox(
              width: AppIconSize.sm,
              height: AppIconSize.sm,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : Text(text),
    );
  }
}
