import 'package:flutter/material.dart';

/// キャプション
///
/// - [text] 表示するテキスト
class Caption extends StatelessWidget {
  final String text;

  const Caption({super.key, required this.text});

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
