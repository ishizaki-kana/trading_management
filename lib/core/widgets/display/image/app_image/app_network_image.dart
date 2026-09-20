import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trading_management/core/widgets/display/image/placeholder/image_placeholder.dart';

/// ネットワーク画像
///
/// [imageUrl] 画像URL
/// [width] 横幅
/// [height] 高さ
/// [borderRadius] 角丸
class AppNetworkImage extends StatelessWidget {
  //
  // fields
  //

  /// 画像URL
  final String? imageUrl;

  /// 横幅
  final double? width;

  /// 高さ
  final double? height;

  /// 角丸
  final BorderRadius? borderRadius;

  //
  // constructor
  //

  const AppNetworkImage({
    required this.imageUrl,
    super.key,
    this.width,
    this.height,
    this.borderRadius,
  });

  //
  // public methods
  //

  @override
  Widget build(BuildContext context) {
    final url = imageUrl?.trim();
    final Widget content;

    // 画像がないとき
    if (url == null || url.isEmpty) {
      content = _buildPlaceholder();
    } else {
      content = CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.cover,
        width: width,
        height: height,
        placeholder: (_, _) => _buildPlaceholder(),
        errorWidget: (_, _, _) => _buildPlaceholder(),
      );
    }

    if (borderRadius != null) {
      return ClipRRect(borderRadius: borderRadius!, child: content);
    }

    return content;
  }

  //
  // private methods
  //

  /// プレースホルダー
  Widget _buildPlaceholder() {
    return ImagePlaceholder(width: width, height: height);
  }
}
