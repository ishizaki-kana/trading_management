// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $TradesTable extends Trades with TableInfo<$TradesTable, Trade> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TradesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _tradeIdMeta = const VerificationMeta(
    'tradeId',
  );
  @override
  late final GeneratedColumn<String> tradeId = GeneratedColumn<String>(
    'trade_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tradeTypeIdMeta = const VerificationMeta(
    'tradeTypeId',
  );
  @override
  late final GeneratedColumn<int> tradeTypeId = GeneratedColumn<int>(
    'trade_type_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deliveryTypeIdMeta = const VerificationMeta(
    'deliveryTypeId',
  );
  @override
  late final GeneratedColumn<int> deliveryTypeId = GeneratedColumn<int>(
    'delivery_type_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _partnerIdMeta = const VerificationMeta(
    'partnerId',
  );
  @override
  late final GeneratedColumn<String> partnerId = GeneratedColumn<String>(
    'partner_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _offerItemMeta = const VerificationMeta(
    'offerItem',
  );
  @override
  late final GeneratedColumn<String> offerItem = GeneratedColumn<String>(
    'offer_item',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _wantedItemMeta = const VerificationMeta(
    'wantedItem',
  );
  @override
  late final GeneratedColumn<String> wantedItem = GeneratedColumn<String>(
    'wanted_item',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _offerItemImageIdMeta = const VerificationMeta(
    'offerItemImageId',
  );
  @override
  late final GeneratedColumn<String> offerItemImageId = GeneratedColumn<String>(
    'offer_item_image_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _wantedItemImageIdMeta = const VerificationMeta(
    'wantedItemImageId',
  );
  @override
  late final GeneratedColumn<String> wantedItemImageId =
      GeneratedColumn<String>(
        'wanted_item_image_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _exchangeDateTimeMeta = const VerificationMeta(
    'exchangeDateTime',
  );
  @override
  late final GeneratedColumn<DateTime> exchangeDateTime =
      GeneratedColumn<DateTime>(
        'exchange_date_time',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _isPrepaidMeta = const VerificationMeta(
    'isPrepaid',
  );
  @override
  late final GeneratedColumn<bool> isPrepaid = GeneratedColumn<bool>(
    'is_prepaid',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_prepaid" IN (0, 1))',
    ),
  );
  static const VerificationMeta _memoMeta = const VerificationMeta('memo');
  @override
  late final GeneratedColumn<String> memo = GeneratedColumn<String>(
    'memo',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    tradeId,
    tradeTypeId,
    deliveryTypeId,
    partnerId,
    offerItem,
    wantedItem,
    offerItemImageId,
    wantedItemImageId,
    exchangeDateTime,
    isPrepaid,
    memo,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'trades';
  @override
  VerificationContext validateIntegrity(
    Insertable<Trade> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('trade_id')) {
      context.handle(
        _tradeIdMeta,
        tradeId.isAcceptableOrUnknown(data['trade_id']!, _tradeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_tradeIdMeta);
    }
    if (data.containsKey('trade_type_id')) {
      context.handle(
        _tradeTypeIdMeta,
        tradeTypeId.isAcceptableOrUnknown(
          data['trade_type_id']!,
          _tradeTypeIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_tradeTypeIdMeta);
    }
    if (data.containsKey('delivery_type_id')) {
      context.handle(
        _deliveryTypeIdMeta,
        deliveryTypeId.isAcceptableOrUnknown(
          data['delivery_type_id']!,
          _deliveryTypeIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_deliveryTypeIdMeta);
    }
    if (data.containsKey('partner_id')) {
      context.handle(
        _partnerIdMeta,
        partnerId.isAcceptableOrUnknown(data['partner_id']!, _partnerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_partnerIdMeta);
    }
    if (data.containsKey('offer_item')) {
      context.handle(
        _offerItemMeta,
        offerItem.isAcceptableOrUnknown(data['offer_item']!, _offerItemMeta),
      );
    } else if (isInserting) {
      context.missing(_offerItemMeta);
    }
    if (data.containsKey('wanted_item')) {
      context.handle(
        _wantedItemMeta,
        wantedItem.isAcceptableOrUnknown(data['wanted_item']!, _wantedItemMeta),
      );
    } else if (isInserting) {
      context.missing(_wantedItemMeta);
    }
    if (data.containsKey('offer_item_image_id')) {
      context.handle(
        _offerItemImageIdMeta,
        offerItemImageId.isAcceptableOrUnknown(
          data['offer_item_image_id']!,
          _offerItemImageIdMeta,
        ),
      );
    }
    if (data.containsKey('wanted_item_image_id')) {
      context.handle(
        _wantedItemImageIdMeta,
        wantedItemImageId.isAcceptableOrUnknown(
          data['wanted_item_image_id']!,
          _wantedItemImageIdMeta,
        ),
      );
    }
    if (data.containsKey('exchange_date_time')) {
      context.handle(
        _exchangeDateTimeMeta,
        exchangeDateTime.isAcceptableOrUnknown(
          data['exchange_date_time']!,
          _exchangeDateTimeMeta,
        ),
      );
    }
    if (data.containsKey('is_prepaid')) {
      context.handle(
        _isPrepaidMeta,
        isPrepaid.isAcceptableOrUnknown(data['is_prepaid']!, _isPrepaidMeta),
      );
    } else if (isInserting) {
      context.missing(_isPrepaidMeta);
    }
    if (data.containsKey('memo')) {
      context.handle(
        _memoMeta,
        memo.isAcceptableOrUnknown(data['memo']!, _memoMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {tradeId};
  @override
  Trade map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Trade(
      tradeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}trade_id'],
      )!,
      tradeTypeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}trade_type_id'],
      )!,
      deliveryTypeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}delivery_type_id'],
      )!,
      partnerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}partner_id'],
      )!,
      offerItem: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}offer_item'],
      )!,
      wantedItem: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}wanted_item'],
      )!,
      offerItemImageId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}offer_item_image_id'],
      ),
      wantedItemImageId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}wanted_item_image_id'],
      ),
      exchangeDateTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}exchange_date_time'],
      ),
      isPrepaid: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_prepaid'],
      )!,
      memo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}memo'],
      ),
    );
  }

  @override
  $TradesTable createAlias(String alias) {
    return $TradesTable(attachedDatabase, alias);
  }
}

class Trade extends DataClass implements Insertable<Trade> {
  /// 取引ID
  final String tradeId;

  /// 取引種別ID
  final int tradeTypeId;

  /// 受渡種別ID
  final int deliveryTypeId;

  /// 取引相手ID
  final String partnerId;

  /// 譲渡するアイテム名
  final String offerItem;

  /// 受け取りたいアイテム名
  final String wantedItem;

  /// 譲渡するアイテムの画像URL
  final String? offerItemImageId;

  /// 受け取りたいアイテムの画像URL
  final String? wantedItemImageId;

  /// 交換日時
  final DateTime? exchangeDateTime;

