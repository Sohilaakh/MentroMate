import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentroverso/features/registration/bloc/profile_event.dart';
import 'package:mentroverso/features/registration/bloc/profile_state.dart';
import '../domain/use_cases/sign_up_use_case.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUseCase signUpUseCase;

  SignUpBloc(this.signUpUseCase) : super(SignUpInitial()) {
    on<SignUpRequested>(_onSignUpRequested);
  }

  Future<void> _onSignUpRequested(
      SignUpRequested event, Emitter<SignUpState> emit) async {
    emit(SignUpLoading());
    try {
      await signUpUseCase(
        email: event.email,
        password: event.password,
        firstName: event.firstName,
        lastName: event.lastName,
        faculty: event.faculty,
        major: event.major,
        gender: event.gender,
      );
      emit(SignUpSuccess());
    } catch (e) {
      emit(SignUpFailure(e.toString()));
    }
  }
}
