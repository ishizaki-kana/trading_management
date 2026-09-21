import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_color.dart';

/// 受渡種別
enum DeliveryType {
  //
  // enum
  //

  /// 手渡し
  handoff(1, '手渡し', AppColor.purple),

  /// 郵送
  shipping(2, '郵送', AppColor.orange);

  //
  // fields
  //

  /// 受渡種別コード
  final int code;

  /// 受渡種別名
  final String label;

  /// 受渡種別の表示色
  final Color color;

  //
  // constructor
  //

  const DeliveryType(this.code, this.label, this.color);

  //
  // public methods
  //

  /// 受渡種別取得
  ///
  /// コードに対応する受渡種別を返します。
  ///
  /// - [code] 受取種別コード
  static DeliveryType fromCode(int code) {
    return values.firstWhere((t) => t.code == code);
  }
}
