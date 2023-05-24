import 'package:flutter/material.dart';
import 'package:fourth_pyramid_task/core/consts/assets.dart';
import 'package:fourth_pyramid_task/core/consts/consts.dart';
import 'package:fourth_pyramid_task/core/shared_widgets/asset_icon.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const AssetIcon(
      asset: AppAssets.loader,
      size: Pding.paddingXXL * 3,
    );
  }
}
