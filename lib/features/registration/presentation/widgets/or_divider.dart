import 'package:flutter/material.dart';

import '../../../../core/utils/color_resources.dart';
import '../../../../core/utils/themes.dart';
class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: ColorResources.softWhite,
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'Or continue with',
            style: Styles.textStyle14
          ),
        ),
        Expanded(
          child: Divider(
            color: ColorResources.softWhite,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
