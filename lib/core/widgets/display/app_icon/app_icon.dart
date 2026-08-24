import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_color.dart';
import 'package:trading_management/core/theme/app_icon_size.dart';
import 'package:trading_management/core/theme/app_radius.dart';
import 'package:trading_management/core/theme/app_spacing.dart';

/// アプリロゴアイコン
/// - [size]: アイコンのサイズ
class AppIcon extends StatelessWidget {
  final double size;

  const AppIcon({super.key, this.size = AppIconSize.lg});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.s4),
      decoration: BoxDecoration(
        color: AppColor.primary,
        borderRadius: AppRadius.sm,
      ),
      child: Icon(
        Icons.swap_horiz,
        color: Theme.of(context).colorScheme.onPrimary,
        size: size,
      ),
    );
  }
}
