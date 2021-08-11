import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  final firestoreInstance = FirebaseFirestore.instance;

  Future<void> createUserDocument(
      String userId, name, email, gender, contactNo, description) async {
    firestoreInstance.collection('users').doc(userId).set({
      'name': name,
      'email': email,
      'gender': gender,
      'contact_no': contactNo,
      'about': description
    });
  }
}
