import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/features/trade/domain/models/trade_stage.dart';
import 'package:trading_management/features/trade/presentation/widgets/common/next_stage_button/trade_next_stage_button.dart';

const _tradeId = 'trade1';
const _group = 'trade/next_stage_button';
const _stages = [TradeStage.agreed, TradeStage.completed];

@AppPreview(group: _group, name: 'Card / Next stage', size: Size(360, 200))
Widget tradeNextStageButtonCardNextStagePreview() {
  return _buildPreview(
    isCard: true,
    completedStages: const [TradeStage.agreed],
  );
}

@AppPreview(group: _group, name: 'Card / Completed', size: Size(360, 200))
Widget tradeNextStageButtonCardCompletedPreview() {
  return _buildPreview(isCard: true, completedStages: _stages);
}

@AppPreview(
  group: _group,
  name: 'Bottom action bar / Next stage',
  size: Size(360, 200),
)
Widget tradeNextStageButtonBottomBarNextStagePreview() {
  return _buildPreview(
    isCard: false,
    completedStages: const [TradeStage.agreed],
  );
}

@AppPreview(
  group: _group,
  name: 'Bottom action bar / Completed',
  size: Size(360, 200),
)
Widget tradeNextStageButtonBottomBarCompletedPreview() {
  return _buildPreview(isCard: false, completedStages: _stages);
}

Widget _buildPreview({
  required bool isCard,
  required List<TradeStage> completedStages,
}) {
  return Scaffold(
    bottomNavigationBar: isCard
        ? null
        : TradeNextStageButton(
            tradeId: _tradeId,
            stages: _stages,
            completedStages: completedStages,
            isCard: false,
            onUpdate: () async {},
          ),
    body: isCard
        ? Padding(
            padding: const EdgeInsets.all(16),
            child: TradeNextStageButton(
              tradeId: _tradeId,
              stages: _stages,
              completedStages: completedStages,
              onUpdate: () async {},
            ),
          )
        : const Center(child: Text('取引詳細')),
  );
}
