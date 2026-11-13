import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trading_management/core/theme/app_feedback_color.dart';
import 'package:trading_management/core/types/message_type/app_message_type.dart';

/// フィードバック種別
enum AppFeedbackType implements AppMessageType {
  //
  // enum
  //

  /// 成功
  success(FontAwesomeIcons.circleCheck),

  /// 情報
  info(FontAwesomeIcons.circleInfo),

  /// 警告
  warning(FontAwesomeIcons.triangleExclamation),

  /// エラー
  error(FontAwesomeIcons.circleXmark);

  //
  // fields
  //

  @override
  final FaIconData icon;

  //
  // constructor
  //

  const AppFeedbackType(this.icon);

  //
  // public methods
  //

  @override
  Color textColor(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppFeedbackTypeColor>()!;

    return switch (this) {
      AppFeedbackType.success => colors.success,
      AppFeedbackType.info => colors.info,
      AppFeedbackType.warning => colors.warning,
      AppFeedbackType.error => theme.colorScheme.error,
    };
  }

  @override
  Color containerColor(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppFeedbackTypeColor>()!;

    return switch (this) {
      AppFeedbackType.success => colors.successContainer,
      AppFeedbackType.info => colors.infoContainer,
      AppFeedbackType.warning => colors.warningContainer,
      AppFeedbackType.error => theme.colorScheme.errorContainer,
    };
  }
}
