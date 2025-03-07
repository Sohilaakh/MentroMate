import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/color_resources.dart';
import '../../../../core/utils/themes.dart';

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorResources.lightTransparentGray,
            side: BorderSide.none,
            shape: const StadiumBorder()
        ),
        onPressed: () {
          GoRouter.of(context).push(AppRouter.kUpdateProfileView);
        },
        child: Text(
          'Edit Profile',
          style: Styles.textStyle15,
        ),
      ),
    );
  }
}
