import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// メッセージ種別抽象クラス
abstract interface class AppMessageType {
  //
  // getter
  //

  /// アイコン
  FaIconData? get icon;

  //
  // public methods
  //

  /// テキスト色
  ///
  /// - [context] コンテキスト
  Color textColor(BuildContext context);

  /// コンテナ色
  ///
  /// - [context] コンテキスト
  Color containerColor(BuildContext context);
}
