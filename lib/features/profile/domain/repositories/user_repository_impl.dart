import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data/models/user_model.dart';
import '../../domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseFirestore _firestore;

  UserRepositoryImpl(this._firestore);

  @override
  Future<void> saveUserData(UserModel user) async {
    await _firestore.collection('Users').doc(user.uid).set(user.toMap());
  }

  @override
  Future<UserModel> getUserData(String uid) async {
    final doc = await _firestore.collection('Users').doc(uid).get();
    if (doc.exists) {
      return UserModel.fromMap(doc.data()!);
    } else {
      throw Exception('User not found');
    }
  }

  @override
  Future<void> updateUserData(String uid, Map<String, dynamic> updatedData) async {
    await _firestore.collection('Users').doc(uid).update(updatedData);
  }
}
