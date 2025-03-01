import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mentroverso/core/utils/color_resources.dart';
import 'package:mentroverso/features/registration/presentation/widgets/footer.dart';
import 'package:mentroverso/features/registration/presentation/widgets/sign_up_form.dart';
import 'package:mentroverso/features/registration/presentation/widgets/header.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/constants.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/use_cases/sign_up_use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final formKey = GlobalKey<FormState>();

  // Controllers for form fields
  final TextEditingController firstNameController = TextEditingController(text: 'somaya');
  final TextEditingController lastNameController = TextEditingController(text: 'saeed');
  final TextEditingController emailController = TextEditingController(text :'somayasaeid75@gmail.com');
  final TextEditingController passwordController = TextEditingController(text: '123456');
  final TextEditingController confirmPasswordController =
      TextEditingController(text: '123456');
  final TextEditingController facultyController = TextEditingController(text: 'ss');
  final TextEditingController majorController = TextEditingController(text: 'ee');

  final signUpUseCase =
      SignUpUseCase(AuthRepositoryImpl(FirebaseAuth.instance));

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
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Header(
                text: 'Create an account',
              ),
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
                textAction: () {
                  GoRouter.of(context).push(AppRouter.kLogIn);
                },
                buttonText: 'Sign up',
                buttonAction: () async {
                  if (formKey.currentState?.validate() == true) {
                    try {
                      final credential = await signUpUseCase(
                        emailController.text,
                        passwordController.text,
                      );
                      print('User signed up: ${credential.user?.email}');
                    }
                    on FirebaseAuthException catch (e) {
                      if (e.code == 'email-already-in-use') {
                        print('The email address is already in use by another account.');
                      }
                    }
                    catch (e) {
                      print('Error: $e');
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
