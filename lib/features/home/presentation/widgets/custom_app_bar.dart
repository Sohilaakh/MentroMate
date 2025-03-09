import 'package:flutter/material.dart';
import 'package:mentroverso/core/utils/color_resources.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final double height;
  final bool showLogo;
  final Function()? onPressed;
  final Widget? icon;
  final CircleAvatar? circleAvatar;

  const CustomAppBar(
      {super.key,
      this.circleAvatar,
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
      decoration: BoxDecoration(
        color: ColorResources.transparentBlack,

      ),
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 10.0,
          left: 24,
          right: 24,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (circleAvatar != null)

            CircleAvatar(

                backgroundColor: ColorResources.darkTransparentGray,

                child: circleAvatar),
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
