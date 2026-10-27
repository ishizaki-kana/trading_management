/// チェックリストの選択肢
class CheckboxOption<T> {
  //
  // fields
  //

  ///値
  final T value;

  /// ラベル
  final String label;

  //
  // constructor
  //

  const CheckboxOption({required this.value, required this.label});
}
