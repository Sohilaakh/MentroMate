import 'package:flutter/material.dart';
import 'package:mentroverso/core/utils/color_resources.dart';
import 'package:mentroverso/core/utils/themes.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData? icon;
  final VoidCallback? onIconPressed;

  const CustomAppBar({
    super.key,
    required this.title,
    this.icon,
    this.onIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorResources.darkTransparentGray,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(icon ?? Icons.arrow_back_ios , color: Colors.white),
        onPressed: onIconPressed ?? () => Navigator.of(context).pop(),
      ),
      title: Text(
        title,
        style: Styles.textStyle18,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
