import 'package:flutter/widgets.dart';
import 'package:trading_management/core/widgets/layout/section_card/section_card.dart';
import 'package:trading_management/features/trade/domain/conditions/trade_display_conditions.dart';

/// メモ情報
///
/// - [memo] メモ
class TradeMemo extends StatelessWidget {
  //
  // fields
  //

  final String? memo;

  //
  // constructor
  //

  const TradeMemo({super.key, this.memo});

  //
  // public methods
  //

  @override
  Widget build(BuildContext context) {
    if (TradeDisplayConditions.shouldDisplayMemo(memo: memo)) {
      return SectionCard(title: 'メモ', child: Text(memo!));
    } else {
      return const SizedBox.shrink();
    }
  }
}
