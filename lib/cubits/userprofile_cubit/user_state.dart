import 'package:equatable/equatable.dart';
import 'package:flutter_chat_app/data_repo/models/message_model.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitialState extends UserState {
  @override
  List<Object> get props => [];
}
