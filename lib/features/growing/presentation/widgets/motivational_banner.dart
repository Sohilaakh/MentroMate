import 'package:flutter/material.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/color_resources.dart';
import '../../../../core/utils/themes.dart';

class MotivationalBanner extends StatelessWidget {
  const MotivationalBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 25 ,right: 25 ,top: 13,bottom: 13),
          margin: const EdgeInsets.only(left: 60, right: 35),
          decoration: BoxDecoration(
            color: ColorResources.darkTransparentGray,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 4,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Text('Keep Learning, Keep Growing!',style: Styles.textStyle15,),
        ),
        Positioned(
            bottom: -3,
            left: 37,

            child: Image.asset(AssetsData.sprout , height: 45,)
        ),
      ],
    );
  }
}
