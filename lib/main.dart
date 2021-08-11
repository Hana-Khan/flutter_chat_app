import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_chat_app/cubits/authentication/authentication_cubit.dart';
import 'package:flutter_chat_app/cubits/userprofile_cubit/user_cubit.dart';
import 'package:flutter_chat_app/cubits/userprofile_cubit/user_state.dart';
import 'package:flutter_chat_app/presentation/screens/wrapper.dart';

import 'presentation/screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AuthenticateUserCubit(AuthenticateUserState.initial),
        ),
        BlocProvider(
          create: (context) => UserCubit(UserCubitState.initial),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Demo Chat App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //home: HomeScreen(),
        home: Wrapper(),
      ),
    );
  }
}
