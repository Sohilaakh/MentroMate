import 'package:flutter/material.dart';
import 'package:mentroverso/core/utils/assets.dart';
import 'package:mentroverso/core/utils/color_resources.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final double height;
  final bool showLogo;
  final Function()? onPressed;
  final Widget? icon;

  const CustomAppBar(
      {super.key,
      this.title,
      this.height = 90,
      this.showLogo = true,
      this.onPressed,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
   color: ColorResources.transparentBlack,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0, left: 24 , right: 24 , ),
        child: Image.asset(AssetsData.mentroverse , fit: BoxFit.fill,)
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
