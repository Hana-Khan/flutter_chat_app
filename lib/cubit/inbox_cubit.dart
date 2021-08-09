import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_app/cubit/inbox%20state.dart';
import 'package:flutter_chat_app/data/repository/messages_repository.dart';

class InboxCubit extends Cubit<InboxState>{
  final MessageRepository  repository;


  InboxCubit({required this.repository}) : super(InboxInitialState()) {
    getInboxMessages();
  }


  void getInboxMessages() async{
    try{
      emit(InboxLoadingState());
      final messages = await repository.getMessages();
      emit(InboxLoadedState(messages));
    }catch (e) {
      emit(InboxErrorState());
    }

  }
}