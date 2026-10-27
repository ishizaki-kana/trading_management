/// 値が指定されていない状態
///
/// `copyWith` で「引数の省略」と「`null` の指定」を区別するために使います。
const unset = _Unset();

/// 値が指定されていないことを表すクラス
///
/// 通常の値や `null` と区別できるオブジェクトを作ります。
class _Unset {
  const _Unset();
}
