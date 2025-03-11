import 'package:flutter/material.dart';
import 'footer_gradient_button.dart';
import 'have_account_text.dart';
import 'or_divider.dart';
import 'icons_row.dart';

class Footer extends StatelessWidget {
  final String text1;
  final String text2;
  final String buttonText;
  final Future<void> Function() buttonAction;
  final Function() textAction;

  const Footer({
    super.key,
    required this.text1,
    required this.text2,
    required this.buttonAction,
    required this.textAction,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 22),
        const OrDivider(),
        const SizedBox(height: 8),
        const IconsRow(),
        const SizedBox(height: 8),
        AlreadyHaveAccount(
          onTap: textAction,
          text1: text1,
          text2: text2,
        ),
        const SizedBox(height: 23),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FooterGradientButton(
              onPressed: buttonAction,
              buttonText: buttonText,
            ),
          ],
        ),
      ],
    );
  }
}
