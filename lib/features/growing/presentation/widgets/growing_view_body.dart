import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mentroverso/core/utils/assets.dart';
import 'package:mentroverso/core/utils/themes.dart';

import '../../../../core/utils/color_resources.dart';
import 'motivational_banner.dart';

class GrowingViewBody extends StatelessWidget {
  const GrowingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 36,),
          MotivationalBanner()

        ],
      ),
    );
  }
}

