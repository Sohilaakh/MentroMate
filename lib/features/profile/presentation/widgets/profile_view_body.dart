import 'package:flutter/material.dart';
import 'package:mentroverso/core/utils/assets.dart';
import 'package:mentroverso/core/utils/color_resources.dart';
import '../../../../core/utils/constants.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 120,
          height: 120,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              AssetsData.facebook,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.green,
            ),
          ),
        ),
      ],
    );
  }
}
