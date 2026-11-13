import 'package:flutter/widgets.dart';
import 'package:trading_management/core/constants/app_string.dart';
import 'package:trading_management/core/widgets/display/link_text/link_text.dart';
import 'package:trading_management/core/widgets/layout/section_card/section_card.dart';
import 'package:trading_management/features/partner/application/models/partner_detail.dart';
import 'package:trading_management/features/trade/domain/conditions/trade_display_conditions.dart';

///  取引相手情報
///
/// - [partner] 取引相手
class TradePartnerInfo extends StatelessWidget {
  //
  // fields
  //

  /// 取引相手
  final PartnerDetail? partner;

  //
  // constructor
  //

  const TradePartnerInfo({super.key, this.partner});

  //
  // public methods
  //

  @override
  Widget build(BuildContext context) {
    if (TradeDisplayConditions.shouldDisplayPartner(
      partnerUserId: partner?.userId,
    )) {
      return SectionCard(
        title: '取引相手',
        child: LinkText(
          text: '${partner!.username} さん',
          uri: '${AppString.xDomain}${partner!.userId}',
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
