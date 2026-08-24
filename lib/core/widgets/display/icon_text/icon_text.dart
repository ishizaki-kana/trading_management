import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_spacing.dart';

/// アイコンとテキスト
///
/// - [icon] 表示するアイコン
/// - [text] 表示するテキスト
/// - [spacing] アイコンとテキストの間隔
/// - [textStyle] テキストのスタイル
class IconText extends StatelessWidget {
  final Widget icon;
  final String text;
  final double spacing;
  final TextStyle? textStyle;

  const IconText({
    super.key,
    required this.icon,
    required this.text,
    this.spacing = AppSpacing.s8,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
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
