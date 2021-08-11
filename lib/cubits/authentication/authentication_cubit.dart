import 'package:bloc/bloc.dart';
import '../../data_repo/repositories/authentication_repo.dart';
import 'package:flutter_chat_app/data_repo/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'authentication_state.dart';

abstract class AuthRegistrationListener {
  void loginSuccess();
  void registrationSuccess();
  void failed();
  void userExists();
  void loading();
}

class AuthenticateUserCubit extends Cubit<AuthenticateUserState>
    implements AuthRegistrationListener {
  final userAuthenticationRepo = UserAuthenticationRepo();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  MyUser? myUser;

  AuthenticateUserCubit(AuthenticateUserState initialState)
      : super(initialState);

  void registerUser(
      {required String email,
      required String password,
      required String name,
      required String gender,
      required String contactNo,
      required String description}) async {
    myUser = await userAuthenticationRepo.registerUser(
        email: email,
        password: password,
        name: name,
        gender: gender,
        contactNo: contactNo,
        description: description,
        authRegistrationListener: this);
  }

  // logging is User
  void loginUser({required String email, required String password}) async {
    myUser = await userAuthenticationRepo.signInInEmailAndPassword(
        email: email, password: password, authRegistrationListener: this);
    final SharedPreferences prefs = await _prefs;
    prefs.setBool('isLogin', true);
  }

  Future<void> logout() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool('isLogin', false);
    await userAuthenticationRepo.logout();
  }

  Future<bool> isUserSignIn() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getBool('isLogin') ?? false;
  }

  String? get signedInUser {
    return userAuthenticationRepo.userData();
  }

  MyUser get user {
    return myUser!;
  }

  @override
  void failed() {
    emit(AuthenticateUserState.initial);
    emit(AuthenticateUserState.failed);
  }

  @override
  void loginSuccess() {
    emit(AuthenticateUserState.loginSuccess);
  }

  @override
  void registrationSuccess() {
    emit(AuthenticateUserState.registrationSuccess);
  }

  @override
  void userExists() {
    emit(AuthenticateUserState.initial);
    emit(AuthenticateUserState.user_exists);
  }

  @override
  void loading() {
    emit(AuthenticateUserState.loading);
  }
}
