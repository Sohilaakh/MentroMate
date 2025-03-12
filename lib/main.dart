import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/registration/bloc/profile_bloc.dart';
import 'features/registration/data/repositories/auth_repository_impl.dart';
import 'features/registration/domain/use_cases/sign_up_use_case.dart';
import 'features/profile/domain/repositories/user_repository_impl.dart';
import 'core/utils/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final userRepository = UserRepositoryImpl(FirebaseFirestore.instance);
  final signUpUseCase = SignUpUseCase(AuthRepositoryImpl(FirebaseAuth.instance), userRepository);

  runApp(MentroVerso(signUpUseCase: signUpUseCase));
}

class MentroVerso extends StatelessWidget {
  final SignUpUseCase signUpUseCase;

  const MentroVerso({super.key, required this.signUpUseCase});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(signUpUseCase),
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
