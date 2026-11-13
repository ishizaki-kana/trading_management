import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_color.dart';
import 'package:trading_management/core/widgets/form/button/app_button_config.dart';
import 'package:trading_management/core/widgets/layout/modal/full_height/full_height_modal.dart';
import 'package:trading_management/features/trade/application/models/trade_detail.dart';
import 'package:trading_management/features/trade/presentation/widgets/edit/form/trade_edit_form.dart';

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

  final _tradeEditFormKey = GlobalKey<TradeEditFormState>();

  //
  // public methods
  //

  @override
  Widget build(BuildContext context) {
    final isSaving = _tradeEditFormKey.currentState?.isSaving ?? false;
    final saveTrade = isSaving
        ? null
        : () async {
            await _tradeEditFormKey.currentState?.saveTrade();
          };

    return TextSelectionTheme(
      data: TextSelectionThemeData(
        cursorColor: AppColor.accent,
        selectionColor: AppColor.accent.withAlpha(50),
        selectionHandleColor: AppColor.accent,
      ),
      child: FullHeightModal(
        title: '取引内容を編集',
        positiveBtnConfig: AppButtonConfig(
          onPressed: saveTrade,
          text: '登録する',
          isLoading: isSaving,
        ),
        child: TradeEditForm(key: _tradeEditFormKey, trade: widget.trade),
      ),
    );
  }
}
