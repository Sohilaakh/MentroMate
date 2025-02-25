import 'package:flutter/material.dart';

import '../widgets/auth_view_body.dart';
import '../widgets/backGround_color.dart';

class AuthMainView extends StatelessWidget {
  const AuthMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          BackGroundColor(),
          AuthViewBody(),
        ],
      ),
    );
  }
}
