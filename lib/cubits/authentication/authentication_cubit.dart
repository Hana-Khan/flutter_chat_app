import 'package:bloc/bloc.dart';
import 'package:flutter_chat_app/data_repo/authentication_repo.dart';
import 'package:flutter_chat_app/data_repo/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'authentication_state.dart';

abstract class AuthRegistrationListener {
  void success();
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

  void registerUser({required String email, required String password}) async {
    myUser = await userAuthenticationRepo.registerUser(
        email: email, password: password, authRegistrationListener: this);
  }

  // logging is User
  void loginUser({required String email, required String password}) async {
    myUser = await userAuthenticationRepo.signInInEmailAndPassword(
        email: email, password: password, authRegistrationListener: this);
    final SharedPreferences prefs = await _prefs;
    prefs.setBool('isLogin', true);
  }

  void logout() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool('isLogin', false);
    await userAuthenticationRepo.logout();
  }

  Future<bool> isUserSignIn() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getBool('isLogin') ?? false;
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
  void success() {
    emit(AuthenticateUserState.success);
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
