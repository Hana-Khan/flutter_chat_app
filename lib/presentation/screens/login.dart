import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_app/constants.dart';
import 'package:flutter_chat_app/cubits/authentication/authentication_cubit.dart';
import 'package:flutter_chat_app/presentation/screens/sign_up.dart';
import 'package:flutter_chat_app/presentation/screens/user_profile.dart';
import 'package:flutter_chat_app/presentation/widgets/auth_background.dart';
import 'package:flutter_chat_app/presentation/widgets/authentication_toggle_text.dart';
import 'package:flutter_chat_app/presentation/widgets/textfield_widget.dart';

class LoginUser extends StatefulWidget {
  LoginUser({Key? key});

  @override
  _LoginUserState createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
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
          case AuthenticateUserState.success:
            showSnackBar(
                'Login Successful ${context.read<AuthenticateUserCubit>().myUser!.email}');
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserProfile(),
              ),
            );
            break;
          case AuthenticateUserState.failed:
            showSnackBar('Failed');
            break;
        }
      },
      builder: (context, state) => Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                AuthBackground(
                  screenTitle: 'Login',
                ),
                FormTextField(
                  controller: _emailController,
                  textFieldTitle: 'Email',
                  textFieldHintText: 'Enter Your Email',
                  icon: Icons.person_outline,
                ),
                FormTextField(
                  controller: _passwordController,
                  textFieldTitle: 'Password',
                  textFieldHintText: 'Enter Your password',
                  icon: Icons.lock_open,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextButton(
                    child: state == AuthenticateUserState.loading
                        ? CircularProgressIndicator(
                            color: Colors.black,
                            backgroundColor: Colors.transparent,
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Login',
                                style: kTextFieldStyle.copyWith(
                                    color: Colors.black),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.black,
                              ),
                            ],
                          ),
                    onPressed: () {
                      context.read<AuthenticateUserCubit>().loginUser(
                          email: _emailController.text,
                          password: _passwordController.text);
                    },
                  ),
                ),
                Expanded(child: Container()),
                AuthenticationToggleText(
                  text: 'Don\'t have an account? Sign Up',
                  onClickFunction: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterUser(),
                    ),
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
