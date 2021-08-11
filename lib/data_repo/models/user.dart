import 'package:cloud_firestore/cloud_firestore.dart';

class User {

  String? userId;
  String? userName;
  String? userEmail;
  String? userImage;
  String? bioText;
  String? gender;
  List<User>? friends = [];

  User({
      this.userId, 
      this.userName,
      this.userEmail, 
      this.userImage, 
      this.gender, 
      this.bioText, 
      this.friends,
    });

    User.fromSnapshot(DocumentSnapshot snapshot) {
    userId = snapshot['userId']??'';
    userName = snapshot['userName']??'';
    userEmail = snapshot['userEmail']??'';
    userImage = snapshot['userImage']??'';
    gender = snapshot['Gender']??'';
    bioText = snapshot['bioText']??'';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'userName': userName,
      'userEmail': userEmail,
      'userImage': userImage,
      'Gender': gender,
      'bioText': bioText,
    };
  }

}