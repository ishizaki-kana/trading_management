import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_spacing.dart';

/// アイコンとテキスト
///
/// - [icon] アイコン
/// - [text] テキスト
/// - [spacing] アイコンとテキストの間隔
/// - [textStyle] テキストスタイル
class IconText extends StatelessWidget {
  //
  // fields
  //

  /// アイコン
  final Widget icon;

  /// テキスト
  final String text;

  /// アイコンとテキストの間隔
  final double spacing;

  /// テキストスタイル
  final TextStyle? textStyle;

  //
  // constructor
  //

  const IconText({
    super.key,
    required this.icon,
    required this.text,
    this.spacing = AppSpacing.s8,
    this.textStyle,
  });

  //
  // public methods
  //

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: spacing,
      children: [
        icon,
        Flexible(
          child: Text(
            text,
            style: textStyle ?? theme.textTheme.labelLarge,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
