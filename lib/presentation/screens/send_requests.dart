import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_app/constants.dart';
import 'package:flutter_chat_app/cubits/userprofile_cubit/user_cubit.dart';
import 'package:flutter_chat_app/cubits/userprofile_cubit/user_state.dart';
import 'package:flutter_chat_app/data_repo/models/user_model.dart';
import 'package:flutter_chat_app/utilities/SizeConfig.dart';
import 'package:flutter_chat_app/utilities/colors.dart';

class SendRequestScreen extends StatefulWidget {
  const SendRequestScreen({Key? key}) : super(key: key);

  @override
  _SendRequestScreenState createState() => _SendRequestScreenState();
}

class _SendRequestScreenState extends State<SendRequestScreen> {
  UserCubit? userCubit;
  List<MyUser>? usersList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userCubit = BlocProvider.of<UserCubit>(context);
    userCubit!.getListOfUsers();
  }

  @override
  void dispose() {
    super.dispose();
    userCubit!.onClose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: BlocBuilder<UserCubit, UserCubitState>(
      bloc: userCubit,
      builder: (context, state) {
        if (state == UserCubitState.usersLoaded) {
          usersList = userCubit!.usersList;
          return ListView.separated(
            separatorBuilder: (context, index) => 
              Divider(thickness: 1,),
              // SizedBox(
              //   height: SizeConfig.convertHeight(context, 4),
              // ),
              physics: ScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: usersList!.length,
              itemBuilder: (BuildContext context, int index) {
                return SendRequestCard(
                  userName: usersList![index].userName!,
                  userBio: usersList![index].userAbout!,
                );
              });
        } else if (state == UserCubitState.loading) {
          return CircularProgressIndicator();
        } else {
          return Center(
            child: Text('Error'),
          );
        }
      },
    ));
  }
}

class SendRequestCard extends StatelessWidget {
  final String userName;
  final String userBio;

  const SendRequestCard(
      {Key? key, required this.userName, required this.userBio})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
          height: SizeConfig.convertHeight(context, 100),
          width: SizeConfig.convertWidth(context, 100),
          child: Card(
            color: white,
            elevation: 0.1,
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage("assets/images/profile.jpg",),
                      ),
                      SizedBox(
                        width: SizeConfig.convertWidth(context, 15),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            userName,
                            textAlign: TextAlign.left,
                            style: kTitleTextStyle,
                          ),
                          Text(
                            userBio,
                            textAlign: TextAlign.left,
                            style: ksubtitleTextStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    width: SizeConfig.convertWidth(context, 41),
                    height: SizeConfig.convertHeight(context, 32),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: grayish),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                        
                      ),
                      color: whitish,
                    ),
                    child: IconButton(
                      highlightColor: Colors.red.withOpacity(0.4),
                      icon: Icon(
                        Icons.person_add_alt_1_outlined,
                        color: grayish,
                        size: 25,
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
