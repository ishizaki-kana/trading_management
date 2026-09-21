import 'package:trading_management/core/data/database/app_database.dart';
import 'package:trading_management/features/image/application/stored_image_service.dart';
import 'package:trading_management/features/partner/application/services/partner_service.dart';
import 'package:trading_management/features/trade/application/mappers/trade_mapper.dart';
import 'package:trading_management/features/trade/application/models/trade_summary.dart';
import 'package:trading_management/features/trade/application/services/trade_stage_history_service.dart';
import 'package:trading_management/features/trade/data/trade/trade_repository.dart';
import 'package:trading_management/features/trade/data/trade/trade_search_conditions.dart';

/// 取引サービス
///
/// 取引データの取得・登録・更新・削除を行います。
class TradeService {
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
  });

  //
  // public methods
  //

  /// 取引リスト取得
  ///
  /// - [conditions] 検索条件
  Future<List<TradeSummary>> getTrades(TradeSearchConditions conditions) async {
    final trades = await _repository.getByConditions(conditions);

    final tradeIds = trades.map((t) => t.tradeId).toSet().toList();
    final partnerIds = trades.map((t) => t.partnerId).toSet().toList();
    final imageIds = <String>{
      for (final trade in trades) ?trade.offerItemImageId,
      for (final trade in trades) ?trade.wantedItemImageId,
    }.toList();

    // 並列処理で取得
    final (partners, stages, images) = await (
      _partnerService.getPartnersById(partnerIds),
      _stageHistoryService.getHistories(tradeIds),
      _storedImageService.getImages(imageIds),
    ).wait;

    return trades.map((trade) {
      final partner = partners[trade.partnerId];
      final offerItemImage = images[trade.offerItemImageId];
      final wantedItemImage = images[trade.wantedItemImageId];
      final compStage = stages[trade.tradeId];

      return TradeMapper.toTradeSummary(
        trade,
        partner,
        offerItemImage,
        wantedItemImage,
        compStage ?? [],
      );
    }).toList();
  }
}
