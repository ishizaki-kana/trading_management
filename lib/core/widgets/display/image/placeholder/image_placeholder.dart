import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_color.dart';
import 'package:trading_management/core/theme/app_icon_size.dart';

/// 画像のプレースホルダー
///
/// - [width] 横幅
/// - [height] 高さ
class ImagePlaceholder extends StatelessWidget {
  //
  // fields
  //

  /// 横幅
  final double? width;

  /// 高さ
  final double? height;

  //
  // constructor
  //

  const ImagePlaceholder({super.key, this.width, this.height});

  //
  // public methods
  //

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      color: AppColor.lightGrey,
      child: const Icon(
        Icons.image,
        size: AppIconSize.xxxl,
        color: AppColor.grey,
      ),
    );
  }
}
