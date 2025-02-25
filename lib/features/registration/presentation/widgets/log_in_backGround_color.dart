import 'package:flutter/cupertino.dart';

class LogInBackground extends StatelessWidget {
  const LogInBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient:LinearGradient (
            colors: [
              Color(0xFF1C1A1D), // 0%
              Color(0xFF76335C), // 20%
              Color(0xFF1A191C), // 49%
              Color(0xFF145E53), // 73%
              Color(0xFF1A191C), // 100%
            ],
            stops: [0.0, 0.2, 0.49, 0.73, 1.0],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          // Full circle
        ),
      ),
    );
  }
}
