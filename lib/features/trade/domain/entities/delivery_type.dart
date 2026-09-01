import 'package:flutter/material.dart';
import 'package:trading_management/core/constants/app_code.dart';

/// 受渡種別
enum DeliveryType {
  /// 手渡し
  handoff(1, AppCode.deliveryTypeHandoff, Color(0xFFbfa5f8)),

  /// 郵送
  shipping(2, AppCode.deliveryTypeShipping, Color(0xFFf69487));

  const DeliveryType(this.code, this.label, this.color);

  /// 受渡種別コード
  final int code;

  /// 受渡種別名
  final String label;

  /// 受渡種別の表示色
  final Color color;

  static DeliveryType fromCode(int code) {
    return values.firstWhere((t) => t.code == code);
  }
}
