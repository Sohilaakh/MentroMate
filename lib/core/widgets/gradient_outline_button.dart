import 'package:flutter/material.dart';
import 'package:mentroverso/core/utils/color_resources.dart';

import '../../features/registration/presentation/widgets/gradient_text.dart';
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
    return Padding(
      padding: const EdgeInsets.only(left: 80.0, right: 80, top: 20),
      child: Container(
        width: 250,
        height: 55,
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
              color: ColorResources.gry,
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorResources.t,
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
      ),
    );
  }
}
