import 'package:flutter/material.dart';

/// 見出し
/// - [text] 表示するテキスト
/// - [textAlign] テキストの配置（デフォルト：start）
/// - [maxLines] 最大行数（デフォルト：1）
class Heading extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final int maxLines;

  const Heading({
    super.key,
    required this.text,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      text,
      textAlign: textAlign,
      style: theme.textTheme.titleMedium,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
    );
  }
}
