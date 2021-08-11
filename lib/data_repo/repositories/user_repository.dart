import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
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



  
  // @override
  // Stream<List<MyUser>> allUsers() {
  //   return userCollection.snapshots().map((snapshot) {
  //     return snapshot.docs
  //       .map((users_docs) => MyUser.fromEntity(MyUser.fromSnapshot(users_docs)))
  //       .toList();
  //   });
  // }


}
