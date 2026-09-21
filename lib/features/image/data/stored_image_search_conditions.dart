import 'package:trading_management/core/data/repositories/base_search_conditions.dart';

/// 画像検索条件
class StoredImageSearchConditions extends BaseSearchConditions {
  //
  // fields
  //

  /// 画像IDリスト
  final List<String>? imageIds;

  //
  // constructor
  //

  const StoredImageSearchConditions({this.imageIds});
}
