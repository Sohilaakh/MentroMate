import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mentroverso/core/utils/color_resources.dart';
import 'package:mentroverso/features/registration/presentation/widgets/footer.dart';
import 'package:mentroverso/features/registration/presentation/widgets/sign_up_form.dart';
import 'package:mentroverso/features/registration/presentation/widgets/header.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/dialog_helper.dart';
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

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController facultyController = TextEditingController();
  final TextEditingController majorController = TextEditingController();

  final signUpUseCase = SignUpUseCase(AuthRepositoryImpl(FirebaseAuth.instance));

  Future<void> _signUp() async {
    if (formKey.currentState?.validate() != true) return;

    try {
      await signUpUseCase(
        emailController.text,
        passwordController.text,
      );
      if (!mounted) return;
      _showSuccessDialog();
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;
      _handleAuthError(e);
    } catch (e) {
      if (!mounted) return;
      _showGenericError();
    }
  }

  void _showSuccessDialog() {
    DialogHelper.showSuccessDialog(
      context: context,
      title: 'Account Created',
      description: 'Welcome, Your account has been successfully created.',
      onOkPress: () {
        if (mounted) {
          GoRouter.of(context).push(AppRouter.kHome);
        }
      },
    );
  }

  void _handleAuthError(FirebaseAuthException e) {
    if (e.code == 'email-already-in-use') {
      DialogHelper.showErrorDialog(
        context: context,
        title: 'Sign Up Failed',
        description: 'This email is already linked to another account. Please use a different email.',
      );
    }
  }

  void _showGenericError() {
    DialogHelper.showWarningDialog(
      context: context,
      title: 'Error',
      description: 'Something went wrong. Please try again.',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Constant.getHeight(context) * 0.90,
      width: Constant.getWidth(context) * 0.88,
      padding: const EdgeInsets.all(15),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorResources.lightGray.withAlpha(64),
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
              Footer(
                text1: 'Already have an account? ',
                text2: 'Log in',
                textAction: () {
                  if (mounted) {
                    GoRouter.of(context).push(AppRouter.kLogIn);
                  }
                },
                buttonText: 'Sign up',
                buttonAction: _signUp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
