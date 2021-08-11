import 'package:equatable/equatable.dart';
import 'package:flutter_chat_app/data_repo/models/user_model.dart';


abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileInitialState extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileLoadingState extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileLoadedState extends ProfileState {
  ProfileLoadedState(this.user);
  final MyUser user;
  
  @override
  List<Object> get props => [user];
}


  class FailedToLoadProfile extends ProfileState {
    // TODO: implement failToLoadUser
    @override
  List<Object> get props => [];
  }

