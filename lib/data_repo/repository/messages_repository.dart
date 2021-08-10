import 'package:flutter_chat_app/data_repo/models/message_model.dart';
import '../repository/messages_repository_interface.dart';

class MessageRepository implements IMessagesRepository{
  @override
  Future<List<MessageModel>> getMessages() {
    // TODO: implement getMessages
    throw UnimplementedError();
  }

  @override
  Future<List<MessageModel>> addMessages() {
    // TODO: implement addMessages
    throw UnimplementedError();
  }
  
}