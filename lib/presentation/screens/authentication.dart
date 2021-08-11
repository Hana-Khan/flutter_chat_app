import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_app/constants.dart';
import 'package:flutter_chat_app/cubits/authentication/authentication_cubit.dart';
import 'package:flutter_chat_app/presentation/screens/chat.dart';
import 'package:flutter_chat_app/presentation/screens/inbox.dart';
import 'package:flutter_chat_app/presentation/widgets/clipper.dart';

class AuthenticationScreen extends StatefulWidget {
  final Color? backgroundColor;
  final AssetImage? backgroundImage;

  AuthenticationScreen({Key? key, this.backgroundColor, this.backgroundImage});

  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  bool login = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void showSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticateUserCubit, AuthenticateUserState>(
      listener: (context, state) {
        switch (state) {
          case AuthenticateUserState.loginSuccess:
            if (login) {
              showSnackBar(
                  'Login Successful ${context.read<AuthenticateUserCubit>().myUser!.userEmail}');
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChatScreen()));
            } else {
              showSnackBar(
                  'Registration Successful ${context.read<AuthenticateUserCubit>().myUser!.userEmail}');
            }
            break;
          case AuthenticateUserState.failed:
            showSnackBar('Failed');
            break;
          case AuthenticateUserState.user_exists:
            showSnackBar('This user already exist');
            break;
          case AuthenticateUserState.initial:
            // TODO: Handle this case.
            break;
          case AuthenticateUserState.loading:
            // TODO: Handle this case.
            break;
        }
      },
      builder: (context, state) => Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: this.widget.backgroundColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                    decoration: BoxDecoration(
                      image: new DecorationImage(
                        image: AssetImage('assets/full_bloom.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: 100.0, bottom: 100.0),
                    child: Column(
                      children: <Widget>[
                        Text("Chat App", style: kHeadingStyle),
                        Text(
                          login ? 'Login' : 'Register',
                          style: kHeadingStyle.copyWith(fontSize: 20.0),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Text("Email", style: kTextFieldStyle),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.5),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Row(
                    children: <Widget>[
                      new Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 15.0),
                        child: Icon(
                          Icons.person_outline,
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        height: 30.0,
                        width: 1.0,
                        color: Colors.grey.withOpacity(0.5),
                        margin: const EdgeInsets.only(left: 00.0, right: 10.0),
                      ),
                      new Expanded(
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your email',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Text(
                    "Password",
                    style: kTextFieldStyle,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.5),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Row(
                    children: <Widget>[
                      new Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 15.0),
                        child: Icon(
                          Icons.lock_open,
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        height: 30.0,
                        width: 1.0,
                        color: Colors.grey.withOpacity(0.5),
                        margin: const EdgeInsets.only(left: 00.0, right: 10.0),
                      ),
                      new Expanded(
                        child: TextField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your password',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: new Row(
                    children: <Widget>[
                      Expanded(
                        child: TextButton(
                          child: new Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text(
                                  login ? "LOGIN" : 'REGISTER',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              new Expanded(
                                child: Container(),
                              ),
                              new Transform.translate(
                                offset: Offset(15.0, 0.0),
                                child: new Container(
                                  padding: const EdgeInsets.all(5.0),
                                  child: TextButton(
                                    child: state ==
                                            AuthenticateUserState.loading
                                        ? CircularProgressIndicator(
                                            color: Colors.black,
                                            backgroundColor: Colors.transparent,
                                          )
                                        : Icon(
                                            Icons.arrow_forward,
                                            color: Colors.black,
                                          ),
                                    onPressed: () {
                                      if (login) {
                                        context
                                            .read<AuthenticateUserCubit>()
                                            .loginUser(
                                                email: _emailController.text,
                                                password:
                                                    _passwordController.text);
                                      } else {
                                        // context
                                        //     .read<AuthenticateUserCubit>()
                                        //     .registerUser(
                                        //         email: _emailController.text,
                                        //         password:
                                        //             _passwordController.text);
                                      }
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                          onPressed: () async {
                            context.read<AuthenticateUserCubit>().logout();
                            // bool isLogin = await context
                            //     .read<AuthenticateUserCubit>()
                            //     .isUserSignIn();
                            // print(isLogin);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: new Row(
                    children: <Widget>[
                      new Expanded(
                        child: TextButton(
                          child: Container(
                            padding: const EdgeInsets.only(left: 20.0),
                            alignment: Alignment.center,
                            child: Text(
                              login
                                  ? "DON'T HAVE AN ACCOUNT?"
                                  : 'ALREADY HAVE ACCOUT? LOGIN',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          onPressed: () => setState(() {
                            login = !login;
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
