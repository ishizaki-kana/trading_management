import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_duration.dart';
import 'package:trading_management/core/theme/app_feedback_color.dart';
import 'package:trading_management/core/theme/app_radius.dart';
import 'package:trading_management/core/theme/app_spacing.dart';
import 'package:trading_management/core/types/feedback_type.dart';

/// フラッシュバー
///
/// エラーや通知メッセージを画面上部に表示します。
class AppFlushbar {
  AppFlushbar._();

  //
  // public methods
  //

  /// フラッシュバー
  ///
  /// - [context]
  /// - [type] 状態種別
  /// - [message] メッセージ
  static Future<void> show(
    BuildContext context, {
    required FeedbackType type,
    required String message,
  }) {
    final theme = Theme.of(context);
    final feedbackColors = theme.extension<AppFeedbackColor>()!;

    final (icon, iconColor, backgroundColor, messageColor) = switch (type) {
      FeedbackType.success => (
        Icons.check_circle_outline,
        feedbackColors.success,
        feedbackColors.successContainer,
        feedbackColors.onSuccessContainer,
      ),
      FeedbackType.info => (
        Icons.info_outline,
        feedbackColors.info,
        feedbackColors.infoContainer,
        feedbackColors.onInfoContainer,
      ),
      FeedbackType.warning => (
        Icons.warning_amber_outlined,
        feedbackColors.warning,
        feedbackColors.warningContainer,
        feedbackColors.onWarningContainer,
      ),
      FeedbackType.error => (
        Icons.error_outline,
        theme.colorScheme.error,
        theme.colorScheme.errorContainer,
        theme.colorScheme.onErrorContainer,
      ),
    };

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
      icon: Icon(icon, color: iconColor),
      backgroundColor: backgroundColor,
      messageColor: messageColor,
    ).show(context);
  }
}
