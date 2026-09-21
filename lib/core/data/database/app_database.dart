import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:trading_management/core/data/tables/partners.dart';
import 'package:trading_management/core/data/tables/stored_images.dart';

import '../tables/trade_stages.dart';
import '../tables/trades.dart';

part 'app_database.g.dart';

/// アプリケーションのデータベース。
///
/// iOS / Android では端末内の SQLite ファイル、Web では SQLite WASM を
/// OPFS または IndexedDB に永続化します。
@DriftDatabase(tables: [Trades, TradeStageHistories, Partners, StoredImages])
class AppDatabase extends _$AppDatabase {
  //
  // constructor
  //

  AppDatabase()
    : super(
        driftDatabase(
          name: 'trading_management',
          web: DriftWebOptions(
            sqlite3Wasm: Uri.parse('sqlite3.wasm'),
            driftWorker: Uri.parse('drift_worker.js'),
            onResult: (result) {
              if (kDebugMode) {
                debugPrint(
                  'SQLite storage: ${result.chosenImplementation} '
                  '(missing: ${result.missingFeatures})',
                );
              }
            },
          ),
        ),
      );

  //
  // getter
  //

  @override
  int get schemaVersion => 1;

  //
  // public methods
  //

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (migrator) async => migrator.createAll(),
    beforeOpen: (_) async {
      if (kDebugMode) await _insertDebugData();
    },
  );

  // TODO: 削除する

  /// 取引種別・受渡種別・支払い順・進捗段階・交換日時の全組み合わせを投入します。
  Future<void> _insertDebugData() async {
    final now = DateTime.now();
    final demos =
        <
          ({
            String id,
            int type,
            int delivery,
            bool prepaid,
            String partner,
            String offer,
            String wanted,
            String? offerImageId,
            String? wantedImageId,
            DateTime? exchangeDateTime,
            String memo,
            List<int> stages,
          })
        >[];

    void add({
      required int type,
      required String typeLabel,
      required int delivery,
      required String deliveryLabel,
      required bool prepaid,
      required List<List<int>> patterns,
    }) {
      final paymentLabel = prepaid ? '先払い' : '後払い';
      for (final (index, stages) in patterns.indexed) {
        for (final hasExchangeDateTime in [false, true]) {
          final number = demos.length + 1;
          final imageId = 'debug-image-${(number - 1) % 3 + 1}';
          final (offer, wanted, offerImageId, wantedImageId) = switch (type) {
            1 => ('交換アイテム$number', '希望アイテム$number', imageId, imageId),
            2 => ('譲渡アイテム$number', '', imageId, null),
            3 => ('', '買取希望アイテム$number', null, imageId),
            _ => throw ArgumentError.value(type, 'type'),
          };
          demos.add((
            id:
                'demo-$type-$delivery-${prepaid ? 1 : 0}-${index + 1}'
                '${hasExchangeDateTime ? '-datetime' : ''}',
            type: type,
            delivery: delivery,
            prepaid: prepaid,
            partner: 'partner${(number - 1) % 3 + 1}',
            offer: offer,
            wanted: wanted,
            offerImageId: offerImageId,
            wantedImageId: wantedImageId,
            exchangeDateTime: hasExchangeDateTime
                ? now.add(Duration(days: number))
                : null,
            memo:
                '$typeLabel・$deliveryLabel・$paymentLabel・'
                '${hasExchangeDateTime ? '日時あり' : '日時なし'}・進捗${index + 1}',
            stages: stages,
          ));
        }
      }
    }

    const handoff = <List<int>>[
      [],
      [1],
      [1, 7],
    ];
    const exchangeShipping = <List<int>>[
      [],
      [1],
      [1, 5],
      [1, 5, 6],
      [1, 5, 6, 7],
    ];
    const transferPostpaid = <List<int>>[
      [],
      [1],
      [1, 5],
      [1, 5, 3],
      [1, 5, 3, 7],
    ];
    const transferPrepaid = <List<int>>[
      [],
      [1],
      [1, 3],
      [1, 3, 5],
      [1, 3, 5, 7],
    ];
    const purchasePostpaid = <List<int>>[
      [],
      [1],
      [1, 6],
      [1, 6, 4],
      [1, 6, 4, 7],
    ];
    const purchasePrepaid = <List<int>>[
      [],
      [1],
      [1, 4],
      [1, 4, 6],
      [1, 4, 6, 7],
    ];

    for (final prepaid in [false, true]) {
      add(
        type: 1,
        typeLabel: '交換',
        delivery: 1,
        deliveryLabel: '手渡し',
        prepaid: prepaid,
        patterns: handoff,
      );
      add(
        type: 1,
        typeLabel: '交換',
        delivery: 2,
        deliveryLabel: '郵送',
        prepaid: prepaid,
        patterns: exchangeShipping,
      );
      add(
        type: 2,
        typeLabel: '譲渡',
        delivery: 1,
        deliveryLabel: '手渡し',
        prepaid: prepaid,
        patterns: handoff,
      );
      add(
        type: 2,
        typeLabel: '譲渡',
        delivery: 2,
        deliveryLabel: '郵送',
        prepaid: prepaid,
        patterns: prepaid ? transferPrepaid : transferPostpaid,
      );
      add(
        type: 3,
        typeLabel: '買取',
        delivery: 1,
        deliveryLabel: '手渡し',
        prepaid: prepaid,
        patterns: handoff,
      );
      add(
        type: 3,
        typeLabel: '買取',
        delivery: 2,
        deliveryLabel: '郵送',
        prepaid: prepaid,
        patterns: prepaid ? purchasePrepaid : purchasePostpaid,
      );
    }

    List<TradeStageHistoriesCompanion> histories(
      String tradeId,
      List<int> stages,
    ) => [
      for (final (index, stage) in stages.indexed)
        TradeStageHistoriesCompanion.insert(
          tradeId: tradeId,
          stageCode: stage,
          createdAt: now.add(Duration(minutes: index)),
        ),
    ];

    await batch((batch) {
      batch.insertAll(partners, [
        PartnersCompanion.insert(
          partnerId: 'partner1',
          userId: 'user_1',
          username: 'ユーザー1',
        ),
        PartnersCompanion.insert(
          partnerId: 'partner2',
          userId: 'user_2',
          username: 'ユーザー2',
        ),
        PartnersCompanion.insert(
          partnerId: 'partner3',
          userId: 'user_3',
          username: 'ユーザー3',
        ),
      ], mode: InsertMode.insertOrReplace);
      batch.insertAll(storedImages, [
        StoredImagesCompanion.insert(
          imageId: 'debug-image-1',
          bytes: base64Decode(
            'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR4nGN4HxzwHwAGWQKSQ9/igQAAAABJRU5ErkJggg==',
          ),
          mimeType: 'image/png',
          createdAt: now,
        ),
        StoredImagesCompanion.insert(
          imageId: 'debug-image-2',
          bytes: base64Decode(
            'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR4nGNwWvr1PwAF5QLcm7MmRwAAAABJRU5ErkJggg==',
          ),
          mimeType: 'image/png',
          createdAt: now,
        ),
        StoredImagesCompanion.insert(
          imageId: 'debug-image-3',
          bytes: base64Decode(
            'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR4nGNI2531HwAFoQKLzqe9WAAAAABJRU5ErkJggg==',
          ),
          mimeType: 'image/png',
          createdAt: now,
        ),
      ], mode: InsertMode.insertOrReplace);
      batch.insertAll(
        trades,
        demos.map(
          (demo) => TradesCompanion.insert(
            tradeId: demo.id,
            tradeTypeId: demo.type,
            deliveryTypeId: demo.delivery,
            partnerId: demo.partner,
            offerItem: demo.offer,
            wantedItem: demo.wanted,
            offerItemImageId: Value(demo.offerImageId),
            wantedItemImageId: Value(demo.wantedImageId),
            exchangeDateTime: Value(demo.exchangeDateTime),
            isPrepaid: demo.prepaid,
            memo: Value(demo.memo),
          ),
        ),
        mode: InsertMode.insertOrReplace,
      );
      batch.insertAll(tradeStageHistories, [
        for (final demo in demos) ...histories(demo.id, demo.stages),
      ], mode: InsertMode.insertOrReplace);
    });
  }
}
