import 'package:flutter/material.dart';
import 'package:mentroverso/core/utils/color_resources.dart';
import 'package:mentroverso/core/utils/constants.dart';


class CustomGradientCircle extends StatelessWidget {
  const CustomGradientCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Constant.getHeight(context)*0.33,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            Color(0xA9EB59B3),
            Color(0xB8C4609C),
            Color(0xFF3DC1AC),
            Color(0xCD409C9B),  ],
          stops: [0.0, 0.34, 0.69, 1.0],
          begin: Alignment.topCenter,
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(5.0),
        decoration:  BoxDecoration(
          shape: BoxShape.circle,
          color: ColorResources.mutedGray,
          
        ),
      ),
    );
  }
}
