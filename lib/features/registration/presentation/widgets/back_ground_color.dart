
import 'package:flutter/cupertino.dart';
import 'package:mentroverso/core/utils/color_resources.dart';

class BackGroundColor extends StatelessWidget {
  const BackGroundColor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: SweepGradient(
          colors: [
            ColorResources.pureBlack,
            ColorResources.darkMauve,
            ColorResources.darkGray,
            ColorResources.forestGreen,
            ColorResources.darkGray,
          ],
          stops: const [0.05, 0.30, 0.61, .79, 1],
          center: Alignment.center,
            transform:GradientRotation(2)


          // Full circle
        ),
      ),
    );
  }
}
