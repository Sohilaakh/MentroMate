import 'package:flutter/material.dart';
import 'package:mentroverso/core/utils/color_resources.dart';

import '../../features/registration/presentation/widgets/gradient_text.dart';
import '../utils/constants.dart';
import '../utils/themes.dart';

class GradientOutlineButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const GradientOutlineButton({
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
        gradient: const LinearGradient(
          colors: [
            Color(0xFFEB59B3),
            Color(0xFFC4609C),
            Color(0xFF3DC1AC),
            Color(0xFF409C9B),
          ],
          stops: [0.0, 0.34, 0.69, 1.0],
        ),
        boxShadow: [
          BoxShadow(
            color: ColorResources.darkGray,
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorResources.pureBlack,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: GradientText(
            text: text,
            style: Styles.textStyle24,
            gradient: const LinearGradient(
              colors: [
                Color(0xFFEB59B3),
                Color(0xFFC4609C),
                Color(0xFF3DC1AC),
                Color(0xFF409C9B),
              ],
              stops: [0.0, 0.34, 0.69, 1.0],
            ),
          ),
        ),
      ),
    );
  }
}
