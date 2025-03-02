import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mentroverso/features/home/presentation/widgets/info_card.dart';

import '../../../../core/utils/color_resources.dart';
import '../../../../core/utils/constants.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 21,
          ),
          const InfoCard(),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
            padding:
                const EdgeInsets.only(left: 17, top: 9, bottom: 9, right: 12),
            height: Constant.getHeight(context) * 0.136,
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorResources.lightTransparentGray,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
