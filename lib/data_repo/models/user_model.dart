import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class MyUser extends Equatable {
  /// {@macro user}
  
  String? userId;
  String? userName;
  String? userEmail;
  String? userImage;
  String? userAbout;
  String? userGender;
  String? userContactNumber;
  // List<MyUser>? friends = [];

  MyUser({
    required this.userId,
    this.userEmail,
    this.userName,
    this.userAbout,
    this.userContactNumber,
    this.userGender});

  
  @override
  List<Object?> get props =>
      [userEmail, userId, userName, userContactNumber, userGender, userAbout];

   MyUser.fromSnapshot(DocumentSnapshot snapshot) {
    userId = snapshot['userId']??'';
    userName = snapshot['userName']??'';
    userEmail = snapshot['userEmail']??'';
    userImage = snapshot['userImage']??'';
    userGender = snapshot['Gender']??'';
    userAbout = snapshot['bioText']??'';
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

}
