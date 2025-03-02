import 'package:flutter/material.dart';

import '../../../../core/utils/color_resources.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/text_field.dart';

class LogInForm extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LogInForm({super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [    CustomTextFormField(
        text: 'Email',
        label: 'Enter your email',
        validator: validateEmail,
        controller: widget.emailController,
      ),
        CustomTextFormField(
          text: 'Password',
          label: 'Enter your password',
          validator: validatePassword,
          controller: widget.passwordController,
          obscureText: obscurePassword,
          suffixIcon: IconButton(
            icon: Icon(
              obscurePassword ? Icons.visibility_off : Icons.visibility,
              color: ColorResources.neutralGray,
            ),
            onPressed: () {
              setState(() {
                obscurePassword = !obscurePassword;
              });
            },
          ),
        ),
      ],
    );
  }
}
