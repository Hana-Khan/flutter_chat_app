import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_chat_app/data_repo/models/user_model.dart';


abstract class IUserRepository {
  Future<void> createUserDocument();
  Future<MyUser> getUser();
  Future<MyUser> getUserInfo();
  Stream<List<MyUser>> getAllUsers();
}


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


  Future<MyUser> getUserInfo() async {
    print('get userinfo called');
    // final String? uid=UserAuthenticationRepo().userData();
    // print(uid);
    DocumentSnapshot userDetails=await userCollection.doc('F4AlW64oqbeL4j2Fjjc2xn2FPHc2').get();
    print('userdeatils');
    final user=MyUser.fromSnapshot(userDetails);
    print(user);
    return user;
  }

  
  Stream getUserStream(String userId) {
    return userCollection
      .doc(userId)
      .snapshots();
  }







  Stream<List<MyUser>> getAllUsers() {
    return userCollection.snapshots().map((snapshot) {
      return snapshot.docs
        .map((usersDocs) => MyUser.fromSnapshot(usersDocs))
        .toList();
    });
  }


  Stream<List<MyUser>> getUsersList() {
    return userCollection
    .snapshots()
    .map((snapShot) => snapShot.docs
    .map((document) => MyUser.fromJson(document.data()))
    .toList());
}


}
