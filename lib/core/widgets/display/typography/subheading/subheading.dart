import 'package:flutter/material.dart';

/// 小見出し
///
/// - [text] 表示するテキスト
class Subheading extends StatelessWidget {
  final String text;
  final int maxLines;

  const Subheading({super.key, required this.text, this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      text,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: theme.textTheme.titleSmall,
    );
  }
}
