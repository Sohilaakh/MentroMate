
import 'package:equatable/equatable.dart';


// Events
abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
  @override
  List<Object?> get props => [];
}

class LoadUserProfile extends ProfileEvent {
  final String uid;
  const LoadUserProfile(this.uid);

  @override
  List<Object?> get props => [uid];
}

class UpdateUserProfile extends ProfileEvent {
  final String uid;
  final Map<String, dynamic> updatedData;
  const UpdateUserProfile(this.uid, this.updatedData);

  @override
  List<Object?> get props => [uid, updatedData];
}
