import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trading_management/core/theme/app_spacing.dart';
import 'package:trading_management/core/widgets/display/image/stored_image.dart';
import 'package:trading_management/features/trade/application/models/trade_item.dart';
import 'package:trading_management/features/trade/domain/models/trade_type.dart';

/// 取引対象
///
/// 譲渡アイテム・希望アイテムを横並びに表示します。
///
/// - [offerItem] 譲渡アイテム
/// - [wantedItem] 希望アイテム
/// - [tradeType] 取引種別
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _buildTradeItem(offerItem, true, context)),
        SizedBox(
          width: AppSpacing.s32,
          child: Icon(
            Icons.compare_arrows_outlined,
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        Expanded(child: _buildTradeItem(wantedItem, false, context)),
      ],
    );
  }

  //
  // private methods
  //

  /// 取引アイテム作成
  ///
  /// - [isOffer] 譲アイテムかどうか
  Widget _buildTradeItem(TradeItem item, bool isOffer, BuildContext context) {
    final theme = Theme.of(context);
    final itemName = item.itemName;
    final hasMoneyIcon =
        (tradeType == TradeType.purchase && isOffer) ||
        (tradeType == TradeType.transfer && !isOffer);

    return LayoutBuilder(
      builder: (context, constraints) {
        final imageSize = constraints.maxWidth.clamp(0.0, 100.0).toDouble();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: AppSpacing.s8,
          children: [
            Center(
              child: SizedBox(
                width: imageSize,
                height: imageSize,
                child: hasMoneyIcon
                    ? const Center(
                        child: FaIcon(
                          FontAwesomeIcons.sackDollar,
                          color: Colors.amber,
                        ),
                      )
                    : AppStoredImage(
                        imageBytes: item.image?.bytes,
                        width: imageSize,
                        height: imageSize,
                      ),
              ),
            ),
            if (itemName != null && itemName.isNotEmpty)
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: constraints.maxWidth),
                child: Chip(
                  label: Text(itemName),
                  backgroundColor: theme.scaffoldBackgroundColor,
                ),
              ),
          ],
        );
      },
    );
  }
}
