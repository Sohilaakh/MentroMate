import 'package:go_router/go_router.dart';
import 'package:mentroverso/features/home/presentation/views/home_view.dart';
import '../../features/profile/presentation/views/edit_profile.dart';
import '../../features/registration/presentation/views/log_in_view.dart';
import '../../features/registration/presentation/views/sign_up_view.dart';

abstract class AppRouter {
  static const String kLogIn = '/logIn';
  static const String kSignUp = '/signUp';
  static const String kHome = '/home';
  static const String kUpdateProfileView = '/updateProfile';

  static final router = GoRouter(
    initialLocation: kHome,
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
      GoRoute(
        path: kUpdateProfileView,
        builder: (context, state) => const UpdateProfileView(),
      ),
    ],
  );
}
