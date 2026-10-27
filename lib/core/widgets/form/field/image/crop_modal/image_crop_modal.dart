import 'dart:math' as math;

import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:trading_management/core/constants/app_message.dart';
import 'package:trading_management/core/widgets/form/button/app_button_config.dart';
import 'package:trading_management/core/widgets/layout/modal/full_height/full_height_modal.dart';

/// 画像切り抜きモーダル
///
/// - [imageBytes] 画像データ
class ImageCropModal extends StatefulWidget {
  //
  // fields
  //

  /// 画像データ
  final Uint8List imageBytes;

  //
  // constructor
  //

  const ImageCropModal({super.key, required this.imageBytes});

  //
  // public methods
  //

  @override
  State<StatefulWidget> createState() => _ImageCropModalState();
}

class _ImageCropModalState extends State<ImageCropModal> {
  //
  // fields
  //

  final _controller = CropController();

  //
  // public methods
  //

  @override
  Widget build(BuildContext context) {
    return FullHeightModal(
      title: '切り抜き',
      isScrollable: false,
      positiveBtnConfig: AppButtonConfig(
        text: 'この範囲で切り抜く',
        onPressed: _controller.crop,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final side = math.min(constraints.maxWidth, constraints.maxHeight);

          return Center(
            child: SizedBox.square(
              dimension: side,
              child: Crop(
                image: widget.imageBytes,
                controller: _controller,
                aspectRatio: 1,
                interactive: true,
                onCropped: (result) {
                  switch (result) {
                    case CropSuccess(:final croppedImage):
                      Navigator.of(context).pop(croppedImage);
                    case CropFailure():
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(AppMessage.imageCropFailed)),
                      );
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
