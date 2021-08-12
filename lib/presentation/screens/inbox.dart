import 'package:flutter/material.dart';
import 'package:flutter_chat_app/constants.dart';
import 'package:flutter_chat_app/presentation/screens/chat.dart';
import 'package:flutter_chat_app/presentation/widgets/navigation_bar.dart';
import 'package:flutter_chat_app/utilities/SizeConfig.dart';
import 'package:flutter_chat_app/utilities/colors.dart';

class InboxScreen extends StatefulWidget {
  final Color? backgroundColor;
  final AssetImage? backgroundImage;

  InboxScreen({Key? key, this.backgroundColor, this.backgroundImage});
  @override
  _InboxScreenState createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: screenBackground,
        bottomNavigationBar: BottomNavigation(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: this.widget.backgroundColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    color: white,
                    alignment: Alignment.center,
                    height: SizeConfig.convertHeight(context, 50),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Text('Messages',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: selectedColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.convertHeight(context, 10),
                  ),
                  Container(
                    height: SizeConfig.convertHeight(context, 500),
                    width: SizeConfig.convertWidth(context, 389),
                    child: ListView.separated(
                      itemBuilder:  (context, int index) {
                          return ConversationUser(
                            userId: '123',
                            userName: 'Hina',
                            lastMessage:'Nice to meet you!'
                          );
                        }, 
                        separatorBuilder:(context, index){
                          return SizedBox(
                            height: SizeConfig.convertHeight(context, 5),
                            child: Divider(
                              color: Colors.grey.shade700,
                              height: 1,
                            ),
                          );
                        },
                      itemCount: 4
                    ),  
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class ConversationUser extends StatelessWidget {
  String? userId, userName,lastMessage;

  ConversationUser({
    this.userId,
    this.userName,
    this.lastMessage
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatScreen()),
        );
      },
      child: Container(
        padding: EdgeInsets.only(left:12,right: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //profle image
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                ),
                SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName!,
                      style: kTitleTextStyle,
                    ),
                    Text(
                      lastMessage!,
                      style: ksubtitleTextStyle,
                    ),
                  ],
                ),
              ],
            ),
            //time
            Container(
              alignment: Alignment.topRight,
              child: Text(
                '10:00',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
