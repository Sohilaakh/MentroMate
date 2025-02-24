import 'package:flutter/material.dart';
import 'package:mentroverso/core/utils/color_resources.dart';
import '../widgets/sgin_up_backGround_color.dart';
import '../widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const SignUpBackGroundColor(),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0 ,horizontal: 20),
                child: Card(
                  color: ColorResources.gry3.withOpacity(0.25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(13.0),
                    child: SignUpViewBody(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
