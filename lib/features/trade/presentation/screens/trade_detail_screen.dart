import 'package:flutter/material.dart';
import 'package:trading_management/core/data/database/app_database.scope.dart';
import 'package:trading_management/core/theme/app_spacing.dart';
import 'package:trading_management/core/widgets/layout/bottom_action_bar/bottom_action_bar.dart';
import 'package:trading_management/core/widgets/layout/page/app_page.dart';
import 'package:trading_management/core/widgets/navigation/app_bars/common/common_app_bar.dart';
import 'package:trading_management/features/trade/application/models/trade_detail.dart';
import 'package:trading_management/features/trade/application/services/trade_service.dart';
import 'package:trading_management/features/trade/domain/models/trade_stage.dart';
import 'package:trading_management/features/trade/domain/resolvers/trade_stage_resolver.dart';
import 'package:trading_management/features/trade/presentation/widgets/detail/trade_detail_info.dart';

/// 取引詳細画面
///
/// - [tradeId] 取引ID
class TradeDetailScreen extends StatefulWidget {
  //
  // fields
  //

  /// 取引ID
  final String tradeId;

  //
  // constructor
  //

  const TradeDetailScreen({super.key, required this.tradeId});

  //
  // public methods
  //

  @override
  State<TradeDetailScreen> createState() => _TradeDetailScreenState();
}

class _TradeDetailScreenState extends State<TradeDetailScreen> {
  //
  // fields
  //

  /// 取引データ
  TradeDetail? _trade;

  /// メッセージ
  ({String message, IconData icon})? _message;

  /// 読み込み処理を開始済みかどうか
  bool _isLoadStarted = false;

  ///　読み込み中かどうか
  bool _isLoading = false;

  //
  // public methods
  //

  /// 初期化
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // 初回のみ読み込み処理を開始する
    if (_isLoadStarted) {
      return;
    }

    _isLoadStarted = true;
    _loadTrade();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final trade = _trade!;

    // 取引ステージリスト
    final stages = TradeStageResolver.resolveStates(
      tradeType: trade.tradeType,
      deliveryType: trade.deliveryType,
      isPrepaid: trade.isPrepaid,
    );

    return AppPage(
      appBar: CommonAppBar(),
      backgroundColor: theme.colorScheme.surface,
      message: _message?.message,
      messageIcon: _message?.icon,
      isLoading: _isLoading,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.pageHorizontal(context),
                  vertical: AppSpacing.pageVertical(context),
                ),
                child: TradeDetailInfo(trade: trade, stages: stages),
              ),
            ),
          ),
          _buildNextStageButton(trade, stages),
        ],
      ),
    );
  }

  //
  // private methods
  //

  /// 取引データ取得
  Future<void> _loadTrade() async {
    // ローディング状態・画面メッセージ初期化
    setState(() {
      _isLoading = true;
      _message = null;
    });

    // 取引データ取得
    final database = AppDatabaseScope.of(context);
    final tradeService = TradeService.fromDatabase(database);

    try {
      final trade = await tradeService.getTrade(widget.tradeId);

      if (!mounted) {
        return;
      }

      setState(() {
        _trade = trade;
        _isLoading = false;
      });
    } catch (error) {
      if (!mounted) {
        return;
      }

      setState(() {
        _message = (message: error.toString(), icon: Icons.error_outline);
        _isLoading = false;
      });
    }
  }

  Widget _buildNextStageButton(TradeDetail trade, List<TradeStage> stages) {
    final nextStage = TradeStageResolver.resolveNextStage(
      stages: stages,
      completedStages: trade.completedStages,
    );

    // 取引終了済みのとき、ボタン操作不可
    if (nextStage == null) {
      return BottomActionBar(buttonText: '取引終了済');
    }

    return BottomActionBar(
      buttonText: '${nextStage.label} にする',
      onPressed: () {},
    );
  }
}
