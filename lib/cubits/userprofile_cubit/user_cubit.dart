import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_app/cubits/userprofile_cubit/user_state.dart';

abstract class UserListener {
  void usersLoaded();
  void userInfoLoaded();
  void failToLoadUser();
  void userUpdated();
  void userDeleted();
  void noUsers();
}

class UserCubit extends Cubit<UserCubitState> implements UserListener {
  UserCubit(UserCubitState initialState) : super(initialState);

  getListOfUsers() {}

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
  }

  @override
  void userUpdated() {
    // TODO: implement userUpdated
  }

  @override
  void usersLoaded() {
    // TODO: implement usersLoaded
  }
}
