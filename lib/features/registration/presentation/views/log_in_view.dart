import 'package:flutter/material.dart';

import '../../../../core/widgets/linear_gradient_back_ground_color.dart';
import '../widgets/log_in_view_body.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        LinearGradientBackGroundColor(
          beginColor: Alignment.topRight,
          endColor: Alignment.bottomLeft,
        ),
        const Center(
          child: SingleChildScrollView(
            child: LogInBody(),
          ),
        ),
      ],
    ));
  }
}
