import 'package:flutter/material.dart';
import 'package:mentroverso/core/utils/constants.dart';
import 'package:mentroverso/core/utils/themes.dart';

import '../utils/color_resources.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const GradientButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constant.getWidth(context)*0.6,
      height: Constant.getHeight(context)*0.07,
      decoration: BoxDecoration(
        gradient:  LinearGradient(
          colors: [
            ColorResources.darkMauve,
            ColorResources.forestGreen,
          ],
          stops: [0.0,1.0],
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow:  [
          BoxShadow(
            color: ColorResources.darkGray,
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),

      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          text,
          style: Styles.textStyle20,
        ),
      ),
    );
  }
}



