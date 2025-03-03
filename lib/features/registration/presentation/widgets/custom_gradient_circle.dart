import 'package:flutter/material.dart';
import 'package:mentroverso/core/utils/color_resources.dart';

import '../../../../core/utils/assets.dart';

class CustomGradientCircle extends StatelessWidget {
  const CustomGradientCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 280,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            Color(0xFFEB59B3),
            Color(0xFFC4609C),
            Color(0xFF3DC1AC),
            Color(0xFF409C9B),
          ],
          stops: [0.0, 0.34, 0.69, 1.0],
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(7.0),
        decoration:  BoxDecoration(
          shape: BoxShape.circle,
          color: ColorResources.mutedGray,
          
        ),
      ),
    );
  }
}
