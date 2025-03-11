import 'package:flutter/material.dart';

import '../../../../core/utils/color_resources.dart';
import '../../../../core/utils/themes.dart';

class AlreadyHaveAccount extends StatelessWidget {
  final VoidCallback onTap;
  final String text1;
  final String text2 ;

   const AlreadyHaveAccount({super.key, required this.onTap , required this.text1 , required this.text2});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text(
          text1,
          style: Styles.textStyle13
        ),
        const SizedBox(width: 3,),
        GestureDetector(
          onTap: onTap,
          child: Text(
            text2,
            style: TextStyle( fontSize: 14,
              fontWeight: FontWeight.w600,
              color: ColorResources.darkMauve,
              decoration: TextDecoration.underline,
              decorationColor: ColorResources.darkMauve,
            ),

          ),
        ),
      ],
    );
  }
}
