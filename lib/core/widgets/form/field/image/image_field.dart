import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trading_management/core/form/app_form_field.dart';
import 'package:trading_management/core/navigation/app_navigator.dart';
import 'package:trading_management/core/widgets/display/image/stored_image.dart';
import 'package:trading_management/core/widgets/display/typography/label/label.dart';
import 'package:trading_management/core/widgets/form/field/image/crop_modal/image_crop_modal.dart';

/// 画像ピッカー
///
/// 画像選択後、切り抜きモーダルを表示します。
///
/// - [field] フィールド
/// - [width] 横幅
/// - [height] 高さ
/// - [showLabel] ラベルを表示するかどうか
/// - [onSaved] 入力値保存時のコールバック
class ImageField extends StatelessWidget {
  //
  // fields
  //

  /// フィールド
  final AppFormField<Uint8List?> field;

  /// 横幅
  final double width;

  /// 高さ
  final double height;

  /// ラベルを表示するかどうか
  final bool showLabel;

  /// 入力値保存時のコールバック
  final FormFieldSetter<Uint8List?>? onSaved;

  //
  // constructor
  //

  const ImageField(
    this.field, {
    super.key,
    this.width = 80,
    this.height = 80,
    this.showLabel = true,
    this.onSaved,
  });

  //
  // public methods
  //

  @override
  Widget build(BuildContext context) {
    return FormField<Uint8List?>(
      initialValue: field.value,
      onSaved: onSaved,
      builder: (state) {
        return GestureDetector(
          onTap: () => _selectImage(context, state),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (showLabel) Label(field.name, isRequired: field.isRequired),
              AppStoredImage(
                imageBytes: state.value,
                width: width,
                height: height,
              ),
            ],
          ),
        );
      },
    );
  }

  //
  // private methods
  //

  /// 画像選択
  ///
  /// 画像ピッカーを表示し、選択値を反映させます
  Future<void> _selectImage(
    BuildContext context,
    FormFieldState<Uint8List?> state,
  ) async {
    // 画像ピッカー表示
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    // 選択されなかったとき
    if (image == null) return;

    // 選択値設定
    final bytes = await image.readAsBytes();
    if (!context.mounted) return;

    // 切り抜き
    final croppedBytes = await AppNavigator.pushFullHeightModal<Uint8List>(
      context,
      ImageCropModal(imageBytes: bytes),
    );
    if (croppedBytes == null || !context.mounted) return;

    state.didChange(croppedBytes);
  }
}
