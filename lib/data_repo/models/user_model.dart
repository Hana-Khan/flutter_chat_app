import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class MyUser extends Equatable {
  String? userId;
  String? userName;
  String? userEmail;
  String? userImage;
  String? userAbout;
  String? userGender;
  String? userContactNumber;
  // List<MyUser>? friends = [];

  MyUser(
    { 
      this.userId,
      this.userName,
      this.userEmail,
      this.userAbout,
      this.userContactNumber,
      this.userGender,
    });

  @override
  List<Object?> get props =>
      [userEmail, userId, userName, userContactNumber, userGender, userAbout];

  MyUser.fromSnapshot(DocumentSnapshot snapshot) {
    userId = snapshot['userId'] ?? '';
    userName = snapshot['userName'] ?? '';
    userEmail = snapshot['userEmail'] ?? '';
    userImage = snapshot['userContactNo'] ?? '';
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
    };
  }

  MyUser.fromJson(Map<dynamic, dynamic> snapshot) {
   userId = snapshot['userId'] ?? '';
    userName = snapshot['userName'] ?? '';
    userEmail = snapshot['userEmail'] ?? '';
    userImage = snapshot['userContactNo'] ?? '';
    userGender = snapshot['userGender'] ?? '';
    userAbout = snapshot['userAbout'] ?? '';
  }
}

// userId = snapshot.get('userId') ?? '';
// userName = snapshot.get('userName') ?? '';
// userEmail = snapshot.get('userEmail') ?? '';
// userImage = snapshot.get('userGender') ?? '';
// userGender = snapshot.get('userContactNo') ?? '';
// userAbout = snapshot.get('userAbout') ?? '';
