import 'package:flutter/material.dart';
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
    return Padding(
      padding: const EdgeInsets.only(left: 80.0 , right: 80 , top: 20),
      child: Container(
        width: 250,
        height: 55,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFFC4609C),
              Color(0xFFEB59B3),
              Color(0xFF409C9B),
              Color(0xFF3DC1AC),
            ],
            stops: [0.0, 0.36, 0.70, 1.0],
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
            style: Styles.textStyle24,
          ),
        ),
      ),
    );
  }
}



