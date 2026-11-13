import 'package:flutter/widgets.dart';
import 'package:trading_management/core/data/database/app_database.scope.dart';
import 'package:trading_management/core/theme/app_spacing.dart';
import 'package:trading_management/core/widgets/form/button/app_button.dart';
import 'package:trading_management/core/widgets/form/button/app_button_config.dart';
import 'package:trading_management/core/widgets/layout/bottom_action_bar/bottom_action_bar.dart';
import 'package:trading_management/features/trade/application/services/trade_stage_history_service.dart';
import 'package:trading_management/features/trade/domain/models/trade_stage.dart';
import 'package:trading_management/features/trade/domain/resolvers/trade_stage_resolver.dart';

/// 取引ステージ進行ボタン
///
/// - [stages] 取引ステージリスト
/// - [completedStages] 完了済みステージリスト
class TradeNextStageButton extends StatelessWidget {
  //
  // fields
  //

  /// 取引ID
  final String tradeId;

  /// 取引ステージリスト
  final List<TradeStage> stages;

  /// 完了済みステージリスト
  final List<TradeStage> completedStages;

  /// カードに表示するかどうか
  final bool isCard;

  /// 更新時のコールバック
  final Future<void> Function()? onUpdate;

  //
  // constructor
  //

  const TradeNextStageButton({
    super.key,
    required this.tradeId,
    required this.stages,
    required this.completedStages,
    this.isCard = true,
    required this.onUpdate,
  });

  //
  // public methods
  //

  @override
  Widget build(BuildContext context) {
    final nextStage = TradeStageResolver.resolveNextStage(
      stages: stages,
      completedStages: completedStages,
    );
    // 取引終了済みのとき、ボタン操作不可
    final text = nextStage != null ? '${nextStage.label} にする' : '取引終了済';
    final onPressed = nextStage == null
        ? null
        : () => _nextStep(context, nextStage: nextStage);

    if (isCard) {
      return AppButton(
        text: text,
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.s12),
        isFullWidth: true,
        onPressed: onPressed,
      );
    } else {
      return BottomActionBar(
        config: AppButtonConfig(text: text, onPressed: onPressed),
      );
    }
  }

  //
  // private methods
  //

  Future<void> _nextStep(
    BuildContext context, {
    required TradeStage nextStage,
  }) async {
    final database = AppDatabaseScope.of(context);
    final service = TradeStageHistoryService.fromDatabase(database);

    await service.insert(tradeId: tradeId, stage: nextStage);
    await onUpdate?.call();
  }
}
