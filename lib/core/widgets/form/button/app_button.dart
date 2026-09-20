import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_icon_size.dart';
import 'package:trading_management/core/theme/app_spacing.dart';

/// ボタン
///
/// - [text] テキスト
/// - [padding] ボタンの余白
/// - [isLoading] ローディング
/// - [isFullWidth] 横幅拡張
/// - [onPressed] ボタンタップ時のコールバック
class AppButton extends StatelessWidget {
  //
  // fields
  //

  /// テキスト
  final String text;

  /// パディング
  final EdgeInsetsGeometry? padding;

  /// ローディング中か
  final bool isLoading;

  /// 横幅拡張
  final bool isFullWidth;

  /// ボタンタップ時のコールバック
  final VoidCallback? onPressed;

  //
  // constructor
  //

  const AppButton({
    super.key,
    required this.text,
    this.padding,
    this.isLoading = false,
    this.isFullWidth = false,
    this.onPressed,
  });

  //
  // public methods
  //

  @override
  Widget build(BuildContext context) {
    final padding =
        this.padding ??
        const EdgeInsets.symmetric(
          horizontal: AppSpacing.s24,
          vertical: AppSpacing.s20,
        );

    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(padding: padding),
        child: isLoading
            ? const SizedBox(
                width: AppIconSize.sm,
                height: AppIconSize.sm,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : Text(text),
      ),
    );
  }
}
