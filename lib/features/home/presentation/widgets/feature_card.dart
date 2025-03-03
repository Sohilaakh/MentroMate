import 'package:flutter/material.dart';
import 'package:mentroverso/core/utils/color_resources.dart';
import 'package:mentroverso/core/utils/constants.dart';
import 'package:mentroverso/core/utils/themes.dart';

class FeatureCard extends StatelessWidget {
   String imagePath;
   String title;
   String description;
  Function() onTap;

   FeatureCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric( horizontal: 24),
      padding: const EdgeInsets.only(left: 17, top: 9, bottom: 9, right: 12),
      height: Constant.getHeight(context)* 0.136,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorResources.lightTransparentGray,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        radius: 0,

        onTap: onTap,
        child: Row(
          children: [
            Expanded(
              child: Image.asset(
                imagePath,

              ),
            ),
            Container(
              width: 0.1,
              height: double.infinity,
              color: ColorResources.softWhite,
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      title,
                      style: Styles.textStyle16,

                    ),
                    Text(
                      description,
                      style: Styles.textStyle13,

                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
