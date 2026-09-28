import 'package:trading_management/core/utils/date_time_formatter.dart';

class TradeFormatter {
  const TradeFormatter._(); // インスタンス化禁止

  /// 取引日時・場所フォーマット
  ///
  /// `${tradeAt} ${location}`の形にフォーマットして返却します。
  ///
  /// - [tradedAt] 取引日時
  /// - [location] 取引場所
  static String formatDateLocation({
    required DateTime? tradedAt,
    required String? location,
  }) {
    return '${DateTimeFormatter.formatDate(tradedAt)} ${location ?? ''}'.trim();
  }
}
