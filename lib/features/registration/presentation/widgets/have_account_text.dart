import 'package:flutter/material.dart';

import '../../../../core/utils/color_resources.dart';
import '../../../../core/utils/themes.dart';

class AlreadyHaveAccount extends StatelessWidget {
  final VoidCallback onTap;
  String text1;
  String text2 ;

   AlreadyHaveAccount({super.key, required this.onTap , required this.text1 , required this.text2});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text(
          text1,
          style: Styles.textStyle16
        ),
        const SizedBox(width: 5,),
        GestureDetector(
          onTap: onTap,
          child: Text(
            text2,
            style: TextStyle( fontSize: 16,
              fontWeight: FontWeight.w600,
              color: ColorResources.pink,
              decoration: TextDecoration.underline,
              decorationColor: ColorResources.pink,
            ),

          ),
        ),
      ],
    );
  }
}
