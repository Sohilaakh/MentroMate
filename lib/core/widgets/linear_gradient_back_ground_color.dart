import 'package:flutter/cupertino.dart';

class LinearGradientBackGroundColor extends StatelessWidget {

  AlignmentGeometry beginColor;
  AlignmentGeometry endColor;
   LinearGradientBackGroundColor({super.key ,  required this.beginColor , required this.endColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient:LinearGradient (
            colors: const [
              Color(0xFF1C1A1D), // 0%
              Color(0xFF76335C), // 20%
              Color(0xFF1A191C), // 49%
              Color(0xFF145E53), // 73%
              Color(0xFF1A191C), // 100%
            ],
            stops: const [0.0, 0.2, 0.49, 0.73, 1.0],

          begin: beginColor,
          end: endColor
          // begin: Alignment.topLeft,
          // end: Alignment.bottomRight,
          // Full circle
        ),
      ),
    );
  }
}
