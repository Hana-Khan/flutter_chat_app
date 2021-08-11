import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat_app/data_repo/models/user_model.dart';
import 'package:flutter_chat_app/data_repo/repositories/authentication_repo.dart';

class UserRepository 
{
  final firestoreInstance = FirebaseFirestore.instance;
  
  final userCollection = FirebaseFirestore.instance.collection('users');

  Future<void> createUserDocument(
      String userId, 
      name, 
      email, 
      gender, 
      contactNo, 
      description) 
  async {
    firestoreInstance.collection('users').doc(userId).set({
      'userId': userId,
      'userName': name,
      'userEmail': email,
      'userGender': gender,
      'userContactNo': contactNo,
      'userAbout': description
    });
  }

  
  // Future<MyUser> getUser() async {
  //   return 
  // }


  // @override
  // Stream<List<MyUser>> getAllUsers() {
  //   return userCollection.snapshots().map((snapshot) {
  //     return snapshot.docs
  //       .map((users_docs) => MyUser.fromSnapshot(users_docs))
  //       .toList();
  //   });
  // }


}
