import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat_app/data_repo/models/user_model.dart';
import 'package:flutter_chat_app/data_repo/repositories/authentication_repo.dart';
import 'package:flutter_chat_app/data_repo/repositories/user_repostory_interface.dart';

class UserRepository {
  final firestoreInstance = FirebaseFirestore.instance;

  final userCollection = FirebaseFirestore.instance.collection('users');

  Future<void> createUserDocument(
      String userId, name, email, gender, contactNo, description) async {
    userCollection.doc(userId).set({
      'userId': userId,
      'userName': name,
      'userEmail': email,
      'userGender': gender,
      'userContactNo': contactNo,
      'userAbout': description
    });
  }

  // @override
  // Future<MyUser> getUser() async {
  // }

  Stream<List<MyUser>> getAllUsers() {
    return userCollection.snapshots().map((snapshot) {
      return snapshot.docs
          .map((usersDocs) => MyUser.fromSnapshot(usersDocs))
          .toList();
    });
  }
}
