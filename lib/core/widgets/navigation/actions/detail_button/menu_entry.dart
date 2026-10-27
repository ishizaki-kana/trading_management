import 'package:flutter/material.dart';

/// メニュー要素ベースクラス
class MenuEntry {
  //
  // fields
  //

  /// ラベル
  final String label;

  /// アイコン
  final IconData? leading;

  /// 選択時のコールバック
  final VoidCallback? onSelected;

  //
  // constructor
  //

  const MenuEntry({required this.label, this.leading, this.onSelected});
}
