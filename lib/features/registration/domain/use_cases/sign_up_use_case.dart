import '../../../profile/data/models/user_model.dart';
import '../../../profile/domain/repositories/user_repository.dart';
import '../repositories/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository authRepository;
  final UserRepository userRepository;

  SignUpUseCase(this.authRepository, this.userRepository);

  Future<void> call({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String faculty,
    required String major,
    required String gender,
    String phoneNumber = '',
    String graduationYear = '',
    String graduationStatus = '',
  }) async {
    try {
      // Sign up the user using Firebase Authentication
      final userCredential = await authRepository.signUp(email, password);
      final uid = userCredential.user?.uid;

      // If user registration is successful, save user data to Firestore
      if (uid != null) {
        final user = UserModel(
          uid: uid,
          firstName: firstName,
          lastName: lastName,
          email: email,
          faculty: faculty,
          major: major,
          gender: gender,
          phoneNumber: phoneNumber,
          graduationYear: graduationYear,
          graduationStatus: graduationStatus,
        );

        // Save user data to Firestore
        await userRepository.saveUserData(user);
      } else {
        throw Exception('Failed to create user.');
      }
    } catch (e) {
      print('Sign-up error: $e');
      rethrow; // Pass the error for further handling (like showing UI alerts)
    }
  }
}
