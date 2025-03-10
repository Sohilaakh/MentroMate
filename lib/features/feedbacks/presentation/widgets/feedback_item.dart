import 'package:flutter/material.dart';
import 'package:mentroverso/core/utils/constants.dart';
import 'package:mentroverso/core/utils/themes.dart';

import '../../../../core/utils/color_resources.dart';

class FeedbackItem extends StatelessWidget {
  final Function() onTap;
  final String text;
  const FeedbackItem({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Row(
          children: [
            Container(
              width: Constant.getWidth(context) * 0.2,
              height: Constant.getHeight(context) * 0.08,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    ColorResources.deepPink,
                    ColorResources.softWhite,
                  ],
                  stops: [0.0, 1.0],
                  end: Alignment.bottomLeft,
                  begin: Alignment.topRight,
                ),
              ),
              child: Container(
                margin: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorResources.softWhite1,
                ),
                child: Icon(
                  Icons.message,
                  size: 30,
                  color: ColorResources.deepPink,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: Styles.textStyle14,
            )
          ],
        ),
      ),
    );
  }
}
