import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_spacing.dart';
import 'package:trading_management/core/widgets/form/button/app_button.dart';
import 'package:trading_management/core/widgets/form/button/app_button_config.dart';

/// 底部アクションバー
///
/// - [config] ボタンコンフィグ
class BottomActionBar extends StatelessWidget {
  //
  // fields
  //

  /// ボタンコンフィグ
  final AppButtonConfig config;

  //
  // constructor
  //

  const BottomActionBar({super.key, required this.config});

  //
  // public methods
  //

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.s16,
          vertical: AppSpacing.s8,
        ),
        decoration: BoxDecoration(color: theme.colorScheme.surfaceContainerLow),
        child: SizedBox(
          width: double.infinity,
          child: AppButton(
            onPressed: config.onPressed,
            text: config.text ?? '',
            isLoading: config.isLoading ?? false,
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.s16),
          ),
        ),
      ),
    );
  }
}
