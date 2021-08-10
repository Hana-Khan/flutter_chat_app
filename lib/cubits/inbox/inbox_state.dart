import 'package:equatable/equatable.dart';
import 'package:flutter_chat_app/data_repo/models/message_model.dart';

abstract class InboxState extends Equatable {
  const InboxState();
}

class InboxInitialState extends InboxState {
  @override
  List<Object> get props => [];
}

class InboxLoadingState extends InboxState {
  @override
  List<Object> get props => [];
}

class InboxLoadedState extends InboxState {
  InboxLoadedState(this.messages);

  final List<MessageModel> messages;

  @override
  List<Object> get props => [messages];
}

class InboxErrorState extends InboxState {
  @override
  List<Object> get props => [];
}