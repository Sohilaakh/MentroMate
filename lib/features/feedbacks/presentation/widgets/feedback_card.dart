import 'package:flutter/material.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/color_resources.dart';
import '../../../../core/utils/themes.dart';

class FeedbackCard extends StatelessWidget {
  const FeedbackCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 17 , top: 10 , left: 7 , right: 10),
      decoration: BoxDecoration(
        color: ColorResources.darkTransparentGray,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 5,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Image.asset(
                AssetsData.lightOn,
                height: 35,
                width: 35,
              ),
              SizedBox(width: 4,),
              Expanded(
                child: Text(
                  'Review your interview performance &',
                  style: Styles.textStyle13,
                ),
              ),
            ],
          ),
          Text(
            'gain valuable insights to improve your skills!.',
            style: Styles.textStyle13,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
