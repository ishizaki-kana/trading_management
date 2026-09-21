import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/features/trade/domain/models/trade_stage.dart';
import 'package:trading_management/features/trade/presentation/widgets/stage_indicator/trade_stage_indicator.dart';

const _group = 'trade/stage_indicator';

@AppPreview(group: _group, name: 'Not started')
Widget tradeStageIndicatorNotStartedPreview() {
  return _buildPreview();
}

@AppPreview(group: _group, name: 'In progress')
Widget tradeStageIndicatorInProgressPreview() {
  return _buildPreview(completedStages: TradeStage.values.take(3).toList());
}

@AppPreview(group: _group, name: 'Completed')
Widget tradeStageIndicatorCompletedPreview() {
  return _buildPreview(completedStages: TradeStage.values);
}

Widget _buildPreview({List<TradeStage> completedStages = const []}) {
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: TradeStageIndicator(
        stages: TradeStage.values,
        completedStages: completedStages,
      ),
    ),
  );
}
