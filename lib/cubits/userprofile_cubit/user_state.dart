import 'package:equatable/equatable.dart';

// abstract class UserState extends Equatable {
//   const UserState();
// }
//
// class UserInitialState extends UserState {
//   @override
//   List<Object> get props => [];
// }

enum UserCubitState {
  initial,
  usersLoaded,
  userInfoLoaded,
  userLoadingFailed,
  noUsers,
  userUpdated,
  userDeleted,
  loading
}
