import 'package:intl/intl.dart';

/// 日時フォーマッター
class DateTimeFormatter {
  DateTimeFormatter._(); // インスタンス化禁止

  //
  // fields
  //

  /// 日付フォーマッター（yyyy/MM/dd）
  static final DateFormat _dateFormatter = DateFormat('yyyy/MM/dd');

  //
  // public methods
  //

  /// 日付変換
  ///
  /// 日時型のデータを`yyyy/MM/dd`形式の文字列に変換します。
  ///
  /// - [datetime] 日時
  static String formatDate(DateTime datetime) {
    return _dateFormatter.format(datetime);
  }
}
