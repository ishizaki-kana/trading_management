import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_color.dart';
import 'package:trading_management/core/theme/app_duration.dart';
import 'package:trading_management/core/theme/app_radius.dart';
import 'package:trading_management/core/theme/app_spacing.dart';

/// チップ
///
/// - [label] ラベル
/// - [labelStyle] ラベルスタイル
/// - [color] 色
/// - [rounded] 丸み
/// - [isSelected] 選択されているかどうか
/// - [onTap] タップ時のコールバック
class AppChip extends StatelessWidget {
  //
  // fields
  //

  /// ラベル
  final String label;

  /// ラベルスタイル
  final TextStyle? labelStyle;

  /// 色
  final Color color;

  /// 丸み
  final bool rounded;

  /// 選択されているかどうか
  final bool isSelected;

  /// タップ時のコールバック
  final VoidCallback? onTap;

  //
  // constructor
  //

  const AppChip({
    super.key,
    required this.label,
    this.color = AppColor.primary,
    this.rounded = false,
    this.isSelected = true,
    this.labelStyle,
    this.onTap,
  });

  //
  // public methods
  //

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final radius = rounded ? AppRadius.lg : AppRadius.sm;

    return InkWell(
      onTap: onTap,
      borderRadius: radius,
      child: AnimatedContainer(
        duration: AppDuration.short,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.s12,
          vertical: AppSpacing.s6,
        ),
        decoration: BoxDecoration(
          color: isSelected ? color : theme.colorScheme.surface,
          borderRadius: radius,
          border: Border.all(
            color: isSelected ? color : theme.colorScheme.outline,
          ),
        ),
        child: Text(
          label,
          style:
              labelStyle ??
              theme.textTheme.labelMedium!.copyWith(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected
                    ? theme.colorScheme.onPrimary
                    : theme.colorScheme.onSurface,
              ),
        ),
      ),
    );
  }
}
