import 'package:flutter/material.dart';

/// 見出し
///
/// - [text] テキスト
/// - [textAlign] テキストの配置（デフォルト：start）
/// - [maxLines] 最大行数（デフォルト：1）
class Heading extends StatelessWidget {
  //
  // fields
  //

  /// テキスト
  final String text;

  /// テキストの配置
  final TextAlign textAlign;

  /// 最大行数
  final int maxLines;

  //
  // constructor
  //

  const Heading({
    super.key,
    required this.text,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
  });

  //
  // public methods
  //

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
