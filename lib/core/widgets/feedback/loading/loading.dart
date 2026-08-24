import 'package:flutter/material.dart';

/// ローディング画面
class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ColoredBox(
      color: theme.colorScheme.surface,
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}
