import 'package:flutter/material.dart';

/// 取引種別
enum TradeType {
  /// 交換
  exchange(1, '交換', Color(0xFF87a6f6)),

  /// 譲渡
  transfer(2, '譲渡', Color(0xFFf6d787)),

  /// 買取
  purchase(3, '買取', Color(0xFF9dcbb2));

  const TradeType(this.code, this.label, this.color);

  /// 取引種別コード
  final int code;

  /// 取引種別名
  final String label;

  /// 取引種別の表示色
  final Color color;

  static TradeType fromCode(int code) {
    return values.firstWhere((t) => t.code == code);
  }
}
