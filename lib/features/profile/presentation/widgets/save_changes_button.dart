import 'package:flutter/material.dart';
import 'package:mentroverso/core/utils/color_resources.dart';

import '../../../../core/utils/themes.dart';
import '../../../registration/presentation/widgets/gradient_text.dart';

class SaveChangesButton extends StatelessWidget {
  const SaveChangesButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          onPressed: (){},
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorResources.wineRed,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: GradientText(
            text: 'text',
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
