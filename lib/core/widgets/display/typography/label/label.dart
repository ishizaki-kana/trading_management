import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_spacing.dart';

/// ラベル
///
/// - [text] テキスト
/// - [isRequired] 必須項目かどうか
/// - [isVariant] グレーにするかどうか
class Label extends StatelessWidget {
  //
  // fields
  //

  /// テキスト
  final String text;

  /// 必須項目かどうか
  final bool isRequired;

  /// グレーにするかどうか
  final bool isVariant;

  //
  // constructor
  //

  const Label(
    this.text, {
    super.key,
    this.isRequired = false,
    this.isVariant = false,
  });

  //
  // public methods
  //

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.s4,
        vertical: AppSpacing.s8,
      ),
      child: Text.rich(
        TextSpan(
          text: text,
          style: theme.textTheme.labelMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: isVariant
                ? theme.colorScheme.onSurfaceVariant
                : theme.colorScheme.onSurface,
          ),
          children: [
            if (isRequired)
              TextSpan(
                text: ' *',
                style: TextStyle(color: theme.colorScheme.error),
              ),
          ],
        ),
      ),
    );
  }
}
