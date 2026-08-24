import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_spacing.dart';
import 'package:trading_management/core/widgets/form/button/app_button.dart';

/// 底部アクションバー
class BottomActionBar extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;

  const BottomActionBar({
    super.key,
    required this.buttonText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.s16,
        vertical: AppSpacing.s8,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.shadow,
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        child: AppButton(
          onPressed: onPressed,
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.s16),
          text: buttonText,
        ),
      ),
    );
  }
}
