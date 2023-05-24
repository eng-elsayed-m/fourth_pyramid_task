import 'package:flutter/material.dart';
import 'package:fourth_pyramid_task/core/consts/consts.dart';

class AssetIcon extends StatelessWidget {
  final String asset;
  final double size;
  const AssetIcon(
      {super.key, required this.asset, this.size = Pding.paddingL * 2});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      asset,
      width: size,
      height: size,
    );
  }
}
