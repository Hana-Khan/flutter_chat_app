import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_app/cubits/authentication/authentication_cubit.dart';
import 'package:flutter_chat_app/presentation/screens/authentication.dart';
import 'package:flutter_chat_app/presentation/screens/screen_chat.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: getLoginStatus(),
        builder: (context, snapshot) {
          if (snapshot.data == true) {
            return ChatScreen();
          } else {
            return AuthenticationScreen();
          }
        });
  }

  Future<bool> getLoginStatus() async {
    return BlocProvider.of<AuthenticateUserCubit>(context).isUserSignIn();
  }
}
