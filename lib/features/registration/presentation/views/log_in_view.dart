import 'package:flutter/material.dart';

import '../widgets/log_in_backGround_color.dart';
import '../widgets/log_in_view_body.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const LogInBackground(),
          Center(
            child: SingleChildScrollView(
              child: LogInBody(),
            ),
          ),


        ],
      )
    );
  }
}
