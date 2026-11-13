import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/features/partner/application/models/partner_detail.dart';
import 'package:trading_management/features/trade/presentation/widgets/detail/partner_info/trade_partner_info.dart';

const _group = 'trade/detail/partner_info';

@AppPreview(group: _group, name: 'With partner', size: Size(360, 190))
Widget tradePartnerInfoWithPartnerPreview() {
  return _buildPreview(
    const PartnerDetail(
      partnerId: 'partner-1',
      userId: 'sample_user',
      username: 'サンプルユーザー',
    ),
  );
}

@AppPreview(group: _group, name: 'Without partner', size: Size(360, 190))
Widget tradePartnerInfoWithoutPartnerPreview() {
  return _buildPreview(null);
}

Widget _buildPreview(PartnerDetail? partner) {
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: TradePartnerInfo(partner: partner),
    ),
  );
}
