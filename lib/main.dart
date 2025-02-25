import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/utils/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
 ),
  );
  runApp(const MentroVerso());
}

class MentroVerso extends StatelessWidget {
  const MentroVerso({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
