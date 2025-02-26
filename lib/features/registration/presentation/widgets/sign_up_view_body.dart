import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mentroverso/core/utils/color_resources.dart';
import 'package:mentroverso/features/registration/presentation/widgets/footer.dart';
import 'package:mentroverso/features/registration/presentation/widgets/sign_up_form.dart';
import 'package:mentroverso/features/registration/presentation/widgets/sign_up_header.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/constants.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController facultyController = TextEditingController();
  final TextEditingController majorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Constant.getHeight(context) * 0.90,
      width: Constant.getWidth(context) * 0.88,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorResources.gry3.withOpacity(0.25),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SignUpHeader(),
            SignUpForm(
              firstNameController: firstNameController,
              lastNameController: lastNameController,
              emailController: emailController,
              passwordController: passwordController,
              confirmPasswordController: confirmPasswordController,
              facultyController: facultyController,
              majorController: majorController,
            ),
            footer(
              text1: 'Already have an account? ',
              text2: 'Log in',
              buttonAction: () {
                // GoRouter.of(context).push(AppRouter.kHome);

              },
              textAction: () {
                GoRouter.of(context).push(AppRouter.kLogIn);

              }, buttonText: 'Sign up',

            ),
          ],
        ),
      ),
    );
  }
}
