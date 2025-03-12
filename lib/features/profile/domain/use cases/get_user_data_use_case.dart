import '../../data/models/user_model.dart';
import '../repositories/user_repository.dart';

class GetUserDataUseCase {
  final UserRepository repository;

  GetUserDataUseCase(this.repository);

  Future<UserModel> call(String uid) {
    return repository.getUserData(uid);
  }
}
