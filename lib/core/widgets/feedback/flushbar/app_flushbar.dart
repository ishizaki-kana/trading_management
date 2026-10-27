import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_duration.dart';
import 'package:trading_management/core/theme/app_radius.dart';
import 'package:trading_management/core/theme/app_spacing.dart';
import 'package:trading_management/core/types/app_feedback.dart';

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
    required AppFeedback type,
    required String message,
  }) {
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
      icon: Icon(type.icon, color: type.textColor(context)),
      backgroundColor: type.containerColor(context),
      messageColor: type.textColor(context),
    ).show(context);
  }
}
