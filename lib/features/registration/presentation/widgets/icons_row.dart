import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mentroverso/core/utils/color_resources.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/app_routes.dart';
import 'package:mentroverso/core/utils/auth_service.dart';


class IconsRow extends StatelessWidget {
   IconsRow({super.key});


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon:  FaIcon(FontAwesomeIcons.google,
              color: ColorResources.darkMauve, size: 30),
          onPressed: () async {
            final AuthService authService = AuthService();
            User? user = await authService.signInWithGoogle();
            if (user != null) {
              if (context.mounted) {
                print("registered, ${user.email}");
                GoRouter.of(context).push(AppRouter.kHome);
              }
            } else {
              print("User sign-in failed".trim());
            }




          },
        ),
        const SizedBox(width: 20),
        IconButton(
          icon: FaIcon(FontAwesomeIcons.facebook,
              color: ColorResources.darkMauve, size: 30),
          onPressed: () async {
            final AuthService authService = AuthService();
            UserCredential? userCredential = await authService.signInWithFacebook();
            if (userCredential != null) {
              print("User signed in: ${userCredential.user?.displayName}");
              GoRouter.of(context).push(AppRouter.kHome);
            } else {
              print("Facebook login failed.");
            }

          },
        ),
      ],
    );
  }
}
