import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_duration.dart';
import 'package:trading_management/core/theme/app_radius.dart';
import 'package:trading_management/core/theme/app_spacing.dart';

/// フラッシュバー
///
/// エラーや通知メッセージを画面上部に表示します。
class AppFlushbar {
  AppFlushbar._();

  /// エラーフラッシュバー
  ///
  /// - [context] コンテキスト
  /// - [message] メッセージ
  static Future<void> error(BuildContext context, String message) {
    final theme = Theme.of(context);

    return Flushbar(
      message: message,
      flushbarStyle: FlushbarStyle.FLOATING,
      flushbarPosition: FlushbarPosition.TOP,
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.s8,
        vertical: AppSpacing.s12,
      ),
      borderRadius: AppRadius.md,
      duration: AppDuration.notification,
      icon: Icon(Icons.error_outline, color: theme.colorScheme.error),
      backgroundColor: theme.colorScheme.errorContainer,
      messageColor: theme.colorScheme.onErrorContainer,
    ).show(context);
  }
}
