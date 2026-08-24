import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_color.dart';
import 'package:trading_management/core/theme/app_duration.dart';
import 'package:trading_management/core/theme/app_radius.dart';
import 'package:trading_management/core/theme/app_spacing.dart';

/// チップ
///
/// - [label] 表示するテキスト
/// - [color] チップの色
/// - [isSelected] チップが選択されているかどうか
/// - [onTap] チップがタップされたときのコールバック
class AppChip extends StatelessWidget {
  final String label;
  final Color color;
  final bool isSelected;
  final VoidCallback? onTap;

  const AppChip({
    super.key,
    required this.label,
    this.color = AppColor.primary,
    this.isSelected = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: AppRadius.lg,
      child: AnimatedContainer(
        duration: AppDuration.short,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.s16,
          vertical: AppSpacing.s6,
        ),
        decoration: BoxDecoration(
          color: isSelected ? color : theme.colorScheme.surface,
          borderRadius: AppRadius.lg,
          border: Border.all(
            color: isSelected ? color : theme.colorScheme.outline,
          ),
        ),
        child: Text(
          label,
          style: theme.textTheme.labelMedium!.copyWith(
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
