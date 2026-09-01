import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trading_management/core/widgets/display/image/placeholder/image_placeholder.dart';

/// ネットワーク画像
///
/// [imageUrl] 表示する画像のUrl
/// [width] 画像の幅
/// [height] 画像の高さ
/// [borderRadius] 画像の角丸
class AppNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;

  const AppNetworkImage({
    required this.imageUrl,
    super.key,
    this.width = double.infinity,
    this.height = double.infinity,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final url = imageUrl;
    final Widget content;

    // 画像がないとき
    if (url == null || url.isEmpty) {
      content = ImagePlaceholder(width: width, height: height);
    } else {
      content = CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.cover,
        width: width,
        height: height,
        placeholder: (_, _) => const ImagePlaceholder(),
        errorWidget: (_, _, _) => const ImagePlaceholder(),
      );
    }

    if (borderRadius != null) {
      return ClipRRect(borderRadius: borderRadius!, child: content);
    }

    return content;
  }
}
