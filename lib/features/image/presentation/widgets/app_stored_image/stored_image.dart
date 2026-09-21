import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:trading_management/features/image/presentation/widgets/placeholder/image_placeholder.dart';

/// 画像
class AppStoredImage extends StatelessWidget {
  //
  // fields
  //

  /// 画像データ
  final Uint8List? imageBytes;

  /// 横幅
  final double? width;

  /// 高さ
  final double? height;

  /// 角丸
  final BorderRadius? borderRadius;

  //
  // constructor
  //

  const AppStoredImage({
    required this.imageBytes,
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
    final Widget content;

    if (imageBytes == null) {
      content = ImagePlaceholder(width: width, height: height);
    } else {
      content = Image.memory(
        imageBytes!,
        width: width,
        height: height,
        fit: BoxFit.cover,
      );
    }

    if (borderRadius != null) {
      return ClipRRect(borderRadius: borderRadius!, child: content);
    }

    return content;
  }
}
