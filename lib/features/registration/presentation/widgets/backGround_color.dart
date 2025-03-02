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
            ColorResources.deepPink,
            ColorResources.darkGray,
            ColorResources.forestGreen,
            ColorResources.darkGray,
          ],
          stops: const [0.19, 0.34, 0.61, .73, 0.98],
          center: Alignment.center,

          // Full circle
        ),
      ),
    );
  }
}
