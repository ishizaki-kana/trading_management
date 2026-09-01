import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/core/widgets/display/image/app_image/app_network_image.dart';

const _group = 'display/image/app_network_image';

@AppPreview(name: 'network image states', group: _group, size: Size(360, 190))
Widget preview() {
  return const Scaffold(
    body: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AppNetworkImage(
            imageUrl: null,
            width: 120,
            height: 120,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          AppNetworkImage(
            imageUrl:
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
            width: 120,
            height: 120,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ],
      ),
    ),
  );
}
