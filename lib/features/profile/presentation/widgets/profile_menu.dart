import 'package:flutter/material.dart';
import 'package:mentroverso/core/utils/themes.dart';
import '../../../../core/utils/color_resources.dart';
import '../../../../core/utils/constants.dart';

class ProfileMenuItem extends StatelessWidget {
  final String title;
  final IconData? icon;
  final String? imagePath; // إضافة دعم للصور
  final VoidCallback onPress;

  const ProfileMenuItem({
    super.key,
    required this.title,
    this.icon,
    this.imagePath,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      borderRadius: BorderRadius.circular(10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: ColorResources.lightTransparentGray,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: imagePath != null
                ? Image.asset(
              imagePath!,
              width: Constant.getHeight(context) * 0.04,
              height: Constant.getHeight(context) * 0.04,
              fit: BoxFit.cover,
            )
                : Icon(
              icon,
              size: Constant.getHeight(context) * 0.04,
              color: ColorResources.softWhite,
            ),
          ),
          const SizedBox(width: 13),
          Text(
            title,
            style: Styles.textStyle15,
          ),
        ],
      ),
    );
  }
}
