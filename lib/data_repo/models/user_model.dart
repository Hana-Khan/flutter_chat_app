import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class MyUser extends Equatable {
  String? userId;
  String? userName;
  String? userEmail;
  String? userImage;
  String? userAbout;
  String? userGender;
  String? userContactNo;
  // List<MyUser>? friends = [];

  MyUser(
    { 
      this.userId,
      this.userName,
      this.userEmail,
      this.userAbout,
      this.userContactNo,
      this.userGender,
    });

  @override
  List<Object?> get props =>
      [userEmail, userId, userName, userContactNo, userGender, userAbout];

  MyUser.fromSnapshot(DocumentSnapshot snapshot) {
    userId = snapshot['userId'] ?? '';
    userName = snapshot['userName'] ?? '';
    userEmail = snapshot['userEmail'] ?? '';
    userContactNo = snapshot['userContactNo'] ?? '';
    userGender = snapshot['userGender'] ?? '';
    userAbout = snapshot['userAbout'] ?? '';
  }
  
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'userName': userName,
      'userEmail': userEmail,
      'userImage': userImage,
      'userGender': userGender,
      'userAbout': userAbout,
      'userContactNo':userContactNo
    };
  }

  MyUser.fromJson(Map<dynamic, dynamic> snapshot) {
   userId = snapshot['userId'] ?? '';
    userName = snapshot['userName'] ?? '';
    userEmail = snapshot['userEmail'] ?? '';
    userContactNo = snapshot['userContactNo'] ?? '';
    userGender = snapshot['userGender'] ?? '';
    userAbout = snapshot['userAbout'] ?? '';
  }
}
