import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_app/constants.dart';
import 'package:flutter_chat_app/cubits/authentication/authentication_cubit.dart';
import 'package:flutter_chat_app/cubits/userprofile_cubit/profile_cubit.dart';
import 'package:flutter_chat_app/cubits/userprofile_cubit/profile_state.dart';
import 'package:flutter_chat_app/cubits/userprofile_cubit/user_cubit.dart';
import 'package:flutter_chat_app/cubits/userprofile_cubit/user_state.dart';
import 'package:flutter_chat_app/presentation/screens/login.dart';
import 'package:flutter_chat_app/presentation/widgets/navigation_bar.dart';

class UserProfile extends StatefulWidget {

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ProfileCubit>(context).getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(),
      appBar: AppBar(
        elevation: 3.0,
        title: Text(
          'Profile',
          style: kTextFieldStyle.copyWith(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () async {
              await BlocProvider.of<AuthenticateUserCubit>(context).logout();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginUser()));
            },
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: 
      BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is FailedToLoadProfile) {
            return Center(
              child: Icon(Icons.close),
            );
          } else if (state is ProfileLoadedState) {
            final user = state.user;
              return SingleChildScrollView(
                child: Container(
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
                                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                                radius: 70,
                            )),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              user.userName.toString(),
                              style: kTextFieldStyle.copyWith(
                                  fontSize: 30, color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                        child: Column(
                          children: [
                            ProfileDetail(
                              textDetail: 'Email',
                              textDetailValue: user.userEmail.toString(),
                              icon: Icons.mail_outline,
                            ),
                            Divider(
                              thickness: 1,
                              height: 30,
                            ),
                            ProfileDetail(
                              textDetail: 'Gender',
                              textDetailValue: user.userGender.toString(),
                              icon: Icons.male,
                            ),
                            Divider(
                              thickness: 1,
                              height: 30,
                            ),
                            ProfileDetail(
                              textDetail: 'Contact Number',
                              textDetailValue: user.userContactNo.toString(),
                              icon: Icons.phone_android_outlined,
                            ),
                            Divider(
                              thickness: 1,
                              height: 30,
                            ),
                            ProfileDetail(
                              textDetail: 'About',
                              textDetailValue:user.userAbout.toString(),
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
          else {
            return Container();
          }
        }
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
