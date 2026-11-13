import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trading_management/core/types/message_type/app_message_type.dart';

/// ステータス種別
enum AppStatusType implements AppMessageType {
  //
  // enum
  //

  /// データなし
  notfound(FontAwesomeIcons.fileCircleXmark);

  //
  // fields
  //

  @override
  final FaIconData icon;

  //
  // constructor
  //

  const AppStatusType(this.icon);

  //
  // public methods
  //

  @override
  Color textColor(BuildContext context) {
    final theme = Theme.of(context);
    return theme.colorScheme.onSurfaceVariant;
  }

  @override
  Color containerColor(BuildContext context) {
    final theme = Theme.of(context);
    return theme.colorScheme.surfaceContainerLow;
  }
}
