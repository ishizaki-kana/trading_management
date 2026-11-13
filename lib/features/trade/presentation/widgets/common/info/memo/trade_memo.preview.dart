import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/features/trade/presentation/widgets/common/info/memo/trade_memo.dart';

const _group = 'trade/detail/memo';

@AppPreview(group: _group, name: 'With memo', size: Size(360, 190))
Widget tradeMemoWithMemoPreview() {
  return _buildPreview('当日は東京駅の中央改札前で待ち合わせます。');
}

@AppPreview(group: _group, name: 'Without memo', size: Size(360, 190))
Widget tradeMemoWithoutMemoPreview() {
  return _buildPreview(null);
}

Widget _buildPreview(String? memo) {
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: TradeMemo(memo: memo),
    ),
  );
}
