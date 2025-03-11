import 'package:flutter/material.dart';
import 'package:mentroverso/core/utils/themes.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/color_resources.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric( horizontal: 24),
      padding: const EdgeInsets.only(left: 17, top: 9,  bottom: 9,right: 12),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Expanded(
            child: Text(
              'Explore CS with an expert mentor who opens doors to your future.',
              style: Styles.textStyle13,
              maxLines: 4,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Image.asset(
              AssetsData.workspace,
              height: 50,
              width: 50,
            ),
          ),
        ],
      ),
    );
  }
}
