import 'package:firebase_auth/firebase_auth.dart';
import '../repositories/auth_repository.dart';

class LogInUseCase {
  final AuthRepository authRepository;

  LogInUseCase(this.authRepository);

  Future<UserCredential> call(String email, String password) {
    return authRepository.logIn(email, password);
  }
}
