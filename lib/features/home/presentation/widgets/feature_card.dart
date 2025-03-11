import 'package:flutter/material.dart';

import '../../../../core/utils/color_resources.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/themes.dart';

class FeatureCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final VoidCallback onTap;

  const FeatureCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23.0),
        child: Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          height: Constant.getHeight(context) * 0.136,
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorResources.lightTransparentGray,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(38),
                blurRadius: 4,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: 0.1,
                height: double.infinity,
                color: ColorResources.softWhite,
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        title,
                        style: Styles.textStyle15,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        description,
                        style: Styles.textStyle12,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
