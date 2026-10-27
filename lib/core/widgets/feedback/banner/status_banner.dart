import 'package:flutter/material.dart' hide Feedback;
import 'package:trading_management/core/theme/app_radius.dart';
import 'package:trading_management/core/theme/app_spacing.dart';
import 'package:trading_management/core/types/app_feedback.dart';

/// バナー
///
/// - [type] タイプ
/// - [message] メッセージ
class StatusBanner extends StatelessWidget {
  //
  // fields
  //

  /// タイプ
  final AppFeedback type;

  /// メッセージ
  final String message;

  //
  // constructor
  //

  const StatusBanner({super.key, required this.type, required this.message});

  //
  // public methods
  //

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: type.containerColor(context),
        borderRadius: AppRadius.sm,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.s12,
        vertical: AppSpacing.s12,
      ),
      child: Row(
        spacing: AppSpacing.s8,
        children: [
          Icon(type.icon, color: type.textColor(context)),
          Expanded(
            child: Text(
              message,
              style: TextStyle(color: type.textColor(context)),
            ),
          ),
        ],
      ),
    );
  }
}
