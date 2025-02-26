import 'package:flutter/material.dart';
import 'package:mentroverso/core/widgets/text_field.dart';

import 'build_gender_option.dart';


class SignUpForm extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController facultyController;
  final TextEditingController majorController;


  const SignUpForm({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.facultyController,
    required this.majorController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                text: 'First name',
                label: 'First name',
                validator: (String? text) => text == null || text.isEmpty ? 'Please enter the first name' : null,
                controller: firstNameController,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: CustomTextFormField(
                text: 'Last name',
                label: 'Last name',
                validator: (String? text) => text == null || text.isEmpty ? 'Please enter the last name' : null,
                controller: lastNameController,
              ),
            ),
          ],
        ),
        CustomTextFormField(
          text: 'Email',
          label: 'Enter your email',
          validator: (String? text) => text == null || text.isEmpty ? 'Please enter the email' : null,
          controller: emailController,
        ),
        CustomTextFormField(
          text: 'Password',
          label: 'Enter your password',
          validator: (String? text) => text == null || text.isEmpty ? 'Please enter the password' : null,
          controller: passwordController,
        ),
        CustomTextFormField(
          text: 'Confirm Password',
          label: 'Confirm your password',
          validator: (String? text) => text == null || text.isEmpty ? 'Please confirm your password' : null,
          controller: confirmPasswordController,
        ),
        CustomTextFormField(
          text: 'Faculty',
          label: 'Enter your Faculty',
          validator: (String? text) => text == null || text.isEmpty ? 'Please enter the Faculty' : null,
          controller: facultyController,
        ),
        CustomTextFormField(
          text: 'Major',
          label: 'Enter your Major',
          validator: (String? text) => text == null || text.isEmpty ? 'Please enter the Major' : null,
          controller: majorController,
        ),

        const SizedBox(
          height: 8,
        ),
        GenderPicker(
          onGenderSelected: (String) {},
        ),

      ],
    );
  }
}
