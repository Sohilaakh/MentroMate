import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mentroverso/core/utils/color_resources.dart';
import 'package:mentroverso/features/registration/presentation/widgets/footer.dart';
import 'package:mentroverso/features/registration/presentation/widgets/log_in_form.dart';
import 'package:mentroverso/features/registration/presentation/widgets/header.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/dialog_helper.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/use_cases/log_in_use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogInBody extends StatefulWidget {

  const LogInBody({super.key});

  @override
  State<LogInBody> createState() => _LogInBodyState();
}

class _LogInBodyState extends State<LogInBody> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();


  final TextEditingController emailController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  final logInUseCase = LogInUseCase(AuthRepositoryImpl(FirebaseAuth.instance));

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: MediaQuery.of(context).size.height * 0.90,
      width: MediaQuery.of(context).size.width * 0.88,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorResources.lightGray.withOpacity(0.25),
      ),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Header(
              text: 'Welcome back!',
            ),
            const Spacer(flex: 2),
            LogInForm(
              emailController: emailController,
              passwordController: passwordController,
            ),
            const Spacer(flex: 1),
            footer(
              text1: 'Don’t have an account?',
              text2: ' Sign up ',
              buttonAction: () async {
                if (formKey.currentState?.validate() == true) {
                  try {
                     logInUseCase(
                      emailController.text,
                      passwordController.text,
                    );

                    DialogHelper.showSuccessDialog(
                      context: context,
                      title: 'Success',
                      description: 'Welcome back',
                      onOkPress: () {
                        GoRouter.of(context).push(AppRouter.kHome);
                      },
                    );

                  } on FirebaseAuthException catch (e) {
                    String errorMessage = 'An error occurred. Please try again.';
                    if (e.code == 'invalid-credential') {
                      errorMessage = 'Invalid email or password.';
                    }

                    DialogHelper.showErrorDialog(
                      context: context,
                      title: 'Login Failed',
                      description: errorMessage,


                    );

                  } catch (e) {
                    DialogHelper.showWarningDialog(
                      context: context,
                      title: 'Error',
                      description: 'Something went wrong. Please try again.',
                    );
                  }
                }
              },
              textAction: () {
                GoRouter.of(context).push(AppRouter.kSignUp);
              },
              buttonText: 'Log in',
            ),
          ],
        ),
      ),
    );
  }
}
