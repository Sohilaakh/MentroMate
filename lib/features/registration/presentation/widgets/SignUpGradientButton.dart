import 'package:flutter/material.dart';

import '../../../../core/utils/themes.dart';


class FooterGradientButton extends StatelessWidget {
  final String buttontext;
  final VoidCallback onPressed;

  const FooterGradientButton({super.key , required this.buttontext,
    required this.onPressed,});

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF76335C),
            Color(0xFFDC5FAC),
          ],
          stops: [0.0,  1.0],
          begin: Alignment.bottomRight,
          end: Alignment.centerLeft,
        ),
        borderRadius: BorderRadius.circular(4),
        boxShadow:  const [
        ],
      ),

      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shadowColor:Colors.transparent ,
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: Text(
          buttontext,
          style: Styles.textStyle16,
        ),
      ),
    );
  }
}
