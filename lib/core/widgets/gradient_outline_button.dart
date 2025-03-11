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
    final containerGradient = const LinearGradient(
      colors: [
        Color(0xA9EB59B3),
        Color(0xB8C4609C),
        Color(0xFF3DC1AC),
        Color(0xCD409C9B),
      ],
      stops: [0.0, 0.34, 0.69, 1.0],
    );

    final buttonGradient = const LinearGradient(
      colors: [
        Color(0xFF27111E),
        Color(0xFF132223)

      ],
      stops: [0.0, 1.0],
    );

    return Container(
      width: Constant.getWidth(context) * 0.6,
      height: Constant.getHeight(context) * 0.07,
      decoration: BoxDecoration(
        gradient: containerGradient,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: ColorResources.darkGray,
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Ink(
            decoration: BoxDecoration(
              gradient: buttonGradient,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Container(
              alignment: Alignment.center,
              child: GradientText(
                text: text,
                style: Styles.textStyle24,
                gradient: containerGradient,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
