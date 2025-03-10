import 'package:flutter/material.dart';
import 'package:mentroverso/core/utils/constants.dart';
import '../../../../core/utils/color_resources.dart';
import '../../../../core/utils/themes.dart';

class GrowingOptionCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Function() onTap;

  const GrowingOptionCard(
      {super.key,
      required this.title,
      required this.description,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 38,
      ),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        radius: 0,
        onTap: onTap,
        child: Row(
          children: [
            Container(
              height: Constant.getHeight(context) * 0.12,
              width: Constant.getWidth(context) * 0.23,
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
              child: Icon(
                icon,
                size: Constant.getHeight(context) * 0.05,
                color: ColorResources.softWhite,
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Styles.textStyle15.copyWith(
                      fontWeight: FontWeight.bold,
                      color: ColorResources.softWhite,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    description,
                    style: Styles.textStyle12SoftPink,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
