import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../core/utils/color_resources.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 120,
          height: 120,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100 ),

            child: CircleAvatar(
              backgroundColor: ColorResources.darkTransparentGray,

            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 7,
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.green,
            ),
            child: const Icon(
              LineAwesomeIcons.pen_solid,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
