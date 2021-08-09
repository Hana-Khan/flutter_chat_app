import 'package:flutter_chat_app/data/model/message.dart';

abstract class IMessagesRepository{

  Future<List<MessageModel>> getMessages();


}