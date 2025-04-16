import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:mentroverso/core/utils/color_resources.dart';

class DialogHelper {
  static void showSuccessDialog({
    required BuildContext context,
    required String title,
    required String description,
    required VoidCallback onOkPress,
  }) {
    AwesomeDialog(
      animType: AnimType.scale,
      context: context,
      dialogType: DialogType.success,

      title: title,
      desc: description,
      btnOkOnPress: onOkPress,
    ).show();
  }

  static void showErrorDialog({
    required BuildContext context,
    required String title,
    required String description,
  }) {
    AwesomeDialog(
      context: context,
      btnOkColor: ColorResources.vibrantRed,
      dialogType: DialogType.error,
      animType: AnimType.scale,
      title: title,
      desc: description,
      btnOkOnPress: () {},
    ).show();
  }

  static void showWarningDialog({
    required BuildContext context,
    required String title,
    required String description,
  }) {
    AwesomeDialog(
      context: context,
      btnOkColor: ColorResources.goldenYellow,
      dialogType: DialogType.warning,
      animType: AnimType.bottomSlide,
      title: title,
      desc: description,
      btnOkOnPress: () {},
    ).show();
  }
}


