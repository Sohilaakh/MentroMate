import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentroverso/core/utils/color_resources.dart';

abstract class Styles {
  static TextStyle textStyle24 = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: ColorResources.softWhite,
  );

  static TextStyle textStyle20 = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: ColorResources.softWhite,
  );

  static TextStyle textStyle12 = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: ColorResources.neutralGray,
  );


  static TextStyle textStyle13 = GoogleFonts.poppins(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: ColorResources.softWhite,
  );
  static TextStyle textStyle14SoftPink = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ColorResources.softPinkishWhite,
  );
  static TextStyle textStyle14 = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: ColorResources.softWhite,
  );

  static TextStyle textStyle14Regular = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ColorResources.softWhite,
  );

  static TextStyle textStyle15 = GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: ColorResources.softWhite,
      shadows: [
        Shadow(
          color: Colors.black.withAlpha(26),
          offset: const Offset(1, 1),
          blurRadius: 2,
        ),
      ]

  );

  static TextStyle textStyle16DeepPink = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: ColorResources.darkMauve,
    decoration: TextDecoration.underline,
    decorationColor: ColorResources.darkMauve,
  );

  static TextStyle textStyle12SoftPink = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: ColorResources.softPinkishWhite,
      shadows: [
        Shadow(
          color: Colors.black.withAlpha(26),
          offset: const Offset(1, 1),
          blurRadius: 2,
        ),
      ]

  );

  static TextStyle textStyle18 = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: ColorResources.softWhite,
  );
}
