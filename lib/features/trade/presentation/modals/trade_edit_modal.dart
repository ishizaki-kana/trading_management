import 'package:flutter/material.dart';
import 'package:trading_management/core/data/database/app_database.scope.dart';
import 'package:trading_management/core/exception/validation_exception.dart';
import 'package:trading_management/core/theme/app_color.dart';
import 'package:trading_management/core/theme/app_spacing.dart';
import 'package:trading_management/core/types/app_feedback.dart';
import 'package:trading_management/core/widgets/feedback/banner/status_banner.dart';
import 'package:trading_management/core/widgets/feedback/flushbar/app_flushbar.dart';
import 'package:trading_management/core/widgets/form/button/app_button_config.dart';
import 'package:trading_management/core/widgets/form/checkbox/tile/checkbox_tile.dart';
import 'package:trading_management/core/widgets/form/field/date/date_field.dart';
import 'package:trading_management/core/widgets/form/field/image/image_field.dart';
import 'package:trading_management/core/widgets/form/field/radio/radio_group.dart';
import 'package:trading_management/core/widgets/form/field/radio/radio_option.dart';
import 'package:trading_management/core/widgets/form/field/text/text_field.dart';
import 'package:trading_management/core/widgets/layout/modal/full_height/full_height_modal.dart';
import 'package:trading_management/core/widgets/layout/section/section.dart';
import 'package:trading_management/features/trade/application/forms/trade_form.dart';
import 'package:trading_management/features/trade/application/mappers/trade_mapper.dart';
import 'package:trading_management/features/trade/application/models/trade_detail.dart';
import 'package:trading_management/features/trade/application/services/trade_service.dart';
import 'package:trading_management/features/trade/domain/models/delivery_type.dart';
import 'package:trading_management/features/trade/domain/models/trade_type.dart';

/// 取引編集画面
///
/// - [trade] 取引データ
class TradeEditModal extends StatefulWidget {
  //
  // fields
  //

  /// 取引データ
  final TradeDetail? trade;

  //
  // constructor
  //

  const TradeEditModal({super.key, required this.trade});

  //
  // public methods
  //

  @override
  State<TradeEditModal> createState() => _TradeDetailModalState();
}

class _TradeDetailModalState extends State<TradeEditModal> {
  //
  // fields
  //

  /// フォームキー
  final _formKey = GlobalKey<FormState>();

  /// 取引編集フォーム
  TradeForm? _form;

  /// フォームエラー
  String? _formError;

  /// 登録中かどうか
  bool _isSaving = false;

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

    return TextSelectionTheme(
      data: TextSelectionThemeData(
        cursorColor: AppColor.accent,
        selectionColor: AppColor.accent.withAlpha(50),
        selectionHandleColor: AppColor.accent,
      ),
      child: FullHeightModal(
        title: '取引内容を編集',
        positiveBtnConfig: AppButtonConfig(
          onPressed: _saveTrade,
          text: '登録する',
          isLoading: _isSaving,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            spacing: AppSpacing.s8,
            children: [
              if (_formError != null)
                StatusBanner(type: AppFeedback.error, message: _formError!),
              _buildTradeTypeSelectSection(form),
              _buildDeliveryTypeSelectSection(form),
              _buildOfferItemSection(form),
              _buildWantedItemSection(form),
              _buildPartnerEditSection(form),
              if (form.deliveryType.value == DeliveryType.handoff.code)
                _buildDateLocationEditSection(form),
              _buildPrepaidSection(form),
              _buildMemoEditLocation(form),
            ],
          ),
        ),
      ),
    );
  }

  //
  // private methods
  //

  Future<void> _saveTrade() async {
    FocusScope.of(context).unfocus();

    final formState = _formKey.currentState;
    if (formState == null) return;

    if (!formState.validate()) return; // バリデーション

    formState.save(); // 各フィールドの onSaved を実行

    setState(() {
      _isSaving = true;
      _formError = null;
    });

    try {
      // 更新
      final database = AppDatabaseScope.of(context);
      final tradeService = TradeService.fromDatabase(database);

      final form = _form;
      final trade = widget.trade;
      if (trade == null || form == null) return;

      await tradeService.update(
        tradeId: trade.tradeId,
        partnerId: trade.partner?.partnerId,
        form: form,
      );

      if (!mounted) return;

      Navigator.of(context).pop(true); // 呼び出し元に更新成功を伝える
    } on ValidationException catch (e) {
      setState(() {
        _formError = e.message;
      });
    } catch (e) {
      if (!mounted) return;

      AppFlushbar.show(
        context,
        type: AppFeedback.error,
        message: '取引内容の登録に失敗しました。',
      );
    } finally {
      if (mounted) {
        setState(() {
          _isSaving = false;
        });
      }
    }
  }

  void _updateForm(TradeForm Function(TradeForm form) update) {
    final form = _form;
    if (form == null) return;

    _form = update(form);
  }

  /// 取引種別
  Widget _buildTradeTypeSelectSection(TradeForm form) {
    return AppRadioGroup(
      form.tradeType,
      options: [
        for (final type in TradeType.values)
          RadioOption(
            value: type.code,
            label: type.label,
            selectedColor: type.color,
          ),
      ],
      onSelected: (value) {
        setState(() {
          _updateForm((form) => form.copyWith(tradeTypeId: value));
        });
      },
    );
  }

  /// 受渡種別
  Widget _buildDeliveryTypeSelectSection(TradeForm form) {
    return AppRadioGroup(
      form.deliveryType,
      options: [
        for (final type in DeliveryType.values)
          RadioOption(
            value: type.code,
            label: type.label,
            selectedColor: type.color,
          ),
      ],
      onSelected: (value) {
        setState(() {
          _updateForm((form) => form.copyWith(deliveryTypeId: value));
        });
      },
    );
  }

  /// 譲渡アイテム
  Widget _buildOfferItemSection(TradeForm form) {
    return Section(
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
    );
  }

  /// 希望アイテム
  Widget _buildWantedItemSection(TradeForm form) {
    return Section(
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
    );
  }

  /// 取引相手
  Widget _buildPartnerEditSection(TradeForm form) {
    return Section(
      title: '取引相手',
      children: [
        AppTextField(
          form.partner.username,
          hintText: 'ユーザー名',
          showLabel: false,
          onSaved: (value) {
            _updateForm(
              (form) => form.copyWith(
                partner: form.partner.copyWith(username: value?.trim() ?? ''),
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
                partner: form.partner.copyWith(userId: value?.trim() ?? ''),
              ),
            );
          },
        ),
      ],
    );
  }

  /// 取引日時・場所
  Widget _buildDateLocationEditSection(TradeForm form) {
    return Column(
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
    );
  }

  /// 先払い
  Widget _buildPrepaidSection(TradeForm form) {
    return CheckboxTile(
      form.isPrepaid,

      onSaved: (value) {
        _updateForm((form) => form.copyWith(isPrepaid: value));
      },
    );
  }

  /// メモ
  Widget _buildMemoEditLocation(TradeForm form) {
    return AppTextField(
      form.memo,
      isMultiline: true,
      onSaved: (value) {
        _updateForm((form) => form.copyWith(memo: value));
      },
    );
  }
}
