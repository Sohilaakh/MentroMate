import '../../data/models/user_model.dart';

abstract class UserRepository {
  Future<void> saveUserData(UserModel user);
  Future<UserModel> getUserData(String uid);
  Future<void> updateUserData(String uid, Map<String, dynamic> updatedData);
}
