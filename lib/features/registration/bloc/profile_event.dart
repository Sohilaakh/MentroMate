import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object?> get props => [];
}

class SignUpRequested extends SignUpEvent {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String faculty;
  final String major;
  final String gender;

  const SignUpRequested({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.faculty,
    required this.major,
    required this.gender,
  });

  @override
  List<Object?> get props => [
    email,
    password,
    firstName,
    lastName,
    faculty,
    major,
    gender,
  ];
}
