import 'package:flutter/material.dart';
import 'package:trading_management/core/data/database/app_database.scope.dart';
import 'package:trading_management/core/theme/app_spacing.dart';
import 'package:trading_management/core/types/message_type/app_feedback_type.dart';
import 'package:trading_management/core/widgets/feedback/banner/status_banner.dart';
import 'package:trading_management/core/widgets/form/checkbox/tile/checkbox_tile.dart';
import 'package:trading_management/core/widgets/form/field/date/date_field.dart';
import 'package:trading_management/core/widgets/form/field/image/image_field.dart';
import 'package:trading_management/core/widgets/form/field/radio/radio_group.dart';
import 'package:trading_management/core/widgets/form/field/radio/radio_option.dart';
import 'package:trading_management/core/widgets/form/field/text/text_field.dart';
import 'package:trading_management/core/widgets/form/form/app_form.dart';
import 'package:trading_management/core/widgets/layout/section/section.dart';
import 'package:trading_management/features/trade/application/forms/trade_form.dart';
import 'package:trading_management/features/trade/application/mappers/trade_mapper.dart';
import 'package:trading_management/features/trade/application/models/trade_detail.dart';
import 'package:trading_management/features/trade/application/services/trade_service.dart';
import 'package:trading_management/features/trade/domain/models/delivery_type.dart';
import 'package:trading_management/features/trade/domain/models/trade_type.dart';

class TradeEditForm extends StatefulWidget {
  //
  // fields
  //

  /// 取引データ
  final TradeDetail? trade;

  //
  // constructor
  //

  const TradeEditForm({super.key, required this.trade});

  //
  // public methods
  //

  @override
  State<TradeEditForm> createState() => TradeEditFormState();
}

class TradeEditFormState extends AppFormState<TradeEditForm> {
  //
  // fields
  //

  /// 取引編集フォーム
  TradeForm? _form;

  /// 登録処理
  Future<void> saveTrade() => _saveTrade();

  //
  // public methods
  //

  /// 初期化処理
  @override
  void initState() {
    super.initState();

    final trade = widget.trade;
    if (trade == null) return;

    _form = TradeMapper.toForm(trade);
  }

  @override
  Widget build(BuildContext context) {
    final form = _form;
    if (form == null) {
      return const SizedBox.shrink();
    }

    // 取引種別オプション
    final tradeTypeOptions = [
      for (final type in TradeType.values)
        RadioOption(
          value: type.code,
          label: type.label,
          selectedColor: type.color,
        ),
    ];

    // 受渡種別オプション
    final deliveryTypeOptions = [
      for (final type in DeliveryType.values)
        RadioOption(
          value: type.code,
          label: type.label,
          selectedColor: type.color,
        ),
    ];

    return Form(
      key: formKey,
      child: Column(
        spacing: AppSpacing.s8,
        children: [
          // フォームエラー
          if (isFormError)
            StatusBanner(
              type: AppFeedbackType.error,
              message: displayMessage!.message,
            ),
          // 取引種別
          AppRadioGroup(
            form.tradeType,
            options: tradeTypeOptions,
            onSelected: (value) {
              setState(() {
                _updateForm((form) => form.copyWith(tradeTypeId: value));
              });
            },
          ),
          // 受渡種別
          AppRadioGroup(
            form.deliveryType,
            options: deliveryTypeOptions,
            onSelected: (value) {
              setState(() {
                _updateForm((form) => form.copyWith(deliveryTypeId: value));
              });
            },
          ),
          // 譲渡アイテム
          Section(
            title: '譲渡するアイテム',
            children: [
              ImageField(
                form.offerItemImage,
                showLabel: false,
                onSaved: (value) {
                  _updateForm((form) => form.copyWith(offerItemImage: value));
                },
              ),
              AppTextField(
                form.offerItemName,
                showLabel: false,
                onSaved: (value) {
                  _updateForm((form) => form.copyWith(offerItemName: value));
                },
              ),
            ],
          ),
          // 希望アイテム
          Section(
            title: '希望するアイテム',
            children: [
              ImageField(
                form.wantedItemImage,
                showLabel: false,
                onSaved: (value) {
                  _updateForm((form) => form.copyWith(wantedItemImage: value));
                },
              ),
              AppTextField(
                form.wantedItemName,
                showLabel: false,
                onSaved: (value) {
                  _updateForm((form) => form.copyWith(wantedItemName: value));
                },
              ),
            ],
          ),
          // 取引相手
          Section(
            title: '取引相手',
            children: [
              AppTextField(
                form.partner.username,
                hintText: 'ユーザー名',
                showLabel: false,
                onSaved: (value) {
                  _updateForm(
                    (form) => form.copyWith(
                      partner: form.partner.copyWith(
                        username: value?.trim() ?? '',
                      ),
                    ),
                  );
                },
              ),
              AppTextField(
                form.partner.userId,
                prefix: const Text('@'),
                hintText: 'ユーザーID',
                showLabel: false,
                onSaved: (value) {
                  _updateForm(
                    (form) => form.copyWith(
                      partner: form.partner.copyWith(
                        userId: value?.trim() ?? '',
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          // 取引日時・場所
          if (form.deliveryType.value == DeliveryType.handoff.code)
            Column(
              spacing: AppSpacing.s8,
              children: [
                DateField(
                  form.tradedAt,
                  //label: '取引日時・場所',
                  onSaved: (value) {
                    _updateForm((form) => form.copyWith(tradedAt: value));
                  },
                ),
                AppTextField(
                  form.location,
                  showLabel: false,
                  onSaved: (value) {
                    _updateForm((form) => form.copyWith(location: value));
                  },
                ),
              ],
            ),
          // 先払い
          CheckboxTile(
            form.isPrepaid,
            onSaved: (value) {
              _updateForm((form) => form.copyWith(isPrepaid: value));
            },
          ),
          // メモ
          AppTextField(
            form.memo,
            isMultiline: true,
            onSaved: (value) {
              _updateForm((form) => form.copyWith(memo: value));
            },
          ),
        ],
      ),
    );
  }

  //
  // private methods
  //

  void _updateForm(TradeForm Function(TradeForm form) update) {
    final form = _form;
    if (form == null) return;

    _form = update(form);
  }

  Future<void> _saveTrade() async {
    final trade = widget.trade;
    if (trade == null) return;

    final database = AppDatabaseScope.of(context);
    final tradeService = TradeService.fromDatabase(database);

    return save(
      action: () => tradeService.update(
        tradeId: trade.tradeId,
        partnerId: trade.partner?.partnerId,
        form: _form!,
      ),
    );
  }
}