  /// 先払いかどうか
  final bool isPrepaid;

  /// メモ
  final String? memo;
  const Trade({
    required this.tradeId,
    required this.tradeTypeId,
    required this.deliveryTypeId,
    required this.partnerId,
    required this.offerItem,
    required this.wantedItem,
    this.offerItemImageId,
    this.wantedItemImageId,
    this.exchangeDateTime,
    required this.isPrepaid,
    this.memo,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['trade_id'] = Variable<String>(tradeId);
    map['trade_type_id'] = Variable<int>(tradeTypeId);
    map['delivery_type_id'] = Variable<int>(deliveryTypeId);
    map['partner_id'] = Variable<String>(partnerId);
    map['offer_item'] = Variable<String>(offerItem);
    map['wanted_item'] = Variable<String>(wantedItem);
    if (!nullToAbsent || offerItemImageId != null) {
      map['offer_item_image_id'] = Variable<String>(offerItemImageId);
    }
    if (!nullToAbsent || wantedItemImageId != null) {
      map['wanted_item_image_id'] = Variable<String>(wantedItemImageId);
    }
    if (!nullToAbsent || exchangeDateTime != null) {
      map['exchange_date_time'] = Variable<DateTime>(exchangeDateTime);
    }
    map['is_prepaid'] = Variable<bool>(isPrepaid);
    if (!nullToAbsent || memo != null) {
      map['memo'] = Variable<String>(memo);
    }
    return map;
  }

  TradesCompanion toCompanion(bool nullToAbsent) {
    return TradesCompanion(
      tradeId: Value(tradeId),
      tradeTypeId: Value(tradeTypeId),
      deliveryTypeId: Value(deliveryTypeId),
      partnerId: Value(partnerId),
      offerItem: Value(offerItem),
      wantedItem: Value(wantedItem),
      offerItemImageId: offerItemImageId == null && nullToAbsent
          ? const Value.absent()
          : Value(offerItemImageId),
      wantedItemImageId: wantedItemImageId == null && nullToAbsent
          ? const Value.absent()
          : Value(wantedItemImageId),
      exchangeDateTime: exchangeDateTime == null && nullToAbsent
          ? const Value.absent()
          : Value(exchangeDateTime),
      isPrepaid: Value(isPrepaid),
      memo: memo == null && nullToAbsent ? const Value.absent() : Value(memo),
    );
  }

  factory Trade.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Trade(
      tradeId: serializer.fromJson<String>(json['tradeId']),
      tradeTypeId: serializer.fromJson<int>(json['tradeTypeId']),
      deliveryTypeId: serializer.fromJson<int>(json['deliveryTypeId']),
      partnerId: serializer.fromJson<String>(json['partnerId']),
      offerItem: serializer.fromJson<String>(json['offerItem']),
      wantedItem: serializer.fromJson<String>(json['wantedItem']),
      offerItemImageId: serializer.fromJson<String?>(json['offerItemImageId']),
      wantedItemImageId: serializer.fromJson<String?>(
        json['wantedItemImageId'],
      ),
      exchangeDateTime: serializer.fromJson<DateTime?>(
        json['exchangeDateTime'],
      ),
      isPrepaid: serializer.fromJson<bool>(json['isPrepaid']),
      memo: serializer.fromJson<String?>(json['memo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'tradeId': serializer.toJson<String>(tradeId),
      'tradeTypeId': serializer.toJson<int>(tradeTypeId),
      'deliveryTypeId': serializer.toJson<int>(deliveryTypeId),
      'partnerId': serializer.toJson<String>(partnerId),
      'offerItem': serializer.toJson<String>(offerItem),
      'wantedItem': serializer.toJson<String>(wantedItem),
      'offerItemImageId': serializer.toJson<String?>(offerItemImageId),
      'wantedItemImageId': serializer.toJson<String?>(wantedItemImageId),
      'exchangeDateTime': serializer.toJson<DateTime?>(exchangeDateTime),
      'isPrepaid': serializer.toJson<bool>(isPrepaid),
      'memo': serializer.toJson<String?>(memo),
    };
  }

  Trade copyWith({
    String? tradeId,
    int? tradeTypeId,
    int? deliveryTypeId,
    String? partnerId,
    String? offerItem,
    String? wantedItem,
    Value<String?> offerItemImageId = const Value.absent(),
    Value<String?> wantedItemImageId = const Value.absent(),
    Value<DateTime?> exchangeDateTime = const Value.absent(),
    bool? isPrepaid,
    Value<String?> memo = const Value.absent(),
  }) => Trade(
    tradeId: tradeId ?? this.tradeId,
    tradeTypeId: tradeTypeId ?? this.tradeTypeId,
    deliveryTypeId: deliveryTypeId ?? this.deliveryTypeId,
    partnerId: partnerId ?? this.partnerId,
    offerItem: offerItem ?? this.offerItem,
    wantedItem: wantedItem ?? this.wantedItem,
    offerItemImageId: offerItemImageId.present
        ? offerItemImageId.value
        : this.offerItemImageId,
    wantedItemImageId: wantedItemImageId.present
        ? wantedItemImageId.value
        : this.wantedItemImageId,
    exchangeDateTime: exchangeDateTime.present
        ? exchangeDateTime.value
        : this.exchangeDateTime,
    isPrepaid: isPrepaid ?? this.isPrepaid,
    memo: memo.present ? memo.value : this.memo,
  );
  Trade copyWithCompanion(TradesCompanion data) {
    return Trade(
      tradeId: data.tradeId.present ? data.tradeId.value : this.tradeId,
      tradeTypeId: data.tradeTypeId.present
          ? data.tradeTypeId.value
          : this.tradeTypeId,
      deliveryTypeId: data.deliveryTypeId.present
          ? data.deliveryTypeId.value
          : this.deliveryTypeId,
      partnerId: data.partnerId.present ? data.partnerId.value : this.partnerId,
      offerItem: data.offerItem.present ? data.offerItem.value : this.offerItem,
      wantedItem: data.wantedItem.present
          ? data.wantedItem.value
          : this.wantedItem,
      offerItemImageId: data.offerItemImageId.present
          ? data.offerItemImageId.value
          : this.offerItemImageId,
      wantedItemImageId: data.wantedItemImageId.present
          ? data.wantedItemImageId.value
          : this.wantedItemImageId,
      exchangeDateTime: data.exchangeDateTime.present
          ? data.exchangeDateTime.value
          : this.exchangeDateTime,
      isPrepaid: data.isPrepaid.present ? data.isPrepaid.value : this.isPrepaid,
      memo: data.memo.present ? data.memo.value : this.memo,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Trade(')
          ..write('tradeId: $tradeId, ')
          ..write('tradeTypeId: $tradeTypeId, ')
          ..write('deliveryTypeId: $deliveryTypeId, ')
          ..write('partnerId: $partnerId, ')
          ..write('offerItem: $offerItem, ')
          ..write('wantedItem: $wantedItem, ')
          ..write('offerItemImageId: $offerItemImageId, ')
          ..write('wantedItemImageId: $wantedItemImageId, ')
          ..write('exchangeDateTime: $exchangeDateTime, ')
          ..write('isPrepaid: $isPrepaid, ')
          ..write('memo: $memo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    tradeId,
    tradeTypeId,
    deliveryTypeId,
    partnerId,
    offerItem,
    wantedItem,
    offerItemImageId,
    wantedItemImageId,
    exchangeDateTime,
    isPrepaid,
    memo,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Trade &&
          other.tradeId == this.tradeId &&
          other.tradeTypeId == this.tradeTypeId &&
          other.deliveryTypeId == this.deliveryTypeId &&
          other.partnerId == this.partnerId &&
          other.offerItem == this.offerItem &&
          other.wantedItem == this.wantedItem &&
          other.offerItemImageId == this.offerItemImageId &&
          other.wantedItemImageId == this.wantedItemImageId &&
          other.exchangeDateTime == this.exchangeDateTime &&
          other.isPrepaid == this.isPrepaid &&
          other.memo == this.memo);
}

class TradesCompanion extends UpdateCompanion<Trade> {
  final Value<String> tradeId;
  final Value<int> tradeTypeId;
  final Value<int> deliveryTypeId;
  final Value<String> partnerId;
  final Value<String> offerItem;
  final Value<String> wantedItem;
  final Value<String?> offerItemImageId;
  final Value<String?> wantedItemImageId;
  final Value<DateTime?> exchangeDateTime;
  final Value<bool> isPrepaid;
  final Value<String?> memo;
  final Value<int> rowid;
  const TradesCompanion({
    this.tradeId = const Value.absent(),
    this.tradeTypeId = const Value.absent(),
    this.deliveryTypeId = const Value.absent(),
    this.partnerId = const Value.absent(),
    this.offerItem = const Value.absent(),
    this.wantedItem = const Value.absent(),
    this.offerItemImageId = const Value.absent(),
    this.wantedItemImageId = const Value.absent(),
    this.exchangeDateTime = const Value.absent(),
    this.isPrepaid = const Value.absent(),
    this.memo = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TradesCompanion.insert({
    required String tradeId,
    required int tradeTypeId,
    required int deliveryTypeId,
    required String partnerId,
    required String offerItem,
    required String wantedItem,
    this.offerItemImageId = const Value.absent(),
    this.wantedItemImageId = const Value.absent(),
    this.exchangeDateTime = const Value.absent(),
    required bool isPrepaid,
    this.memo = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : tradeId = Value(tradeId),
       tradeTypeId = Value(tradeTypeId),
       deliveryTypeId = Value(deliveryTypeId),
       partnerId = Value(partnerId),
       offerItem = Value(offerItem),
       wantedItem = Value(wantedItem),
       isPrepaid = Value(isPrepaid);
  static Insertable<Trade> custom({
    Expression<String>? tradeId,
    Expression<int>? tradeTypeId,
    Expression<int>? deliveryTypeId,
    Expression<String>? partnerId,
    Expression<String>? offerItem,
    Expression<String>? wantedItem,
    Expression<String>? offerItemImageId,
    Expression<String>? wantedItemImageId,
    Expression<DateTime>? exchangeDateTime,
    Expression<bool>? isPrepaid,
    Expression<String>? memo,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (tradeId != null) 'trade_id': tradeId,
      if (tradeTypeId != null) 'trade_type_id': tradeTypeId,
      if (deliveryTypeId != null) 'delivery_type_id': deliveryTypeId,
      if (partnerId != null) 'partner_id': partnerId,
      if (offerItem != null) 'offer_item': offerItem,
      if (wantedItem != null) 'wanted_item': wantedItem,
      if (offerItemImageId != null) 'offer_item_image_id': offerItemImageId,
      if (wantedItemImageId != null) 'wanted_item_image_id': wantedItemImageId,
      if (exchangeDateTime != null) 'exchange_date_time': exchangeDateTime,
      if (isPrepaid != null) 'is_prepaid': isPrepaid,
      if (memo != null) 'memo': memo,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TradesCompanion copyWith({
    Value<String>? tradeId,
    Value<int>? tradeTypeId,
    Value<int>? deliveryTypeId,
    Value<String>? partnerId,
    Value<String>? offerItem,
    Value<String>? wantedItem,
    Value<String?>? offerItemImageId,
    Value<String?>? wantedItemImageId,
    Value<DateTime?>? exchangeDateTime,
    Value<bool>? isPrepaid,
    Value<String?>? memo,
    Value<int>? rowid,
  }) {
    return TradesCompanion(
      tradeId: tradeId ?? this.tradeId,
      tradeTypeId: tradeTypeId ?? this.tradeTypeId,
      deliveryTypeId: deliveryTypeId ?? this.deliveryTypeId,
      partnerId: partnerId ?? this.partnerId,
      offerItem: offerItem ?? this.offerItem,
      wantedItem: wantedItem ?? this.wantedItem,
      offerItemImageId: offerItemImageId ?? this.offerItemImageId,
      wantedItemImageId: wantedItemImageId ?? this.wantedItemImageId,
      exchangeDateTime: exchangeDateTime ?? this.exchangeDateTime,
      isPrepaid: isPrepaid ?? this.isPrepaid,
      memo: memo ?? this.memo,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (tradeId.present) {
      map['trade_id'] = Variable<String>(tradeId.value);
    }
    if (tradeTypeId.present) {
      map['trade_type_id'] = Variable<int>(tradeTypeId.value);
    }
    if (deliveryTypeId.present) {
      map['delivery_type_id'] = Variable<int>(deliveryTypeId.value);
    }
    if (partnerId.present) {
      map['partner_id'] = Variable<String>(partnerId.value);
    }
    if (offerItem.present) {
      map['offer_item'] = Variable<String>(offerItem.value);
    }
    if (wantedItem.present) {
      map['wanted_item'] = Variable<String>(wantedItem.value);
    }
    if (offerItemImageId.present) {
      map['offer_item_image_id'] = Variable<String>(offerItemImageId.value);
    }
    if (wantedItemImageId.present) {
      map['wanted_item_image_id'] = Variable<String>(wantedItemImageId.value);
    }
    if (exchangeDateTime.present) {
      map['exchange_date_time'] = Variable<DateTime>(exchangeDateTime.value);
    }
    if (isPrepaid.present) {
      map['is_prepaid'] = Variable<bool>(isPrepaid.value);
    }
    if (memo.present) {
      map['memo'] = Variable<String>(memo.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TradesCompanion(')
          ..write('tradeId: $tradeId, ')
          ..write('tradeTypeId: $tradeTypeId, ')
          ..write('deliveryTypeId: $deliveryTypeId, ')
          ..write('partnerId: $partnerId, ')
          ..write('offerItem: $offerItem, ')
          ..write('wantedItem: $wantedItem, ')
          ..write('offerItemImageId: $offerItemImageId, ')
          ..write('wantedItemImageId: $wantedItemImageId, ')
          ..write('exchangeDateTime: $exchangeDateTime, ')
          ..write('isPrepaid: $isPrepaid, ')
          ..write('memo: $memo, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TradeStageHistoriesTable extends TradeStageHistories
    with TableInfo<$TradeStageHistoriesTable, TradeStageHistory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TradeStageHistoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _tradeIdMeta = const VerificationMeta(
    'tradeId',
  );
  @override
  late final GeneratedColumn<String> tradeId = GeneratedColumn<String>(
    'trade_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES trades (trade_id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _stageCodeMeta = const VerificationMeta(
    'stageCode',
  );
  @override
  late final GeneratedColumn<int> stageCode = GeneratedColumn<int>(
    'stage_code',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [tradeId, stageCode, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'trade_stage_histories';
  @override
  VerificationContext validateIntegrity(
    Insertable<TradeStageHistory> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('trade_id')) {
      context.handle(
        _tradeIdMeta,
        tradeId.isAcceptableOrUnknown(data['trade_id']!, _tradeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_tradeIdMeta);
    }
    if (data.containsKey('stage_code')) {
      context.handle(
        _stageCodeMeta,
        stageCode.isAcceptableOrUnknown(data['stage_code']!, _stageCodeMeta),
      );
    } else if (isInserting) {
      context.missing(_stageCodeMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {tradeId, stageCode};
  @override
  TradeStageHistory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TradeStageHistory(
      tradeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}trade_id'],
      )!,
      stageCode: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stage_code'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $TradeStageHistoriesTable createAlias(String alias) {
    return $TradeStageHistoriesTable(attachedDatabase, alias);
  }
}

class TradeStageHistory extends DataClass
    implements Insertable<TradeStageHistory> {
  /// 取引ID
  final String tradeId;

  /// 取引ステージコード
  final int stageCode;

  /// 作成日時
  final DateTime createdAt;
  const TradeStageHistory({
    required this.tradeId,
    required this.stageCode,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['trade_id'] = Variable<String>(tradeId);
    map['stage_code'] = Variable<int>(stageCode);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  TradeStageHistoriesCompanion toCompanion(bool nullToAbsent) {
    return TradeStageHistoriesCompanion(
      tradeId: Value(tradeId),
      stageCode: Value(stageCode),
      createdAt: Value(createdAt),
    );
  }

  factory TradeStageHistory.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TradeStageHistory(
      tradeId: serializer.fromJson<String>(json['tradeId']),
      stageCode: serializer.fromJson<int>(json['stageCode']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'tradeId': serializer.toJson<String>(tradeId),
      'stageCode': serializer.toJson<int>(stageCode),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  TradeStageHistory copyWith({
    String? tradeId,
    int? stageCode,
    DateTime? createdAt,
  }) => TradeStageHistory(
    tradeId: tradeId ?? this.tradeId,
    stageCode: stageCode ?? this.stageCode,
    createdAt: createdAt ?? this.createdAt,
  );
  TradeStageHistory copyWithCompanion(TradeStageHistoriesCompanion data) {
    return TradeStageHistory(
      tradeId: data.tradeId.present ? data.tradeId.value : this.tradeId,
      stageCode: data.stageCode.present ? data.stageCode.value : this.stageCode,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TradeStageHistory(')
          ..write('tradeId: $tradeId, ')
          ..write('stageCode: $stageCode, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(tradeId, stageCode, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TradeStageHistory &&
          other.tradeId == this.tradeId &&
          other.stageCode == this.stageCode &&
          other.createdAt == this.createdAt);
}

class TradeStageHistoriesCompanion extends UpdateCompanion<TradeStageHistory> {
  final Value<String> tradeId;
  final Value<int> stageCode;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const TradeStageHistoriesCompanion({
    this.tradeId = const Value.absent(),
    this.stageCode = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TradeStageHistoriesCompanion.insert({
    required String tradeId,
    required int stageCode,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : tradeId = Value(tradeId),
       stageCode = Value(stageCode),
       createdAt = Value(createdAt);
  static Insertable<TradeStageHistory> custom({
    Expression<String>? tradeId,
    Expression<int>? stageCode,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (tradeId != null) 'trade_id': tradeId,
      if (stageCode != null) 'stage_code': stageCode,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TradeStageHistoriesCompanion copyWith({
    Value<String>? tradeId,
    Value<int>? stageCode,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return TradeStageHistoriesCompanion(
      tradeId: tradeId ?? this.tradeId,
      stageCode: stageCode ?? this.stageCode,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (tradeId.present) {
      map['trade_id'] = Variable<String>(tradeId.value);
    }
    if (stageCode.present) {
      map['stage_code'] = Variable<int>(stageCode.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TradeStageHistoriesCompanion(')
          ..write('tradeId: $tradeId, ')
          ..write('stageCode: $stageCode, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PartnersTable extends Partners with TableInfo<$PartnersTable, Partner> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PartnersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _partnerIdMeta = const VerificationMeta(
    'partnerId',
  );
  @override
  late final GeneratedColumn<String> partnerId = GeneratedColumn<String>(
    'partner_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _usernameMeta = const VerificationMeta(
    'username',
  );
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
    'username',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [partnerId, userId, username];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'partners';
  @override
  VerificationContext validateIntegrity(
    Insertable<Partner> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('partner_id')) {
      context.handle(
        _partnerIdMeta,
        partnerId.isAcceptableOrUnknown(data['partner_id']!, _partnerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_partnerIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('username')) {
      context.handle(
        _usernameMeta,
        username.isAcceptableOrUnknown(data['username']!, _usernameMeta),
      );
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {partnerId, userId, username};
  @override
  Partner map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Partner(
      partnerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}partner_id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      username: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}username'],
      )!,
    );
  }

  @override
  $PartnersTable createAlias(String alias) {
    return $PartnersTable(attachedDatabase, alias);
  }
}

class Partner extends DataClass implements Insertable<Partner> {
  /// 取引相手ID
  final String partnerId;

  /// ユーザーID
  final String userId;

  /// ユーザー名
  final String username;
  const Partner({
    required this.partnerId,
    required this.userId,
    required this.username,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['partner_id'] = Variable<String>(partnerId);
    map['user_id'] = Variable<String>(userId);
    map['username'] = Variable<String>(username);
    return map;
  }

  PartnersCompanion toCompanion(bool nullToAbsent) {
    return PartnersCompanion(
      partnerId: Value(partnerId),
      userId: Value(userId),
      username: Value(username),
    );
  }

  factory Partner.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Partner(
      partnerId: serializer.fromJson<String>(json['partnerId']),
      userId: serializer.fromJson<String>(json['userId']),
      username: serializer.fromJson<String>(json['username']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'partnerId': serializer.toJson<String>(partnerId),
      'userId': serializer.toJson<String>(userId),
      'username': serializer.toJson<String>(username),
    };
  }

  Partner copyWith({String? partnerId, String? userId, String? username}) =>
      Partner(
        partnerId: partnerId ?? this.partnerId,
        userId: userId ?? this.userId,
        username: username ?? this.username,
      );
  Partner copyWithCompanion(PartnersCompanion data) {
    return Partner(
      partnerId: data.partnerId.present ? data.partnerId.value : this.partnerId,
      userId: data.userId.present ? data.userId.value : this.userId,
      username: data.username.present ? data.username.value : this.username,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Partner(')
          ..write('partnerId: $partnerId, ')
          ..write('userId: $userId, ')
          ..write('username: $username')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(partnerId, userId, username);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Partner &&
          other.partnerId == this.partnerId &&
          other.userId == this.userId &&
          other.username == this.username);
}

class PartnersCompanion extends UpdateCompanion<Partner> {
  final Value<String> partnerId;
  final Value<String> userId;
  final Value<String> username;
  final Value<int> rowid;
  const PartnersCompanion({
    this.partnerId = const Value.absent(),
    this.userId = const Value.absent(),
    this.username = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PartnersCompanion.insert({
    required String partnerId,
    required String userId,
    required String username,
    this.rowid = const Value.absent(),
  }) : partnerId = Value(partnerId),
       userId = Value(userId),
       username = Value(username);
  static Insertable<Partner> custom({
    Expression<String>? partnerId,
    Expression<String>? userId,
    Expression<String>? username,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (partnerId != null) 'partner_id': partnerId,
      if (userId != null) 'user_id': userId,
      if (username != null) 'username': username,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PartnersCompanion copyWith({
    Value<String>? partnerId,
    Value<String>? userId,
    Value<String>? username,
    Value<int>? rowid,
  }) {
    return PartnersCompanion(
      partnerId: partnerId ?? this.partnerId,
      userId: userId ?? this.userId,
      username: username ?? this.username,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (partnerId.present) {
      map['partner_id'] = Variable<String>(partnerId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PartnersCompanion(')
          ..write('partnerId: $partnerId, ')
          ..write('userId: $userId, ')
          ..write('username: $username, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StoredImagesTable extends StoredImages
    with TableInfo<$StoredImagesTable, StoredImage> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StoredImagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _imageIdMeta = const VerificationMeta(
    'imageId',
  );
  @override
  late final GeneratedColumn<String> imageId = GeneratedColumn<String>(
    'image_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bytesMeta = const VerificationMeta('bytes');
  @override
  late final GeneratedColumn<Uint8List> bytes = GeneratedColumn<Uint8List>(
    'bytes',
    aliasedName,
    false,
    type: DriftSqlType.blob,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mimeTypeMeta = const VerificationMeta(
    'mimeType',
  );
  @override
  late final GeneratedColumn<String> mimeType = GeneratedColumn<String>(
    'mime_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [imageId, bytes, mimeType, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'stored_images';
  @override
  VerificationContext validateIntegrity(
    Insertable<StoredImage> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('image_id')) {
      context.handle(
        _imageIdMeta,
        imageId.isAcceptableOrUnknown(data['image_id']!, _imageIdMeta),
      );
    } else if (isInserting) {
      context.missing(_imageIdMeta);
    }
    if (data.containsKey('bytes')) {
      context.handle(
        _bytesMeta,
        bytes.isAcceptableOrUnknown(data['bytes']!, _bytesMeta),
      );
    } else if (isInserting) {
      context.missing(_bytesMeta);
    }
    if (data.containsKey('mime_type')) {
      context.handle(
        _mimeTypeMeta,
        mimeType.isAcceptableOrUnknown(data['mime_type']!, _mimeTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_mimeTypeMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {imageId};
  @override
  StoredImage map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StoredImage(
      imageId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_id'],
      )!,
      bytes: attachedDatabase.typeMapping.read(
        DriftSqlType.blob,
        data['${effectivePrefix}bytes'],
      )!,
      mimeType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mime_type'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $StoredImagesTable createAlias(String alias) {
    return $StoredImagesTable(attachedDatabase, alias);
  }
}

class StoredImage extends DataClass implements Insertable<StoredImage> {
  /// 画像ID
  final String imageId;

  /// 画像データ
  final Uint8List bytes;

  /// MIMEタイプ
  final String mimeType;

  /// 作成日時
  final DateTime createdAt;
  const StoredImage({
    required this.imageId,
    required this.bytes,
    required this.mimeType,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['image_id'] = Variable<String>(imageId);
    map['bytes'] = Variable<Uint8List>(bytes);
    map['mime_type'] = Variable<String>(mimeType);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  StoredImagesCompanion toCompanion(bool nullToAbsent) {
    return StoredImagesCompanion(
      imageId: Value(imageId),
      bytes: Value(bytes),
      mimeType: Value(mimeType),
      createdAt: Value(createdAt),
    );
  }

  factory StoredImage.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StoredImage(
      imageId: serializer.fromJson<String>(json['imageId']),
      bytes: serializer.fromJson<Uint8List>(json['bytes']),
      mimeType: serializer.fromJson<String>(json['mimeType']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'imageId': serializer.toJson<String>(imageId),
      'bytes': serializer.toJson<Uint8List>(bytes),
      'mimeType': serializer.toJson<String>(mimeType),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  StoredImage copyWith({
    String? imageId,
    Uint8List? bytes,
    String? mimeType,
    DateTime? createdAt,
  }) => StoredImage(
    imageId: imageId ?? this.imageId,
    bytes: bytes ?? this.bytes,
    mimeType: mimeType ?? this.mimeType,
    createdAt: createdAt ?? this.createdAt,
  );
  StoredImage copyWithCompanion(StoredImagesCompanion data) {
    return StoredImage(
      imageId: data.imageId.present ? data.imageId.value : this.imageId,
      bytes: data.bytes.present ? data.bytes.value : this.bytes,
      mimeType: data.mimeType.present ? data.mimeType.value : this.mimeType,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StoredImage(')
          ..write('imageId: $imageId, ')
          ..write('bytes: $bytes, ')
          ..write('mimeType: $mimeType, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(imageId, $driftBlobEquality.hash(bytes), mimeType, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StoredImage &&
          other.imageId == this.imageId &&
          $driftBlobEquality.equals(other.bytes, this.bytes) &&
          other.mimeType == this.mimeType &&
          other.createdAt == this.createdAt);
}

class StoredImagesCompanion extends UpdateCompanion<StoredImage> {
  final Value<String> imageId;
  final Value<Uint8List> bytes;
  final Value<String> mimeType;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const StoredImagesCompanion({
    this.imageId = const Value.absent(),
    this.bytes = const Value.absent(),
    this.mimeType = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StoredImagesCompanion.insert({
    required String imageId,
    required Uint8List bytes,
    required String mimeType,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : imageId = Value(imageId),
       bytes = Value(bytes),
       mimeType = Value(mimeType),
       createdAt = Value(createdAt);
  static Insertable<StoredImage> custom({
    Expression<String>? imageId,
    Expression<Uint8List>? bytes,
    Expression<String>? mimeType,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (imageId != null) 'image_id': imageId,
      if (bytes != null) 'bytes': bytes,
      if (mimeType != null) 'mime_type': mimeType,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StoredImagesCompanion copyWith({
    Value<String>? imageId,
    Value<Uint8List>? bytes,
    Value<String>? mimeType,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return StoredImagesCompanion(
      imageId: imageId ?? this.imageId,
      bytes: bytes ?? this.bytes,
      mimeType: mimeType ?? this.mimeType,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (imageId.present) {
      map['image_id'] = Variable<String>(imageId.value);
    }
    if (bytes.present) {
      map['bytes'] = Variable<Uint8List>(bytes.value);
    }
    if (mimeType.present) {
      map['mime_type'] = Variable<String>(mimeType.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StoredImagesCompanion(')
          ..write('imageId: $imageId, ')
          ..write('bytes: $bytes, ')
          ..write('mimeType: $mimeType, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TradesTable trades = $TradesTable(this);
  late final $TradeStageHistoriesTable tradeStageHistories =
      $TradeStageHistoriesTable(this);
  late final $PartnersTable partners = $PartnersTable(this);
  late final $StoredImagesTable storedImages = $StoredImagesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    trades,
    tradeStageHistories,
    partners,
    storedImages,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'trades',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('trade_stage_histories', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$TradesTableCreateCompanionBuilder =
    TradesCompanion Function({
      required String tradeId,
      required int tradeTypeId,
      required int deliveryTypeId,
      required String partnerId,
      required String offerItem,
      required String wantedItem,
      Value<String?> offerItemImageId,
      Value<String?> wantedItemImageId,
      Value<DateTime?> exchangeDateTime,
      required bool isPrepaid,
      Value<String?> memo,
      Value<int> rowid,
    });
typedef $$TradesTableUpdateCompanionBuilder =
    TradesCompanion Function({
      Value<String> tradeId,
      Value<int> tradeTypeId,
      Value<int> deliveryTypeId,
      Value<String> partnerId,
      Value<String> offerItem,
      Value<String> wantedItem,
      Value<String?> offerItemImageId,
      Value<String?> wantedItemImageId,
      Value<DateTime?> exchangeDateTime,
      Value<bool> isPrepaid,
      Value<String?> memo,
      Value<int> rowid,
    });

final class $$TradesTableReferences
    extends BaseReferences<_$AppDatabase, $TradesTable, Trade> {
  $$TradesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TradeStageHistoriesTable, List<TradeStageHistory>>
  _tradeStageHistoriesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.tradeStageHistories,
        aliasName: 'trades__trade_id__trade_stage_histories__trade_id',
      );

  $$TradeStageHistoriesTableProcessedTableManager get tradeStageHistoriesRefs {
    final manager =
        $$TradeStageHistoriesTableTableManager(
          $_db,
          $_db.tradeStageHistories,
        ).filter(
          (f) => f.tradeId.tradeId.sqlEquals($_itemColumn<String>('trade_id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _tradeStageHistoriesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TradesTableFilterComposer
    extends Composer<_$AppDatabase, $TradesTable> {
  $$TradesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get tradeId => $composableBuilder(
    column: $table.tradeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get tradeTypeId => $composableBuilder(
    column: $table.tradeTypeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get deliveryTypeId => $composableBuilder(
    column: $table.deliveryTypeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get partnerId => $composableBuilder(
    column: $table.partnerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get offerItem => $composableBuilder(
    column: $table.offerItem,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get wantedItem => $composableBuilder(
    column: $table.wantedItem,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get offerItemImageId => $composableBuilder(
    column: $table.offerItemImageId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get wantedItemImageId => $composableBuilder(
    column: $table.wantedItemImageId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get exchangeDateTime => $composableBuilder(
    column: $table.exchangeDateTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isPrepaid => $composableBuilder(
    column: $table.isPrepaid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get memo => $composableBuilder(
    column: $table.memo,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> tradeStageHistoriesRefs(
    Expression<bool> Function($$TradeStageHistoriesTableFilterComposer f) f,
  ) {
    final $$TradeStageHistoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tradeId,
      referencedTable: $db.tradeStageHistories,
      getReferencedColumn: (t) => t.tradeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TradeStageHistoriesTableFilterComposer(
            $db: $db,
            $table: $db.tradeStageHistories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TradesTableOrderingComposer
    extends Composer<_$AppDatabase, $TradesTable> {
  $$TradesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get tradeId => $composableBuilder(
    column: $table.tradeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get tradeTypeId => $composableBuilder(
    column: $table.tradeTypeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get deliveryTypeId => $composableBuilder(
    column: $table.deliveryTypeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get partnerId => $composableBuilder(
    column: $table.partnerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get offerItem => $composableBuilder(
    column: $table.offerItem,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get wantedItem => $composableBuilder(
    column: $table.wantedItem,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get offerItemImageId => $composableBuilder(
    column: $table.offerItemImageId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get wantedItemImageId => $composableBuilder(
    column: $table.wantedItemImageId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get exchangeDateTime => $composableBuilder(
    column: $table.exchangeDateTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isPrepaid => $composableBuilder(
    column: $table.isPrepaid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get memo => $composableBuilder(
    column: $table.memo,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TradesTableAnnotationComposer
    extends Composer<_$AppDatabase, $TradesTable> {
  $$TradesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get tradeId =>
      $composableBuilder(column: $table.tradeId, builder: (column) => column);

  GeneratedColumn<int> get tradeTypeId => $composableBuilder(
    column: $table.tradeTypeId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get deliveryTypeId => $composableBuilder(
    column: $table.deliveryTypeId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get partnerId =>
      $composableBuilder(column: $table.partnerId, builder: (column) => column);

  GeneratedColumn<String> get offerItem =>
      $composableBuilder(column: $table.offerItem, builder: (column) => column);

  GeneratedColumn<String> get wantedItem => $composableBuilder(
    column: $table.wantedItem,
    builder: (column) => column,
  );

  GeneratedColumn<String> get offerItemImageId => $composableBuilder(
    column: $table.offerItemImageId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get wantedItemImageId => $composableBuilder(
    column: $table.wantedItemImageId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get exchangeDateTime => $composableBuilder(
    column: $table.exchangeDateTime,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isPrepaid =>
      $composableBuilder(column: $table.isPrepaid, builder: (column) => column);

  GeneratedColumn<String> get memo =>
      $composableBuilder(column: $table.memo, builder: (column) => column);

  Expression<T> tradeStageHistoriesRefs<T extends Object>(
    Expression<T> Function($$TradeStageHistoriesTableAnnotationComposer a) f,
  ) {
    final $$TradeStageHistoriesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.tradeId,
          referencedTable: $db.tradeStageHistories,
          getReferencedColumn: (t) => t.tradeId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TradeStageHistoriesTableAnnotationComposer(
                $db: $db,
                $table: $db.tradeStageHistories,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$TradesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TradesTable,
          Trade,
          $$TradesTableFilterComposer,
          $$TradesTableOrderingComposer,
          $$TradesTableAnnotationComposer,
          $$TradesTableCreateCompanionBuilder,
          $$TradesTableUpdateCompanionBuilder,
          (Trade, $$TradesTableReferences),
          Trade,
          PrefetchHooks Function({bool tradeStageHistoriesRefs})
        > {
  $$TradesTableTableManager(_$AppDatabase db, $TradesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TradesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TradesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TradesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> tradeId = const Value.absent(),
                Value<int> tradeTypeId = const Value.absent(),
                Value<int> deliveryTypeId = const Value.absent(),
                Value<String> partnerId = const Value.absent(),
                Value<String> offerItem = const Value.absent(),
                Value<String> wantedItem = const Value.absent(),
                Value<String?> offerItemImageId = const Value.absent(),
                Value<String?> wantedItemImageId = const Value.absent(),
                Value<DateTime?> exchangeDateTime = const Value.absent(),
                Value<bool> isPrepaid = const Value.absent(),
                Value<String?> memo = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TradesCompanion(
                tradeId: tradeId,
                tradeTypeId: tradeTypeId,
                deliveryTypeId: deliveryTypeId,
                partnerId: partnerId,
                offerItem: offerItem,
                wantedItem: wantedItem,
                offerItemImageId: offerItemImageId,
                wantedItemImageId: wantedItemImageId,
                exchangeDateTime: exchangeDateTime,
                isPrepaid: isPrepaid,
                memo: memo,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String tradeId,
                required int tradeTypeId,
                required int deliveryTypeId,
                required String partnerId,
                required String offerItem,
                required String wantedItem,
                Value<String?> offerItemImageId = const Value.absent(),
                Value<String?> wantedItemImageId = const Value.absent(),
                Value<DateTime?> exchangeDateTime = const Value.absent(),
                required bool isPrepaid,
                Value<String?> memo = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TradesCompanion.insert(
                tradeId: tradeId,
                tradeTypeId: tradeTypeId,
                deliveryTypeId: deliveryTypeId,
                partnerId: partnerId,
                offerItem: offerItem,
                wantedItem: wantedItem,
                offerItemImageId: offerItemImageId,
                wantedItemImageId: wantedItemImageId,
                exchangeDateTime: exchangeDateTime,
                isPrepaid: isPrepaid,
                memo: memo,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$TradesTable, Trade>(table),
                  $$TradesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({tradeStageHistoriesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (tradeStageHistoriesRefs) db.tradeStageHistories,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (tradeStageHistoriesRefs)
                    await $_getPrefetchedData<
                      Trade,
                      $TradesTable,
                      TradeStageHistory
                    >(
                      currentTable: table,
                      referencedTable: $$TradesTableReferences
                          ._tradeStageHistoriesRefsTable(db),
                      managerFromTypedResult: (p0) => $$TradesTableReferences(
                        db,
                        table,
                        p0,
                      ).tradeStageHistoriesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.tradeId == item.tradeId,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$TradesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TradesTable,
      Trade,
      $$TradesTableFilterComposer,
      $$TradesTableOrderingComposer,
      $$TradesTableAnnotationComposer,
      $$TradesTableCreateCompanionBuilder,
      $$TradesTableUpdateCompanionBuilder,
      (Trade, $$TradesTableReferences),
      Trade,
      PrefetchHooks Function({bool tradeStageHistoriesRefs})
    >;
typedef $$TradeStageHistoriesTableCreateCompanionBuilder =
    TradeStageHistoriesCompanion Function({
      required String tradeId,
      required int stageCode,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$TradeStageHistoriesTableUpdateCompanionBuilder =
    TradeStageHistoriesCompanion Function({
      Value<String> tradeId,
      Value<int> stageCode,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$TradeStageHistoriesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $TradeStageHistoriesTable,
          TradeStageHistory
        > {
  $$TradeStageHistoriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TradesTable _tradeIdTable(_$AppDatabase db) => db.trades.createAlias(
    'trade_stage_histories__trade_id__trades__trade_id',
  );

  $$TradesTableProcessedTableManager get tradeId {
    final $_column = $_itemColumn<String>('trade_id')!;

    final manager = $$TradesTableTableManager(
      $_db,
      $_db.trades,
    ).filter((f) => f.tradeId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tradeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TradeStageHistoriesTableFilterComposer
    extends Composer<_$AppDatabase, $TradeStageHistoriesTable> {
  $$TradeStageHistoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get stageCode => $composableBuilder(
    column: $table.stageCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$TradesTableFilterComposer get tradeId {
    final $$TradesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tradeId,
      referencedTable: $db.trades,
      getReferencedColumn: (t) => t.tradeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TradesTableFilterComposer(
            $db: $db,
            $table: $db.trades,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TradeStageHistoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $TradeStageHistoriesTable> {
  $$TradeStageHistoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get stageCode => $composableBuilder(
    column: $table.stageCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$TradesTableOrderingComposer get tradeId {
    final $$TradesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tradeId,
      referencedTable: $db.trades,
      getReferencedColumn: (t) => t.tradeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TradesTableOrderingComposer(
            $db: $db,
            $table: $db.trades,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TradeStageHistoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $TradeStageHistoriesTable> {
  $$TradeStageHistoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get stageCode =>
      $composableBuilder(column: $table.stageCode, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$TradesTableAnnotationComposer get tradeId {
    final $$TradesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tradeId,
      referencedTable: $db.trades,
      getReferencedColumn: (t) => t.tradeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TradesTableAnnotationComposer(
            $db: $db,
            $table: $db.trades,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TradeStageHistoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TradeStageHistoriesTable,
          TradeStageHistory,
          $$TradeStageHistoriesTableFilterComposer,
          $$TradeStageHistoriesTableOrderingComposer,
          $$TradeStageHistoriesTableAnnotationComposer,
          $$TradeStageHistoriesTableCreateCompanionBuilder,
          $$TradeStageHistoriesTableUpdateCompanionBuilder,
          (TradeStageHistory, $$TradeStageHistoriesTableReferences),
          TradeStageHistory,
          PrefetchHooks Function({bool tradeId})
        > {
  $$TradeStageHistoriesTableTableManager(
    _$AppDatabase db,
    $TradeStageHistoriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TradeStageHistoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TradeStageHistoriesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$TradeStageHistoriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> tradeId = const Value.absent(),
                Value<int> stageCode = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TradeStageHistoriesCompanion(
                tradeId: tradeId,
                stageCode: stageCode,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String tradeId,
                required int stageCode,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => TradeStageHistoriesCompanion.insert(
                tradeId: tradeId,
                stageCode: stageCode,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$TradeStageHistoriesTable, TradeStageHistory>(
                    table,
                  ),
                  $$TradeStageHistoriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({tradeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (tradeId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.tradeId,
                                referencedTable:
                                    $$TradeStageHistoriesTableReferences
                                        ._tradeIdTable(db),
                                referencedColumn:
                                    $$TradeStageHistoriesTableReferences
                                        ._tradeIdTable(db)
                                        .tradeId,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$TradeStageHistoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TradeStageHistoriesTable,
      TradeStageHistory,
      $$TradeStageHistoriesTableFilterComposer,
      $$TradeStageHistoriesTableOrderingComposer,
      $$TradeStageHistoriesTableAnnotationComposer,
      $$TradeStageHistoriesTableCreateCompanionBuilder,
      $$TradeStageHistoriesTableUpdateCompanionBuilder,
      (TradeStageHistory, $$TradeStageHistoriesTableReferences),
      TradeStageHistory,
      PrefetchHooks Function({bool tradeId})
    >;
typedef $$PartnersTableCreateCompanionBuilder =
    PartnersCompanion Function({
      required String partnerId,
      required String userId,
      required String username,
      Value<int> rowid,
    });
typedef $$PartnersTableUpdateCompanionBuilder =
    PartnersCompanion Function({
      Value<String> partnerId,
      Value<String> userId,
      Value<String> username,
      Value<int> rowid,
    });

class $$PartnersTableFilterComposer
    extends Composer<_$AppDatabase, $PartnersTable> {
  $$PartnersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get partnerId => $composableBuilder(
    column: $table.partnerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PartnersTableOrderingComposer
    extends Composer<_$AppDatabase, $PartnersTable> {
  $$PartnersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get partnerId => $composableBuilder(
    column: $table.partnerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PartnersTableAnnotationComposer
    extends Composer<_$AppDatabase, $PartnersTable> {
  $$PartnersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get partnerId =>
      $composableBuilder(column: $table.partnerId, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);
}

class $$PartnersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PartnersTable,
          Partner,
          $$PartnersTableFilterComposer,
          $$PartnersTableOrderingComposer,
          $$PartnersTableAnnotationComposer,
          $$PartnersTableCreateCompanionBuilder,
          $$PartnersTableUpdateCompanionBuilder,
          (Partner, BaseReferences<_$AppDatabase, $PartnersTable, Partner>),
          Partner,
          PrefetchHooks Function()
        > {
  $$PartnersTableTableManager(_$AppDatabase db, $PartnersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PartnersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PartnersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PartnersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> partnerId = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> username = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PartnersCompanion(
                partnerId: partnerId,
                userId: userId,
                username: username,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String partnerId,
                required String userId,
                required String username,
                Value<int> rowid = const Value.absent(),
              }) => PartnersCompanion.insert(
                partnerId: partnerId,
                userId: userId,
                username: username,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PartnersTable, Partner>(table),
                  BaseReferences<_$AppDatabase, $PartnersTable, Partner>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PartnersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PartnersTable,
      Partner,
      $$PartnersTableFilterComposer,
      $$PartnersTableOrderingComposer,
      $$PartnersTableAnnotationComposer,
      $$PartnersTableCreateCompanionBuilder,
      $$PartnersTableUpdateCompanionBuilder,
      (Partner, BaseReferences<_$AppDatabase, $PartnersTable, Partner>),
      Partner,
      PrefetchHooks Function()
    >;
typedef $$StoredImagesTableCreateCompanionBuilder =
    StoredImagesCompanion Function({
      required String imageId,
      required Uint8List bytes,
      required String mimeType,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$StoredImagesTableUpdateCompanionBuilder =
    StoredImagesCompanion Function({
      Value<String> imageId,
      Value<Uint8List> bytes,
      Value<String> mimeType,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$StoredImagesTableFilterComposer
    extends Composer<_$AppDatabase, $StoredImagesTable> {
  $$StoredImagesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get imageId => $composableBuilder(
    column: $table.imageId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<Uint8List> get bytes => $composableBuilder(
    column: $table.bytes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mimeType => $composableBuilder(
    column: $table.mimeType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StoredImagesTableOrderingComposer
    extends Composer<_$AppDatabase, $StoredImagesTable> {
  $$StoredImagesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get imageId => $composableBuilder(
    column: $table.imageId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<Uint8List> get bytes => $composableBuilder(
    column: $table.bytes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mimeType => $composableBuilder(
    column: $table.mimeType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StoredImagesTableAnnotationComposer
    extends Composer<_$AppDatabase, $StoredImagesTable> {
  $$StoredImagesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get imageId =>
      $composableBuilder(column: $table.imageId, builder: (column) => column);

  GeneratedColumn<Uint8List> get bytes =>
      $composableBuilder(column: $table.bytes, builder: (column) => column);

  GeneratedColumn<String> get mimeType =>
      $composableBuilder(column: $table.mimeType, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$StoredImagesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StoredImagesTable,
          StoredImage,
          $$StoredImagesTableFilterComposer,
          $$StoredImagesTableOrderingComposer,
          $$StoredImagesTableAnnotationComposer,
          $$StoredImagesTableCreateCompanionBuilder,
          $$StoredImagesTableUpdateCompanionBuilder,
          (
            StoredImage,
            BaseReferences<_$AppDatabase, $StoredImagesTable, StoredImage>,
          ),
          StoredImage,
          PrefetchHooks Function()
        > {
  $$StoredImagesTableTableManager(_$AppDatabase db, $StoredImagesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StoredImagesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StoredImagesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StoredImagesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> imageId = const Value.absent(),
                Value<Uint8List> bytes = const Value.absent(),
                Value<String> mimeType = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StoredImagesCompanion(
                imageId: imageId,
                bytes: bytes,
                mimeType: mimeType,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String imageId,
                required Uint8List bytes,
                required String mimeType,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => StoredImagesCompanion.insert(
                imageId: imageId,
                bytes: bytes,
                mimeType: mimeType,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$StoredImagesTable, StoredImage>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $StoredImagesTable,
                    StoredImage
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StoredImagesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StoredImagesTable,
      StoredImage,
      $$StoredImagesTableFilterComposer,
      $$StoredImagesTableOrderingComposer,
      $$StoredImagesTableAnnotationComposer,
      $$StoredImagesTableCreateCompanionBuilder,
      $$StoredImagesTableUpdateCompanionBuilder,
      (
        StoredImage,
        BaseReferences<_$AppDatabase, $StoredImagesTable, StoredImage>,
      ),
      StoredImage,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TradesTableTableManager get trades =>
      $$TradesTableTableManager(_db, _db.trades);
  $$TradeStageHistoriesTableTableManager get tradeStageHistories =>
      $$TradeStageHistoriesTableTableManager(_db, _db.tradeStageHistories);
  $$PartnersTableTableManager get partners =>
      $$PartnersTableTableManager(_db, _db.partners);
  $$StoredImagesTableTableManager get storedImages =>
      $$StoredImagesTableTableManager(_db, _db.storedImages);
}
