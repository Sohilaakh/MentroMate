import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mentroverso/core/utils/color_resources.dart';
import 'package:mentroverso/features/registration/presentation/widgets/footer.dart';
import 'package:mentroverso/features/registration/presentation/widgets/log_in_form.dart';
import 'package:mentroverso/features/registration/presentation/widgets/header.dart';
import '../../../../core/utils/app_routes.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/use_cases/log_in_use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogInBody extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController =
      TextEditingController();
  final TextEditingController passwordController =
      TextEditingController();

  // Use case and repo for login logic
  final logInUseCase = LogInUseCase(AuthRepositoryImpl(FirebaseAuth.instance));

  LogInBody({super.key});

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
                    final credential = await logInUseCase(
                      emailController.text,
                      passwordController.text,
                    );
                    print('User logged in: ${credential.user?.email}');

                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'invalid-credential') {
                      print('No user found for that email or wrong password.');
                    }
                  } catch (e) {
                    print('Error: $e');
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
