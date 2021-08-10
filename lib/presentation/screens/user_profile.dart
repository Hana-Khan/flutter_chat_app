import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_app/constants.dart';
import 'package:flutter_chat_app/cubits/authentication/authentication_cubit.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3.0,
        title: Text(
          'Profile',
          style: kTextFieldStyle.copyWith(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: CircleAvatar(
                    radius: 70,
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Musa',
                    style: kTextFieldStyle.copyWith(
                        fontSize: 30, color: Colors.black),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                children: [
                  ProfileDetail(
                    textDetail: 'Email',
                    textDetailValue: 'musa@gmail.com',
                    icon: Icons.mail_outline,
                  ),
                  Divider(
                    thickness: 1,
                    height: 30,
                  ),
                  ProfileDetail(
                    textDetail: 'Gender',
                    textDetailValue: 'Male',
                    icon: Icons.male,
                  ),
                  Divider(
                    thickness: 1,
                    height: 30,
                  ),
                  ProfileDetail(
                    textDetail: 'Contact Number',
                    textDetailValue: '0312-1234567',
                    icon: Icons.phone_android_outlined,
                  ),
                  Divider(
                    thickness: 1,
                    height: 30,
                  ),
                  ProfileDetail(
                    textDetail: 'About',
                    textDetailValue: 'Flutter Developer',
                    icon: Icons.contact_mail_outlined,
                  ),
                  Divider(
                    thickness: 1,
                    height: 30,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProfileDetail extends StatelessWidget {
  final String textDetail;
  final String textDetailValue;
  final IconData icon;

  const ProfileDetail(
      {Key? key,
      required this.icon,
      required this.textDetailValue,
      required this.textDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.grey,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(child: Text(textDetail)),
        Text(textDetailValue),
      ],
    );
  }
}
