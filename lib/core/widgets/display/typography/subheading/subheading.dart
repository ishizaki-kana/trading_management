import 'package:flutter/material.dart';

/// 小見出し
///
/// - [text] テキスト
/// - [maxLines] 最大行数（デフォルト：1）
class Subheading extends StatelessWidget {
  //
  // fields
  //

  /// テキスト
  final String text;

  /// 最大行数
  final int maxLines;

  //
  // constructor
  //

  const Subheading(this.text, {super.key, this.maxLines = 1});

  //
  // public methods
  //

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
