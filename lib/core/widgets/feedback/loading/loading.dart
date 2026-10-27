import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_color.dart';
import 'package:trading_management/core/theme/app_icon_size.dart';

/// ローディング
///
/// 中央にプログレスバーを表示します。
///
/// - [size] サイズ
class Loading extends StatelessWidget {
  //
  // fields
  //

  /// サイズ
  final double? size;

  //
  // constructor
  //

  const Loading({super.key, this.size = AppIconSize.md});

  //
  // public methods
  //

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    final indicatorSize = size ?? AppIconSize.md;
    final color = AppColor.grey;

    final Widget indicator = switch (platform) {
      TargetPlatform.iOS || TargetPlatform.macOS => CupertinoActivityIndicator(
        radius: indicatorSize / 2,
        color: color,
      ),
      _ => CircularProgressIndicator(strokeWidth: 2.5, color: color),
    };

    return SizedBox(
      child: Center(
        child: SizedBox(width: size, height: size, child: indicator),
      ),
    );
  }
}
