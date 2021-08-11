part of 'authentication_cubit.dart';

// @immutable
// abstract class RegisterState {}
//
// class RegisterInitial extends RegisterState {}

enum AuthenticateUserState {
  loginSuccess,
  registrationSuccess,
  user_exists,
  failed,
  initial,
  loading
}
