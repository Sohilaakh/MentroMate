import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentroverso/features/profile/bloc/profile_event.dart';
import 'package:mentroverso/features/profile/bloc/profile_state.dart';

import '../domain/repositories/user_repository.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserRepository userRepository;

  ProfileBloc(this.userRepository) : super(ProfileInitial()) {
    on<LoadUserProfile>(_onLoadUserProfile);
    on<UpdateUserProfile>(_onUpdateUserProfile);
  }

  Future<void> _onLoadUserProfile(LoadUserProfile event, Emitter<ProfileState> emit) async {
    try {
      emit(ProfileLoading());
      final user = await userRepository.getUserData(event.uid);
      emit(ProfileLoaded(user));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> _onUpdateUserProfile(UpdateUserProfile event, Emitter<ProfileState> emit) async {
    try {
      await userRepository.updateUserData(event.uid, event.updatedData);
      final updatedUser = await userRepository.getUserData(event.uid);
      emit(ProfileLoaded(updatedUser));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}
