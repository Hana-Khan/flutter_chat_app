import 'package:flutter_chat_app/data/model/message.dart';
import 'package:flutter_chat_app/data/repository/messages_repository_interface.dart';

class MessageRepository implements IMessagesRepository{
  @override
  Future<List<MessageModel>> getMessages() {
    // TODO: implement getMessages
    throw UnimplementedError();
  }
  
}