import 'package:flutter/material.dart';
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
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0x001c1a1d),
            Color(-870829007),
          ],
          stops: [0.0, 1.0],
          begin: Alignment.topLeft,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0, left: 24 , right: 24 , ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CircleAvatar(backgroundColor: ColorResources.darkTransparentGray),
            if (icon != null)
              IconButton(
                onPressed: onPressed,
                icon: icon!,
              ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
