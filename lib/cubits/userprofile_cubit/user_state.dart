import 'package:equatable/equatable.dart';
import 'package:flutter_chat_app/data_repo/models/user_model.dart';

enum UserCubitState {
  initial,
  loadingState,
  usersLoaded,
  userInfoLoaded,
  userLoadingFailed,
  noUsers,
  userUpdated,
  userDeleted,
  loading
}
