import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_app/cubits/userprofile_cubit/user_state.dart';
import 'package:flutter_chat_app/data_repo/models/user_model.dart';
import 'package:flutter_chat_app/data_repo/repositories/user_repository.dart';

abstract class UserListener {
  void usersLoaded();
  void userInfoLoaded();
  void failToLoadUser();
  void userUpdated();
  void userDeleted();
  void noUsers();
  void usersLoading();
}

class UserCubit extends Cubit<UserCubitState> implements UserListener {
  final userRepository = UserRepository();
  StreamSubscription? firebaseUsersStream;
  late List<MyUser> usersList;

  UserCubit(UserCubitState initialState) : super(initialState);

  void onClose() {
    firebaseUsersStream!.cancel();
  }

  void getListOfUsers() {
    usersLoading();
    Stream<List<MyUser>> userStream = userRepository.getAllUsers();
    firebaseUsersStream = userStream.listen((usersDataSnapshot) {
      if (usersDataSnapshot.length != 0) {
        usersList = usersDataSnapshot;
        usersLoaded();
      } else {
        failToLoadUser();
      }
    });
  }

  List<MyUser> returnUsersList() => usersList;

  @override
  void failToLoadUser() {
    // TODO: implement failToLoadUser
    emit(UserCubitState.userLoadingFailed);
  }

  @override
  void noUsers() {
    // TODO: implement noUsers
    emit(UserCubitState.noUsers);
  }

  @override
  void userDeleted() {
    // TODO: implement userDeleted
    emit(UserCubitState.userDeleted);
  }

  @override
  void userInfoLoaded() {
    // TODO: implement userInfoLoaded
    emit(UserCubitState.userInfoLoaded);
  }

  @override
  void userUpdated() {
    // TODO: implement userUpdated
    emit(UserCubitState.userUpdated);
  }

  @override
  void usersLoaded() {
    // TODO: implement usersLoaded
    emit(UserCubitState.initial);
    emit(UserCubitState.usersLoaded);
  }

  @override
  void usersLoading() {
    // TODO: implement loading
    emit(UserCubitState.loading);
  }
}
