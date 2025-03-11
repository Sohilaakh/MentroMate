import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_routes.dart';
import '../../../../core/widgets/gradient_button.dart';
import '../../../../core/widgets/gradient_outline_button.dart';
import '../../../../core/widgets/custom_gradient_circle.dart';
import 'guest_text.dart';

class AuthViewBody extends StatelessWidget {
  const AuthViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const CustomGradientCircle(),
        const SizedBox(height: 50),
        GradientButton(
          text: 'Sign up',
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kSignUp);

          },
        ),
        GradientOutlineButton(
          text: 'Log In',

          onPressed: () {
            GoRouter.of(context).push(AppRouter.kLogIn);
          },
        ),
        const SizedBox(height: 30),
        ContinueAsGuestText(
          onTap: () {

          },
        )
      ],
    );
  }
}

