import 'package:equatable/equatable.dart';

class MyUser extends Equatable {
  /// {@macro user}
  const MyUser(
      {required this.userId,
      this.userEmail,
      this.userName,
      this.userAbout,
      this.userContactNumber,
      this.userGender});

  final String? userEmail;

  final String userId;

  final String? userName;

  final String? userGender;
  final String? userContactNumber;
  final String? userAbout;

  @override
  List<Object?> get props =>
      [userEmail, userId, userName, userContactNumber, userGender, userAbout];
}
