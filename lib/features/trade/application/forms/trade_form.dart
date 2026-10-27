import 'dart:typed_data';

import 'package:trading_management/core/form/app_form_field.dart';
import 'package:trading_management/core/form/unset.dart';
import 'package:trading_management/features/partner/application/forms/partner_form.dart';

/// 取引フォーム
class TradeForm {
  //
  // fields
  //

  /// 取引相手
  final PartnerForm partner;

  /// 取引種別
  final AppFormField<int> tradeType;

  /// 受渡種別ID
  final AppFormField<int> deliveryType;

  /// 譲渡アイテム名
  final AppFormField<String> offerItemName;

  /// 譲渡アイテム画像
  final AppFormField<Uint8List?> offerItemImage;

  /// 求めるアイテム名
  final AppFormField<String> wantedItemName;

  /// 求めるアイテム画像
  final AppFormField<Uint8List?> wantedItemImage;

  /// 取引日時
  final AppFormField<DateTime> tradedAt;

  /// 取引場所
  final AppFormField<String> location;

  /// 先払いかどうか
  final AppFormField<bool> isPrepaid;

  /// メモ
  final AppFormField<String> memo;

  //
  // constructor
  //

  TradeForm({
    required this.partner,
    int? tradeTypeId,
    int? deliveryTypeId,
    String? offerItemName,
    Uint8List? offerItemImage,
    String? wantedItemName,
    Uint8List? wantedItemImage,
    DateTime? tradedAt,
    String? location,
    bool? isPrepaid,
    String? memo,
  }) : tradeType = AppFormField(
         id: 'tradeType',
         name: '取引種別',
         value: tradeTypeId ?? -1,
         isRequired: true,
       ),
       deliveryType = AppFormField(
         id: 'deliveryType',
         name: '受渡種別',
         value: deliveryTypeId ?? -1,
       ),
       offerItemName = AppFormField(
         id: 'offerItemName',
         name: '譲渡アイテム名',
         value: offerItemName ?? '',
         max: 20,
       ),
       offerItemImage = AppFormField(
         id: 'offerItemImage',
         name: '譲渡アイテム画像',
         value: offerItemImage,
       ),
       wantedItemName = AppFormField(
         id: 'wantedItemName',
         name: '希望アイテム名',
         value: wantedItemName ?? '',
         max: 20,
       ),
       wantedItemImage = AppFormField(
         id: 'wantedItemImage',
         name: '希望アイテム画像',
         value: wantedItemImage,
       ),
       tradedAt = AppFormField(
         id: 'tradedAt',
         name: '取引日時',
         value: tradedAt ?? DateTime.now(),
       ),
       location = AppFormField(
         id: 'location',
         name: '取引場所',
         value: location ?? '',
       ),
       isPrepaid = AppFormField(
         id: 'isPrepaid',
         name: '先払い',
         value: isPrepaid ?? false,
       ),
       memo = AppFormField(id: 'memo', name: 'メモ', value: memo ?? '');

  TradeForm._({
    required this.partner,
    required this.tradeType,
    required this.deliveryType,
    required this.offerItemName,
    required this.wantedItemName,
    required this.offerItemImage,
    required this.wantedItemImage,
    required this.tradedAt,
    required this.location,
    required this.isPrepaid,
    required this.memo,
  });

  //
  // public methods
  //

  /// コピー作成
  ///
  /// - [partner] 取引相手フォーム
  /// - [tradeTypeId] 取引種別ID
  /// - [deliveryTypeId] 受渡種別ID
  /// - [offerItemName] 譲渡アイテム名
  /// - [wantedItemName] 求めるアイテム名
  /// - [offerItemImage] 譲渡アイテム画像
  /// - [wantedItemImage] 求めるアイテム画像
  /// - [tradedAt] 取引日時
  /// - [location] 取引場所
  /// - [isPrepaid] 先払いかどうか
  /// - [memo] メモ
  TradeForm copyWith({
    PartnerForm? partner,
    int? tradeTypeId,
    int? deliveryTypeId,
    String? offerItemName,
    String? wantedItemName,
    Object? offerItemImage = unset,
    Object? wantedItemImage = unset,
    DateTime? tradedAt,
    String? location,
    bool? isPrepaid,
    String? memo,
  }) {
    return TradeForm._(
      partner: partner ?? this.partner,
      tradeType: tradeType.copyWith(value: tradeTypeId ?? tradeType.value),
      deliveryType: deliveryType.copyWith(
        value: deliveryTypeId ?? deliveryType.value,
      ),
      offerItemName: this.offerItemName.copyWith(
        value: offerItemName ?? this.offerItemName.value,
      ),
      offerItemImage: this.offerItemImage.copyWith(
        value: identical(offerItemImage, unset)
            ? this.offerItemImage.value
            : offerItemImage as Uint8List?,
      ),
      wantedItemName: this.wantedItemName.copyWith(
        value: wantedItemName ?? this.wantedItemName.value,
      ),
      wantedItemImage: this.wantedItemImage.copyWith(
        value: identical(wantedItemImage, unset)
            ? this.wantedItemImage.value
            : wantedItemImage as Uint8List?,
      ),
      tradedAt: this.tradedAt.copyWith(value: tradedAt ?? this.tradedAt.value),
      location: this.location.copyWith(value: location ?? this.location.value),
      isPrepaid: this.isPrepaid.copyWith(
        value: isPrepaid ?? this.isPrepaid.value,
      ),
      memo: this.memo.copyWith(value: memo ?? this.memo.value),
    );
  }
}
