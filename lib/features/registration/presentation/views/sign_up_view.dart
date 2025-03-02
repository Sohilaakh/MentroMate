import 'package:flutter/material.dart';
import '../../../../core/widgets/linear_gradient_back_ground_color.dart';
import '../widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          LinearGradientBackGroundColor(
            beginColor: Alignment.topLeft,
            endColor: Alignment.bottomRight,
          ),
          const Center(
            child: SignUpViewBody(),
          ),
        ],
      ),
    );
  }
}
