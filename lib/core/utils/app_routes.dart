
import 'package:go_router/go_router.dart';

import '../../features/registration/presentation/views/auth_main_view.dart';
import '../../features/registration/presentation/views/log_in_view.dart';
import '../../features/registration/presentation/views/sign_up_view.dart';

abstract  class AppRouter{

   static const kLogIn = '/logIn' ;
   static const kSignUp = '/signUp' ;



   static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const AuthMainView(),
      ),
      GoRoute(
        path: kLogIn,
        builder: (context, state) => const LogIn(),
      ),

      GoRoute(
        path: kSignUp,
        builder: (context, state) => const SignUpView(),
      ),

    ],
  );
}

