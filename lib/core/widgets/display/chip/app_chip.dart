import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_color.dart';

/// チップ
class AppChip extends StatelessWidget {
  //
  // fields
  //

  final String label;

  final Color? color;

  //
  // constructor
  //

  const AppChip(this.label, {super.key, this.color});

  //
  // public methods
  //
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final chipColor = color ?? AppColor.lightGrey;

    return Chip(
      label: Text(label),
      labelStyle: theme.textTheme.labelMedium?.copyWith(
        fontWeight: FontWeight.bold,
        color: theme.colorScheme.onPrimary,
      ),
      color: WidgetStatePropertyAll(chipColor),
      side: BorderSide(color: chipColor),
    );
  }
}
