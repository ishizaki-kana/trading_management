import 'package:flutter/material.dart';

/// キャプション
///
/// - [text] テキスト
class Caption extends StatelessWidget {
  //
  // fields
  //

  /// テキスト
  final String text;

  //
  // constructor
  //

  const Caption({super.key, required this.text});

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
        color: theme.colorScheme.onSurfaceVariant,
      ),
    );
  }
}
