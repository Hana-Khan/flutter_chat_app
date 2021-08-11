import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  final firestoreInstance = FirebaseFirestore.instance;

  Future<void> createUserDocument(
      String userId, name, email, gender, contactNo, description) async {
    firestoreInstance.collection('users').doc(userId).set({
      'userId': userId,
      'userName': name,
      'userEmail': email,
      'userGender': gender,
      'userContactNo': contactNo,
      'userAbout': description
    });
  }
}
