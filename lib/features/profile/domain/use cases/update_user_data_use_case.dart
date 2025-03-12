import '../repositories/user_repository.dart';

class UpdateUserDataUseCase {
  final UserRepository repository;

  UpdateUserDataUseCase(this.repository);

  Future<void> call(String uid, Map<String, dynamic> updatedData) {
    return repository.updateUserData(uid, updatedData);
  }
}
