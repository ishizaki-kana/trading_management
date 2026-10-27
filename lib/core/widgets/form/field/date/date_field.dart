import 'package:flutter/material.dart';
import 'package:trading_management/core/form/app_form_field.dart';
import 'package:trading_management/core/utils/date_time_formatter.dart';
import 'package:trading_management/core/widgets/form/field/text/text_field.dart';

/// 日付入力ボックス
///
/// - [field] フィールド
/// - [showLabel] ラベルを表示するかどうか
/// - [onSaved] 入力値保存時のコールバック
class DateField extends StatefulWidget {
  //
  // fields
  //

  /// フィールド
  final AppFormField<DateTime> field;

  /// ラベルを表示するかどうか
  final bool showLabel;

  /// 入力値保存時のコールバック
  final FormFieldSetter<DateTime?>? onSaved;

  //
  // constructor
  //

  const DateField(this.field, {super.key, this.showLabel = true, this.onSaved});

  //
  // public methods
  //

  @override
  State<DateField> createState() => _AppDateFieldState();
}

class _AppDateFieldState extends State<DateField> {
  //
  // fields
  //

  /// コントローラー
  late TextEditingController _controller;

  /// 選択された日付
  late DateTime? _selectedDate;

  //
  // public methods
  //

  /// 初期化
  @override
  void initState() {
    super.initState();

    _selectedDate = widget.field.value;
    _controller = TextEditingController(
      text: DateTimeFormatter.formatDate(_selectedDate),
    );
  }

  /// 破棄
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final field = widget.field;

    return AppTextField(
      AppFormField(
        id: field.id,
        name: field.name,
        value: field.value.toString(),
      ),
      controller: _controller,
      suffix: const Icon(Icons.calendar_month),
      showLabel: widget.showLabel,
      isReadOnly: true,
      onTap: _selectDate,
      onSaved: (_) => widget.onSaved?.call(_selectedDate),
    );
  }

  //
  // private methods
  //

  /// 日付選択
  ///
  /// 日付ピッカーを表示し、選択値をテキストフィールドに反映させます。
  Future<void> _selectDate() async {
    final today = DateUtils.dateOnly(DateTime.now());
    final selectedDate = _selectedDate;
    final initialDate = selectedDate != null && !selectedDate.isBefore(today)
        ? selectedDate
        : today;

    // 日付ピッカー表示
    final date = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    // 選択されなかったとき
    if (date == null) return;

    // 選択値設定
    setState(() {
      _selectedDate = date;
      _controller.text = DateTimeFormatter.formatDate(date);
    });
  }
}
