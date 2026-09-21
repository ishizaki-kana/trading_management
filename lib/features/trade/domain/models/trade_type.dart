import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_color.dart';

/// 取引種別
enum TradeType {
  //
  // enum
  //

  /// 交換
  exchange(1, '交換', AppColor.blue),

  /// 譲渡
  transfer(2, '譲渡', AppColor.yellow),

  /// 買取
  purchase(3, '買取', AppColor.green);

  //
  // fields
  //

  /// 取引種別コード
  final int code;

  /// 取引種別名
  final String label;

  /// 取引種別の表示色
  final Color color;

  //
  // constructor
  //

  const TradeType(this.code, this.label, this.color);

  //
  // public methods
  //

  /// 取引種別取得
  ///
  /// コードに対応する取引種別を返します。
  ///
  /// - [code] 取引種別コード
  static TradeType fromCode(int code) {
    return values.firstWhere((t) => t.code == code);
  }
}
