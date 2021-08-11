import 'package:flutter_chat_app/data_repo/models/message_model.dart';

abstract class IMessagesRepository{

  Future<List<MessageModel>> getMessages();
  Future<List<MessageModel>> addMessages();


}