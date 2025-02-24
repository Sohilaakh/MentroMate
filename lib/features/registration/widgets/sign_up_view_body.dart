import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mentroverso/core/utils/color_resources.dart';
import 'package:mentroverso/core/utils/themes.dart';
import 'package:mentroverso/core/widgets/text_field.dart';
import '../../../core/utils/app_routes.dart';
import 'SignUpGradientButton.dart';
import 'build_gender_option.dart';
import 'have_account_text.dart';
import 'icons_row.dart';
import 'or_divider.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric( vertical: 12),
            child: Row(
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
                  'Create an account',
                  style: Styles.textStyle20,
                )
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  text: 'First name',
                  label: 'First name',
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: CustomTextFormField(
                  text: 'Last name',
                  label: 'Last name',
                ),
              ),
            ],
          ),
          CustomTextFormField(
            text: 'Email',
            label: 'Enter your email',
          ),
          CustomTextFormField(
            text: 'Password',
            label: 'Enter your password',
          ),
          CustomTextFormField(
            text: 'Confirm Password',
            label: 'Confirm your password',
          ),
          CustomTextFormField(
            text: 'Faculty',
            label: 'Enter your Faculty',
          ),
          CustomTextFormField(
            text: 'Major',
            label: 'Enter your Major',
          ),
          const SizedBox(
            height: 8,
          ),
          GenderPicker(
            onGenderSelected: (String) {},
          ),
          const SizedBox(height: 8),
          const OrDivider(),
          const SizedBox(height: 8),
          const IconsRow(),
          const SizedBox(height: 8),
          AlreadyHaveAccount(
            onTap: () {
              GoRouter.of(context).push(AppRouter.kLogIn);
            },

          ),
          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SignUpGradientButton(
                text: "Sign up",
                onPressed: () {
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

