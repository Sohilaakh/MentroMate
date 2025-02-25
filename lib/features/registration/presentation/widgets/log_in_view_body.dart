import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/color_resources.dart';
import '../../../../core/utils/themes.dart';
import '../../../../core/widgets/text_field.dart';
import 'SignUpGradientButton.dart';
import 'have_account_text.dart';
import 'icons_row.dart';
import 'or_divider.dart';

class LogInBody extends StatelessWidget {
  const LogInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: MediaQuery.of(context).size.height * 0.90,
      width: MediaQuery.of(context).size.width * 0.88,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorResources.gry3.withOpacity(0.25),
      ),
      child: Column(
        children: [
          Row(
            children: [
              InkWell(
                child: Icon(
                  Icons.arrow_back_ios,
                  color: ColorResources.white,
                  size: 18,
                ),
                onTap: () {
                  GoRouter.of(context).pop(AppRouter.router);
                },
              ),
              Text(
                'Welcome back!',
                style: Styles.textStyle20,
              )
            ],
          ),
          const Spacer(flex: 2,),
          CustomTextFormField(
            text: 'Email',
            label: 'Enter your email',
          ),
          CustomTextFormField(
            text: 'Password',
            label: 'Enter your password',
          ),
          const Spacer(flex: 1,),
          const SizedBox(height: 16),
          const OrDivider(),
          const SizedBox(height: 8),
          const IconsRow(),
          AlreadyHaveAccount(
            onTap: () {
              GoRouter.of(context).push(AppRouter.kSignUp);
            }, text1: 'Don’t have an account? ', text2: 'Sign up ',
          ),
          const Spacer(),
          SignUpGradientButton(
            text: "Log in",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
