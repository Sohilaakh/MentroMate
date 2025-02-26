import 'package:flutter/cupertino.dart';

import '../../../../core/widgets/text_field.dart';

class LogInForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LogInForm({super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}
