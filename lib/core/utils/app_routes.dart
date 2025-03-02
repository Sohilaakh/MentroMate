
import 'package:go_router/go_router.dart';
import 'package:mentroverso/features/home/presentation/views/home_view.dart';

import '../../features/registration/presentation/views/log_in_view.dart';
import '../../features/registration/presentation/views/sign_up_view.dart';

abstract  class AppRouter{

   static const kLogIn = '/logIn' ;
   static const kSignUp = '/signUp' ;
   static const kHome = '/home' ;





   static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kLogIn,
        builder: (context, state) => const LogIn(),
      ),

      GoRoute(
        path: kSignUp,
        builder: (context, state) => const SignUpView(),
      ),

      GoRoute(
        path: kHome,
        builder: (context, state) => const HomeView(),
      ),

    ],
  );
}

