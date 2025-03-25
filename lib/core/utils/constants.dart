import 'package:flutter/material.dart';

abstract class Constant {

  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

 static const  String apiKey = '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';
}