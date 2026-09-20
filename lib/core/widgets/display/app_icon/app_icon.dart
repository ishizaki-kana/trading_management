import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_icon_size.dart';
import 'package:trading_management/core/theme/app_radius.dart';
import 'package:trading_management/core/theme/app_spacing.dart';

/// アプリロゴアイコン
///
/// - [iconSize]: アイコンサイズ
class AppIcon extends StatelessWidget {
  //
  // fields
  //

  /// アイコンサイズ
  final double iconSize;

  //
  // constructor
  //
  const AppIcon({super.key, this.iconSize = AppIconSize.lg});

  //
  // public methods
  //

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(AppSpacing.s4),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: AppRadius.sm,
      ),
      child: Icon(
        Icons.swap_horiz,
        color: theme.colorScheme.onPrimary,
        size: iconSize,
      ),
    );
  }
}
