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