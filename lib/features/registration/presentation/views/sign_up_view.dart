import 'package:flutter/material.dart';
import '../widgets/sgin_up_backGround_color.dart';
import '../widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          SignUpBackGroundColor(),
          Center(

              child: SignUpViewBody(),

          ),
        ],
      ),
    );
  }
}
