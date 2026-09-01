import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_color.dart';
import 'package:trading_management/core/theme/app_icon_size.dart';

/// 画像のプレースホルダー
///
/// - [width] 横幅
/// - [height] 高さ
class ImagePlaceholder extends StatelessWidget {
  final double? width;
  final double? height;

  const ImagePlaceholder({
    super.key,
    this.width = double.infinity,
    this.height = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      color: AppColor.lightGrey,
      child: const Center(
        child: Icon(Icons.image, size: AppIconSize.xxxl, color: AppColor.grey),
      ),
    );
  }
}
