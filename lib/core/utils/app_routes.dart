
import 'package:go_router/go_router.dart';
import 'package:mentroverso/features/feedbacks/presentation/views/feedback_view.dart';
import 'package:mentroverso/features/grades/presentation/views/grades_view.dart';
import 'package:mentroverso/features/home/presentation/views/home_view.dart';

import '../../features/profile/presentation/views/edit_profile.dart';
import '../../features/registration/presentation/views/log_in_view.dart';
import '../../features/registration/presentation/views/sign_up_view.dart';

abstract  class AppRouter{

   static const kLogIn = '/logIn' ;
   static const kSignUp = '/signUp' ;
   static const kHome = '/home' ;
   static const kAuth = 'kAuth';
   static const kUpdateProfileView = '/kUpdateProfileView';
   static const kFeedbackView = '/kFeedbackView';
   static const kGradsView = '/kGradsView';

// GoRouter.of(context).push(AppRouter.kUpdateProfileView);


   static final router = GoRouter(
    routes: [
      GoRoute(
        path: kLogIn,
        builder: (context, state) => const LogIn(),
      ),

      GoRoute(
        path: '/',
        builder: (context, state) =>  const HomeView(),
      ),

      GoRoute(
        path: kSignUp,
        builder: (context, state) => const SignUpView(),
      ),

      GoRoute(
        path: kHome,
        builder: (context, state) =>  const HomeView(),
      ),
      GoRoute(
        path: kUpdateProfileView,
        builder: (context, state) =>  const UpdateProfileView(),
      ),
      GoRoute(
        path: kFeedbackView,
        builder: (context, state) => const FeedbackView(),
      ),

      GoRoute(
        path: kGradsView,
        builder: (context, state) => const GradesView(),
      ),




    ],
  );
}

