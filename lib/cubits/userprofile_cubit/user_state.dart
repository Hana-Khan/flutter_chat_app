import 'package:equatable/equatable.dart';

enum UserState {
  usersLoaded,
  userInfoLoaded,
  userLoadingFailed,
  noUsers,
  userUpdated,
  userDeleted,
}
