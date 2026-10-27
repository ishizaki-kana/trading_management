import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_radius.dart';
import 'package:trading_management/core/widgets/display/image/placeholder/image_placeholder.dart';

/// 画像
///
/// - [imageBytes] 画像データ
/// - [width] 横幅
/// - [height] 高さ
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

  //
  // constructor
  //

  const AppStoredImage({
    required this.imageBytes,
    super.key,
    this.width,
    this.height,
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

    return ClipRRect(borderRadius: AppRadius.sm, child: content);
  }
}
