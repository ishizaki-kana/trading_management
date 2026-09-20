/// チェックボックスオプション
///
/// - [value] 値
/// - [label] ラベル
/// - [checked] 選択されているかどうか
class CheckboxOption {
  //
  // fields
  //

  /// 値
  final String value;

  /// ラベル
  final String label;

  /// 選択されているかどうか
  final bool checked;

  //
  // constructor
  //

  const CheckboxOption({
    required this.value,
    required this.label,
    required this.checked,
  });

  //
  // public methods
  //

  /// コピー
  ///
  /// 一部の値を変更した新しいオブジェクトを返します。
  ///
  /// - [value] 値
  /// - [label] ラベル
  /// - [checked] 選択されているかどうか
  CheckboxOption copyWith({String? value, String? label, bool? checked}) =>
      CheckboxOption(
        value: value ?? this.value,
        label: label ?? this.label,
        checked: checked ?? this.checked,
      );
}
