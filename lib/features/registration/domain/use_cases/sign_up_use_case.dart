import 'package:firebase_auth/firebase_auth.dart';
import '../repositories/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository authRepository;

  SignUpUseCase(this.authRepository);

  Future<UserCredential> call(String email, String password) {
    return authRepository.signUp(email, password);
  }
}
