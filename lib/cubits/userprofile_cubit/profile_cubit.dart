import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_app/cubits/userprofile_cubit/profile_state.dart';
import 'package:flutter_chat_app/cubits/userprofile_cubit/user_state.dart';
import 'package:flutter_chat_app/data_repo/models/user_model.dart';
import 'package:flutter_chat_app/data_repo/repositories/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ProfileCubit extends Cubit<ProfileState> {
  final  UserRepository userRepository;
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  ProfileCubit({required this.userRepository}) : super((ProfileInitialState())){

    getUser();
  
  }
 
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
  
  //implementing a getUser method.
  void getUser() async {
    try {
      emit(ProfileLoadingState());
      final user = await userRepository.getUserInfo();
      print(user);
      emit(ProfileLoadedState(user));
    } catch (e) {
      emit(FailedToLoadProfile());
    }
  }
}
