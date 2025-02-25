import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mentroverso/core/utils/color_resources.dart';

class IconsRow extends StatelessWidget {
  const IconsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon:  FaIcon(FontAwesomeIcons.google,
              color: ColorResources.pink, size: 30),
          onPressed: () {
          },
        ),
        const SizedBox(width: 20),
        IconButton(
          icon: FaIcon(FontAwesomeIcons.facebook,
              color: ColorResources.pink, size: 30),
          onPressed: () {
          },
        ),
      ],
    );
  }
}
