import 'package:go_router/go_router.dart';
import 'package:mentroverso/features/chatbot/presentation/widget/drawer.dart';
import 'package:mentroverso/features/feedbacks/presentation/views/feedback_view.dart';
import 'package:mentroverso/features/grades/presentation/views/grades_view.dart';
import 'package:mentroverso/features/home/presentation/views/home_view.dart';
import 'package:mentroverso/features/questionnaire/presentation/views/Questionnaire_view.dart';
import '../../features/chatbot/presentation/views/chatbot_view.dart';
import '../../features/interview/presentation/views/interview_view.dart';
import '../../features/meeting/presentation/views/meeting_view.dart';
import '../../features/profile/presentation/views/edit_profile.dart';
import '../../features/registration/presentation/views/log_in_view.dart';
import '../../features/registration/presentation/views/sign_up_view.dart';

abstract class AppRouter {
  static const kLogIn = '/logIn';
  static const kSignUp = '/signUp';
  static const kHome = '/home';
  static const kAuth = 'kAuth';
  static const kUpdateProfileView = '/kUpdateProfileView';
  static const kFeedbackView = '/kFeedbackView';
  static const kGradsView = '/kGradsView';
  static const kInterviewView = '/kInterviewView';
  static const kMeetingView = '/kMeetingView';
  static const kChatbotView = '/kChatbotView';
  static const kQuestionnaireView = '/kQuestionnaireView';
  static const kTestPage = '/kTestPage';
  static const kChatDrawer = '/kChatDrawer';

  //GoRouter.of(context).push(AppRouter.kLogIn);

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kChatDrawer,
        builder: (context, state) => const ChatDrawer(),
      ),
      GoRoute(
        path: kLogIn,
        builder: (context, state) => const LogIn(),
      ),
      GoRoute(
        path: kTestPage,
        builder: (context, state) => const QuestionnaireView(),
      ),
      GoRoute(
        path: kMeetingView,
        builder: (context, state) => const MeetingView(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => const ChatbotView(),
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
      GoRoute(
        path: kFeedbackView,
        builder: (context, state) => const FeedbackView(),
      ),
      GoRoute(
        path: kGradsView,
        builder: (context, state) => const GradesView(),
      ),
      GoRoute(
        path: kInterviewView,
        builder: (context, state) => const InterviewView(),
      ),
      GoRoute(
        path: kChatbotView,
        builder: (context, state) => const ChatbotView(),
      ),
      GoRoute(
        path: kQuestionnaireView,
        builder: (context, state) => const QuestionnaireView(),
      ),
    ],
  );
}
