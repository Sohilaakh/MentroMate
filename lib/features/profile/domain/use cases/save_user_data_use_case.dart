import '../../data/models/user_model.dart';
import '../repositories/user_repository.dart';

class SaveUserDataUseCase {
  final UserRepository repository;

  SaveUserDataUseCase(this.repository);

  Future<void> call(UserModel user) {
    return repository.saveUserData(user);
  }
}
