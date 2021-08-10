import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_app/cubits/authentication/authentication_cubit.dart';
import 'package:flutter_chat_app/presentation/widgets/auth_background.dart';
import 'package:flutter_chat_app/presentation/widgets/authentication_toggle_text.dart';
import 'package:flutter_chat_app/presentation/widgets/textfield_widget.dart';

import '../../constants.dart';

class RegisterUser extends StatefulWidget {
  RegisterUser({Key? key});

  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _genderController = TextEditingController();
  final _descriptionController = TextEditingController();

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
                'Registration Successful ${context.read<AuthenticateUserCubit>().myUser!.email}');
            break;
          case AuthenticateUserState.failed:
            showSnackBar('Failed');
            break;
          case AuthenticateUserState.user_exists:
            showSnackBar('This user already exist');
            break;
        }
      },
      builder: (context, state) => Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                AuthBackground(
                  screenTitle: 'Register',
                ),
                FormTextField(
                  controller: _nameController,
                  textFieldTitle: 'Name',
                  textFieldHintText: 'Enter your name',
                  icon: Icons.person_outline_outlined,
                ),
                FormTextField(
                  controller: _emailController,
                  textFieldTitle: 'Email',
                  textFieldHintText: 'Enter your email',
                  icon: Icons.email_outlined,
                ),
                FormTextField(
                  controller: _passwordController,
                  textFieldTitle: 'Password',
                  textFieldHintText: 'Enter Your password',
                  icon: Icons.lock_open,
                ),
                FormTextField(
                  controller: _phoneNumberController,
                  textFieldTitle: 'Contact Number',
                  textFieldHintText: 'Enter your contact number',
                  icon: Icons.phone_android_outlined,
                ),
                FormTextField(
                  controller: _genderController,
                  textFieldTitle: 'Gender',
                  textFieldHintText: 'Enter your gender',
                  icon: Icons.male_outlined,
                ),
                FormTextField(
                  controller: _descriptionController,
                  textFieldTitle: 'About',
                  textFieldHintText: 'Enter description',
                  icon: Icons.contact_mail_outlined,
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
                                'Register',
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
                AuthenticationToggleText(
                    text: 'Already Have Account? Log In',
                    onClickFunction: () => Navigator.pop(context)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
