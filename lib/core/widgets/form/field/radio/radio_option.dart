import 'package:flutter/material.dart';

/// ラジオリストの選択肢
class RadioOption {
  /// 選択値
  final int value;

  /// 表示ラベル
  final String label;

  /// 選択時の色
  final Color? selectedColor;

  const RadioOption({
    required this.value,
    required this.label,
    this.selectedColor,
  });
}
