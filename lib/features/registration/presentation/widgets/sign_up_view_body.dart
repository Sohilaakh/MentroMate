import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mentroverso/core/utils/app_routes.dart';
import 'package:mentroverso/core/utils/color_resources.dart';
import 'package:mentroverso/core/utils/constants.dart';
import 'package:mentroverso/core/utils/dialog_helper.dart';
import 'package:mentroverso/features/registration/data/repositories/auth_repository_impl.dart';
import 'package:mentroverso/features/registration/domain/use_cases/sign_up_use_case.dart';
import 'package:mentroverso/features/registration/presentation/widgets/footer.dart';
import 'package:mentroverso/features/registration/presentation/widgets/header.dart';
import 'package:mentroverso/features/registration/presentation/widgets/sign_up_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../profile/domain/repositories/user_repository_impl.dart';
import '../../bloc/profile_bloc.dart';
import '../../bloc/profile_event.dart';
import '../../bloc/profile_state.dart';

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
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController facultyController = TextEditingController();
  final TextEditingController majorController = TextEditingController();

  String gender = 'male'; // Default gender

  late final SignUpBloc signUpBloc;

  @override
  void initState() {
    super.initState();
    final authRepository = AuthRepositoryImpl(FirebaseAuth.instance);
    final userRepository = UserRepositoryImpl(FirebaseFirestore.instance);
    final signUpUseCase = SignUpUseCase(authRepository, userRepository);
    signUpBloc = SignUpBloc(signUpUseCase);
  }

  void _signUp() {
    if (formKey.currentState?.validate() == true) {
      signUpBloc.add(SignUpRequested(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        faculty: facultyController.text.trim(),
        major: majorController.text.trim(),
        gender: gender,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: signUpBloc,
      child: BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            DialogHelper.showSuccessDialog(
              context: context,
              title: 'Account Created',
              description:
                  'Welcome, Your account has been successfully created.',
              onOkPress: () {
                if (mounted) {
                  GoRouter.of(context).push(AppRouter.kHome);
                }
              },
            );
          } else if (state is SignUpFailure) {
            DialogHelper.showErrorDialog(
              context: context,
              title: 'Sign Up Failed',
              description: state.error,
            );
          }
        },
        child: Container(
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
                    onGenderSelected: (selectedGender) {
                      gender = selectedGender;
                    },
                  ),
                  BlocBuilder<SignUpBloc, SignUpState>(
                    builder: (context, state) {
                      return Footer(
                        text1: 'Already have an account? ',
                        text2: 'Log in',
                        textAction: () {
                          if (mounted) {
                            GoRouter.of(context).push(AppRouter.kLogIn);
                          }
                        },
                        buttonText:
                            state is SignUpLoading ? 'Loading...' : 'Sign up',
                        buttonAction: () {
                          if (formKey.currentState?.validate() == true) {
                            context.read<SignUpBloc>().add(
                              SignUpRequested(
                                email: emailController.text,
                                password: passwordController.text,
                                firstName: firstNameController.text,
                                lastName: lastNameController.text,
                                faculty: facultyController.text,
                                major: majorController.text,
                                gender: gender,
                              ),
                            );
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
