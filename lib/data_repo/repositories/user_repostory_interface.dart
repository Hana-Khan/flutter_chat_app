import 'package:flutter_chat_app/data_repo/models/user_model.dart';

abstract class IUserRepository {
  Future<void> createUserDocument();
  Future<MyUser> getUser();
  Stream<List<MyUser>> getAllUsers();
}
