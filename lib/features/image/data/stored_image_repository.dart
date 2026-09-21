import 'package:trading_management/core/data/database/app_database.dart';
import 'package:trading_management/core/data/repositories/base_repository.dart';
import 'package:trading_management/features/image/data/stored_image_search_conditions.dart';

/// 画像リポジトリ
class StoredImageRepository
    extends BaseRepository<StoredImage, String, StoredImageSearchConditions> {
  //
  // constructor
  //

  const StoredImageRepository(super.database);

  //
  // public method
  //

  @override
  Future<StoredImage?> getById(String id) {
    final query = database.select(database.storedImages)
      ..where((image) => image.imageId.equals(id));

    return query.getSingleOrNull();
  }

  @override
  Future<List<StoredImage>> getByConditions(
    StoredImageSearchConditions conditions,
  ) {
    final query = database.select(database.storedImages);

    // 画像IDリスト
    if (conditions.imageIds case final imageIds?) {
      if (imageIds.isEmpty) {
        return Future.value([]);
      }

      query.where((images) => images.imageId.isIn(imageIds));
    }

    return query.get();
  }
}
