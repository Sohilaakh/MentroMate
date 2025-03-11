import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/widgets/gradient_button.dart';
import '../../../../core/widgets/gradient_outline_button.dart';
import '../../../../core/widgets/custom_gradient_circle.dart';

class AuthViewBody extends StatelessWidget {
  const AuthViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: Constant.getHeight(context) * 0.25),

        CustomGradientCircle(),
        Spacer(flex: 1,),

        GradientButton(
          text: 'Sign up',
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kSignUp);

          },
        ),
        SizedBox(height: 20,),
        // const SizedBox(height: 50),
        GradientOutlineButton(
          text: 'Log In',

          onPressed: () {
            GoRouter.of(context).push(AppRouter.kLogIn);
          },
        ),
        Spacer(flex: 2,),


      ],
    );
  }
}

