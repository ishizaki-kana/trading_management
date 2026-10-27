import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_feedback_color.dart';

/// フィードバック種別
enum AppFeedback {
  //
  // enum
  //

  /// 成功
  success(Icons.check_circle_outline),

  /// 情報
  info(Icons.info_outline),

  /// 警告
  warning(Icons.warning_amber_outlined),

  /// エラー
  error(Icons.error_outline);

  //
  // fields
  //

  /// アイコン
  final IconData icon;

  //
  // constructor
  //

  const AppFeedback(this.icon);

  //
  // getter
  //

  /// テキスト色
  ///
  /// - [context] コンテキスト
  Color textColor(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppFeedbackColor>()!;

    return switch (this) {
      AppFeedback.success => colors.success,
      AppFeedback.info => colors.info,
      AppFeedback.warning => colors.warning,
      AppFeedback.error => theme.colorScheme.error,
    };
  }

  /// コンテナ色
  ///
  /// - [context] コンテキスト
  Color containerColor(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppFeedbackColor>()!;

    return switch (this) {
      AppFeedback.success => colors.successContainer,
      AppFeedback.info => colors.infoContainer,
      AppFeedback.warning => colors.warningContainer,
      AppFeedback.error => theme.colorScheme.errorContainer,
    };
  }
}
