import 'package:trading_management/core/data/database/app_database.dart';
import 'package:trading_management/features/image/data/stored_image_repository.dart';
import 'package:trading_management/features/image/data/stored_image_search_conditions.dart';

/// 画像サービス
///
/// 画像データの取得・登録・更新・削除を行います。
class StoredImageService {
  //
  // fields
  //

  /// 画像リポジトリ
  final StoredImageRepository _repository;

  //
  // constructor
  //

  /// 画像サービス生成
  ///
  /// `AppDatabase`を使用して画像サービスを生成します。
  ///
  /// - [database] データベース
  factory StoredImageService.fromDatabase(AppDatabase database) {
    return StoredImageService(repository: StoredImageRepository(database));
  }

  /// 画像サービス生成
  ///
  /// 指定したリポジトリを使用して画像サービスを生成します。
  ///
  /// - [repository] 画像リポジトリ
  factory StoredImageService({required StoredImageRepository repository}) {
    return StoredImageService._(repository: repository);
  }

  StoredImageService._({required this._repository});

  //
  // public methods
  //

  /// 画像取得
  ///
  /// - [imageId] 画像ID
  Future<StoredImage?> getImage(String imageId) {
    return _repository.getById(imageId);
  }

  /// 画像リスト取得
  ///
  /// 画像を ID で取得できる Map として返却します。
  ///
  /// - [imageIds] 画像IDリスト
  Future<Map<String, StoredImage>> getImages(List<String> imageIds) async {
    final conditions = StoredImageSearchConditions(imageIds: imageIds);
    final images = await _repository.getByConditions(conditions);

    return {for (final image in images) image.imageId: image};
  }
}
