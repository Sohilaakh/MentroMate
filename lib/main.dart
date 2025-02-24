import 'package:flutter/material.dart';

import 'core/utils/app_routes.dart';

void main() {
  runApp(const MentroVerso());
}

class MentroVerso extends StatelessWidget {
  const MentroVerso({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
