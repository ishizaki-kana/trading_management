import 'package:trading_management/core/application/services/base_service.dart';
import 'package:trading_management/core/data/database/app_database.dart';
import 'package:trading_management/core/exception/not_found_exception.dart';
import 'package:trading_management/core/types/app_operation_type.dart';
import 'package:trading_management/features/image/application/services/stored_image_service.dart';
import 'package:trading_management/features/partner/application/models/partner_detail.dart';
import 'package:trading_management/features/partner/application/services/partner_service.dart';
import 'package:trading_management/features/trade/application/forms/trade_form.dart';
import 'package:trading_management/features/trade/application/mappers/trade_mapper.dart';
import 'package:trading_management/features/trade/application/models/trade_detail.dart';
import 'package:trading_management/features/trade/application/models/trade_summary.dart';
import 'package:trading_management/features/trade/application/services/trade_stage_history_service.dart';
import 'package:trading_management/features/trade/data/trade/trade_repository.dart';
import 'package:trading_management/features/trade/data/trade/trade_search_conditions.dart';

/// 取引サービス
///
/// 取引データの取得・登録・更新・削除を行います。
class TradeService extends BaseService {
  //
  // fields
  //

  /// 取引リポジトリ
  final TradeRepository _repository;

  /// 取引相手サービス
  final PartnerService _partnerService;

  /// 取引ステージ履歴サービス
  final TradeStageHistoryService _stageHistoryService;

  /// 画像サービス
  final StoredImageService _storedImageService;

  //
  // getter
  //

  @override
  String get tableName => 'trades';

  //
  // constructor
  //

  /// 取引サービス生成
  ///
  /// `AppDatabase`を使用して取引サービスを生成します。
  ///
  /// - [database] データベース
  factory TradeService.fromDatabase(AppDatabase database) {
    return TradeService(
      repository: TradeRepository(database),
      partnerService: PartnerService.fromDatabase(database),
      stageHistoryService: TradeStageHistoryService.fromDatabase(database),
      storedImageService: StoredImageService.fromDatabase(database),
    );
  }

  /// 取引サービス生成
  ///
  /// 指定したリポジトリを使用して取引サービスを生成します。
  ///
  /// - [repository] 取引リポジトリ
  /// - [partnerService] 取引相手サービス
  /// - [stageHistoryService] 取引ステージ履歴サービス
  /// - [storedImageService] 画像サービス
  factory TradeService({
    required TradeRepository repository,
    required PartnerService partnerService,
    required TradeStageHistoryService stageHistoryService,
    required StoredImageService storedImageService,
  }) {
    return TradeService._(
      repository: repository,
      partnerService: partnerService,
      stageHistoryService: stageHistoryService,
      storedImageService: storedImageService,
    );
  }

  TradeService._({
    required this._repository,
    required this._partnerService,
    required this._stageHistoryService,
    required this._storedImageService,
  }) : super(_repository.database);

  //
  // public methods
  //

  /// 取引取得
  ///
  /// 取引IDに対応する取引詳細を取得します。
  ///
  /// - [tradeId] 取引ID
  ///
  /// 例外:
  /// - [NotFoundException] 指定したIDのデータが存在しないとき
  /// - [DatabaseException] DB処理実行時にエラーが発生したとき
  Future<TradeDetail> getById(String tradeId) {
    return execute(
      () async {
        final trade = await _repository.getById(tradeId);
        if (trade == null) {
          throw NotFoundException(tradeId);
        }

        final results = await Future.wait<Object?>([
          _partnerService.getById(trade.partnerId),
          _stageHistoryService.getById(tradeId),
          _storedImageService.getImagesById([
            ?trade.offerItemImageId,
            ?trade.wantedItemImageId,
          ]),
        ]);
        final partner = results[0] as PartnerDetail?;
        final stage = results[1] as List<TradeStageHistory>;
        final images = results[2] as Map<String, StoredImage>;

        return TradeMapper.toDetail(
          trade,
          partner,
          images[trade.offerItemImageId],
          images[trade.wantedItemImageId],
          stage,
        );
      },
      operation: AppOperationType.getById,
      target: tradeId,
    );
  }

  /// 取引リスト取得
  ///
  /// - [conditions] 検索条件
  ///
  /// 例外:
  /// - [DatabaseException] DB処理実行時にエラーが発生したとき
  Future<List<TradeSummary>> getByConditions(TradeSearchConditions conditions) {
    return execute(() async {
      final trades = await _repository.getByConditions(conditions);

      final tradeIds = trades.map((t) => t.tradeId).toSet().toList();
      final partnerIds = trades.map((t) => t.partnerId).toSet().toList();
      final imageIds = <String>{
        for (final trade in trades) ?trade.offerItemImageId,
        for (final trade in trades) ?trade.wantedItemImageId,
      }.toList();

      // 並列処理で取得
      final (partners, stages, images) = await (
        _partnerService.getByIds(partnerIds),
        _stageHistoryService.getByIds(tradeIds),
        _storedImageService.getImagesById(imageIds),
      ).wait;

      return trades.map((trade) {
        final partner = partners[trade.partnerId];
        final offerItemImage = images[trade.offerItemImageId];
        final wantedItemImage = images[trade.wantedItemImageId];
        final compStage = stages[trade.tradeId];

        return TradeMapper.toSummary(
          trade,
          partner,
          offerItemImage,
          wantedItemImage,
          compStage ?? [],
        );
      }).toList();
    }, operation: AppOperationType.getByConditions);
  }

  /// 取引データ更新
  ///
  /// - [tradeId] 更新対象の取引ID
  /// - [form] 取引フォーム
  ///
  /// 例外:
  /// - [NotFoundException] 指定したIDのデータが存在しないとき
  Future<void> update({
    required String tradeId,
    required String? partnerId,
    required TradeForm form,
  }) {
    return execute(
      () async {
        // 既存データの取得
        final existing = await _repository.getById(tradeId);
        if (existing == null) {
          throw NotFoundException(tradeId);
        }

        final offerItemImageId = form.offerItemImage.value == null
            ? null
            : await _storedImageService.saveImage(
                imageId: existing.offerItemImageId,
                bytes: form.offerItemImage.value!,
              );
        final wantedItemImageId = form.wantedItemImage.value == null
            ? null
            : await _storedImageService.saveImage(
                imageId: existing.wantedItemImageId,
                bytes: form.wantedItemImage.value!,
              );

        final updated = TradeMapper.toEntity(
          existing,
          form,
          offerItemImageId: offerItemImageId,
          wantedItemImageId: wantedItemImageId,
        );
        await _repository.update(updated);

        // 取引相手更新
        await _partnerService.upsert(partnerId, form.partner);
      },
      operation: AppOperationType.update,
      target: tradeId,
    );
  }
}
