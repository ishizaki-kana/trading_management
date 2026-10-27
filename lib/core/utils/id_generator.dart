import 'package:uuid/uuid.dart';

/// ID作成クラス
class IdGenerator {
  IdGenerator._(); // インスタンス化禁止

  //
  // static fields
  //

  /// UUIDジェネレータ
  static final Uuid _uuid = Uuid();

  //
  // public methods
  //

  /// ID生成
  ///
  /// UUIDを使用してランダムなIDを作成します。
  static String newId() {
    return _uuid.v4();
  }
}
