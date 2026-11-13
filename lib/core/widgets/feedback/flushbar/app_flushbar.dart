import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trading_management/core/theme/app_duration.dart';
import 'package:trading_management/core/theme/app_radius.dart';
import 'package:trading_management/core/theme/app_spacing.dart';
import 'package:trading_management/core/types/message_type/app_feedback_type.dart';

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
    required AppFeedbackType type,
    required String message,
  }) {
    final overlayContext = Navigator.of(context, rootNavigator: true).context;

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
      icon: FaIcon(type.icon, color: type.textColor(context)),
      backgroundColor: type.containerColor(context),
      messageColor: type.textColor(context),
    ).show(overlayContext);
  }
}
