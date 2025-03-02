import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final double height;
  final bool showLogo;

  const CustomAppBar({
    super.key,
    this.title,
    this.height = 60,
    this.showLogo = true,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: height,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 36.0),
        decoration: const BoxDecoration(
          gradient:LinearGradient (
              colors: [
                Color(0x001c1a1d),
                Color(-870829007),
              ],
              stops: [0.0, 1.0],

            begin: Alignment.topLeft,
          ),
        ),

        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
