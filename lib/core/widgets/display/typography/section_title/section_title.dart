import 'package:flutter/material.dart';

/// セクションタイトル
///
/// - [text] テキスト
class SectionTitle extends StatelessWidget {
  //
  // fields
  //

  /// テキスト
  final String text;

  //
  // constructor
  //

  const SectionTitle({super.key, required this.text});

  //
  // public methods
  //

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: theme.textTheme.bodySmall?.copyWith(
        fontWeight: FontWeight.bold,
        color: theme.colorScheme.onSurfaceVariant,
      ),
    );
  }
}
