import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat_app/cubits/authentication/authentication_cubit.dart';
import 'package:flutter_chat_app/data_repo/models/user_model.dart';
import 'package:flutter_chat_app/data_repo/repositories/user_repository.dart';

class UserAuthenticationRepo {
  final FirebaseAuth? _firebaseAuth;
  final _userRepository = UserRepository();

  UserAuthenticationRepo({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Future<MyUser?> signInInEmailAndPassword(
      {required String email,
      required String password,
      required AuthRegistrationListener authRegistrationListener}) async {
    authRegistrationListener.loading();
    try {
      var userCredential = await _firebaseAuth!
          .signInWithEmailAndPassword(email: email, password: password);
      authRegistrationListener.loginSuccess();
      return MyUser(
          userId: userCredential.user!.uid,
          userEmail: userCredential.user!.email);
    } on FirebaseException catch (e) {
      authRegistrationListener.failed();
    }
  }

  String? userData() {
    final User? user = _firebaseAuth!.currentUser;
    final String? uid = user!.displayName;
    return uid;
  }


  Future<MyUser?> registerUser(
      {required String email,
      required String password,
      required String name,
      required String gender,
      required String contactNo,
      required String description,
      required AuthRegistrationListener authRegistrationListener}) async {
    authRegistrationListener.loading();
    try {
      UserCredential userCredential = await _firebaseAuth!
          .createUserWithEmailAndPassword(email: email, password: password);
      _firebaseAuth!.signOut();

      // create user document in user collection through user repository class
      await _userRepository.createUserDocument(userCredential.user!.uid, name,
          email, gender, contactNo, description);

      authRegistrationListener.registrationSuccess();

      return MyUser(
          userId: userCredential.user!.uid,
          userEmail: userCredential.user!.email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        //authRegistrationListener.weakPassword();
      } else if (e.code == 'email-already-in-use') {
        authRegistrationListener.userExists();
      }
    } catch (e) {
      print(e);
      authRegistrationListener.failed();
    }
  }

  Future<void> logout() async {
    try {
      await Future.wait([
        _firebaseAuth!.signOut(),
      ]);
    } on Exception {
      throw Exception();
    }
  }
}
