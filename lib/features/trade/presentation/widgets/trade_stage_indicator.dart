import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_color.dart';
import 'package:trading_management/core/theme/app_icon_size.dart';
import 'package:trading_management/core/theme/app_spacing.dart';
import 'package:trading_management/features/trade/domain/entities/trade_stage.dart';

/// 取引ステージインジケータ
///
/// 取引ステージの進行度を表示します。
///
/// - [stages] 取引ステージリスト
/// - [completedStages] 取引ステージ完了済みリスト
class TradeStageIndicator extends StatelessWidget {
  final List<TradeStage> stages;
  final List<TradeStage> completedStages;

  const TradeStageIndicator({
    super.key,
    required this.stages,
    required this.completedStages,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        // 先頭と末尾の丸の中心までの距離
        final lineInset = constraints.maxWidth / (stages.length * 2);
        // 棒の高さ
        final lineHeight = 11.0;
        // 完了後の色
        final completedColor = AppColor.accent;
        // 未完了の色
        final unfinishedColor = AppColor.lightGrey;

        return SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              // 丸と丸の間の棒
              Positioned(
                left: lineInset, // 最初の丸の中心
                right: lineInset, // 最後の丸の中心
                top: lineHeight,
                child: Row(
                  children: List.generate(stages.length - 1, (index) {
                    final isCurrentCompleted = completedStages.contains(
                      stages[index],
                    );
                    final isNextCompleted = completedStages.contains(
                      stages[index + 1],
                    );

                    return Expanded(
                      child: Row(
                        children: [
                          // 現在のステージ側の半分
                          Expanded(
                            child: Container(
                              height: 2,
                              color: isCurrentCompleted
                                  ? completedColor
                                  : unfinishedColor,
                            ),
                          ),
                          // 次のステージ側の半分
                          Expanded(
                            child: Container(
                              height: 2,
                              color: isNextCompleted
                                  ? completedColor
                                  : unfinishedColor,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),

              // 丸とラベル
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(stages.length, (index) {
                  final isCompleted = completedStages.contains(stages[index]);

                  return Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: AppIconSize.xs,
                          backgroundColor: isCompleted
                              ? completedColor
                              : unfinishedColor,
                          child: isCompleted
                              ? const Icon(
                                  Icons.check,
                                  size: AppIconSize.sm,
                                  color: AppColor.white,
                                )
                              : Text(
                                  '${index + 1}',
                                  style: theme.textTheme.labelMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                        const SizedBox(height: AppSpacing.s4),
                        Text(
                          stages[index].label,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            color: isCompleted ? completedColor : AppColor.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        );
      },
    );
  }
}
