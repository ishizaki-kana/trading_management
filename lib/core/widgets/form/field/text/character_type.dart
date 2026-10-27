/// 文字タイプ
enum CharacterType {
  //
  // enum
  //

  /// 半角英数
  alphanumeric('半角英数', r'[A-Za-z0-9]'),

  /// アンダースコア
  underscore('アンダースコア', r'_');

  //
  // fields
  //

  /// パターン名
  final String patternName;

  /// パターン
  final String pattern;

  //
  // constructor
  //

  const CharacterType(this.patternName, this.pattern);
}
