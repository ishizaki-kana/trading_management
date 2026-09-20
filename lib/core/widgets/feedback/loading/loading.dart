import 'package:flutter/material.dart';

/// ローディング画面
///
/// 画面中央にプログレスバーを表示します。
class Loading extends StatelessWidget {
  //
  // constructor
  //

  const Loading({super.key});

  //
  // public methods
  //

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ColoredBox(
      color: theme.colorScheme.surface,
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}
