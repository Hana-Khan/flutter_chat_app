import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_app/cubits/userprofile_cubit/user_state.dart';
import 'package:flutter_chat_app/data_repo/models/user_model.dart';
import 'package:flutter_chat_app/data_repo/repositories/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';


abstract class UserListener {
  void usersLoaded();
  void userLoading();
  void userInfoLoaded();
  void failToLoadUser();
  void userUpdated();
  void userDeleted();
  void noUsers();
}

class UserCubit extends Cubit<UserCubitState> implements UserListener {
  final userRepository = UserRepository();
  UserCubit(UserCubitState initialState) : super(initialState);
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();
 
  getListOfUsers() {}


  void setUserSharedPref() async{
    final user =await userRepository.getUserInfo();
    final SharedPreferences prefs = await _pref;
    await prefs.setString('userData', jsonEncode(user));
  }



  Future<MyUser>getUserSharedPref() async {
    final SharedPreferences prefs = await _pref;
    Map json = jsonDecode(prefs.getString('userData')!);
    final user = MyUser.fromJson(json);
    return user;

  }
  

  @override
  void failToLoadUser() {
    // TODO: implement failToLoadUser
  }

  @override
  void noUsers() {
    // TODO: implement noUsers
  }

  @override
  void userDeleted() {
    // TODO: implement userDeleted
  }

  @override
  void userInfoLoaded() {

    // TODO: implement userInfoLoaded
    try {
    final user=userRepository.getUserInfo();
    emit(UserCubitState.userInfoLoaded);
    }catch(e){
      emit(UserCubitState.userLoadingFailed);
    }

  }

  @override
  void userUpdated() {
    // TODO: implement userUpdated
  }

  @override
  void usersLoaded() {
    // TODO: implement usersLoaded
  }

  @override
  void userLoading() {
    // TODO: implement userLoading
  }
}
