import 'package:flutter/material.dart';

import '../../../core/utils/color_resources.dart';
import '../../../core/utils/themes.dart';

class AlreadyHaveAccount extends StatelessWidget {
  final VoidCallback onTap;

  const AlreadyHaveAccount({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text(
          "Already have an account?",
          style: Styles.textStyle16
        ),
        const SizedBox(width: 5,),
        GestureDetector(
          onTap: onTap,
          child: Text(
            " Log in",
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
