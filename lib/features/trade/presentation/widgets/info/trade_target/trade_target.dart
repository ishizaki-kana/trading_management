import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trading_management/core/theme/app_radius.dart';
import 'package:trading_management/core/theme/app_spacing.dart';
import 'package:trading_management/core/widgets/form/chip/app_chip.dart';
import 'package:trading_management/features/image/presentation/widgets/app_stored_image/stored_image.dart';
import 'package:trading_management/features/trade/application/models/trade_item.dart';
import 'package:trading_management/features/trade/domain/models/trade_type.dart';

/// 取引対象
///
/// 譲渡アイテム・希望アイテムを横並びに表示します。
///
/// - [offerItem] 譲渡アイテム
/// - [wantedItem] 希望アイテム
class TradeTarget extends StatelessWidget {
  //
  // fields
  //

  /// 譲渡アイテム
  final TradeItem offerItem;

  /// 希望アイテム
  final TradeItem wantedItem;

  /// 取引種別
  final TradeType tradeType;

  //
  // constructor
  //

  const TradeTarget({
    super.key,
    required this.offerItem,
    required this.wantedItem,
    required this.tradeType,
  });

  //
  // public methods
  //

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildTradeItem(offerItem, true, theme),
        Icon(Icons.compare_arrows_outlined),
        _buildTradeItem(wantedItem, false, theme),
      ],
    );
  }

  //
  // private methods
  //

  /// 取引アイテム作成
  ///
  /// - [isOffer] 譲アイテムかどうか
  /// - [theme] テーマ
  Widget _buildTradeItem(TradeItem item, bool isOffer, ThemeData theme) {
    const size = 100.0;

    final itemName = item.itemName;

    late final Widget content;

    if (tradeType == TradeType.purchase && isOffer ||
        tradeType == TradeType.transfer && !isOffer) {
      content = const SizedBox(
        width: size,
        height: size,
        child: Center(
          child: FaIcon(FontAwesomeIcons.sackDollar, color: Colors.amber),
        ),
      );
    } else {
      content = AppStoredImage(
        imageBytes: item.image?.bytes,
        width: size,
        height: size,
        borderRadius: AppRadius.sm,
      );
    }

    return Column(
      spacing: AppSpacing.s8,
      children: [
        content,
        if (itemName != null && itemName.isNotEmpty)
          AppChip(
            label: itemName,
            color: theme.scaffoldBackgroundColor,
            labelStyle: theme.textTheme.bodySmall,
          ),
      ],
    );
  }
}
