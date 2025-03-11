import 'package:flutter/material.dart';
import 'package:mentroverso/core/utils/assets.dart';
import 'package:mentroverso/core/utils/color_resources.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {

  const HomeAppBar({super.key,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: AppBar(
        backgroundColor: ColorResources.transparentBlack,
        surfaceTintColor: ColorResources.transparentBlack,
        leading: Transform.translate(
          offset: const Offset(17, 0),
          child: Image.asset(AssetsData.mentroverse),
        ),
        centerTitle: true,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
