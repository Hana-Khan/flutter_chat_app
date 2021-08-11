import 'package:flutter/material.dart';
import 'package:flutter_chat_app/constants.dart';
import 'package:flutter_chat_app/presentation/screens/screen_chat.dart';
import 'package:flutter_chat_app/presentation/widgets/clipper.dart';
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
                  child: Text(
                      'Inbox',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: selectedColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      )
                    ),
                  ),
              ),
              SizedBox(
                height:SizeConfig.convertHeight(context, 10),
              ),
              Container(
                height: SizeConfig.convertHeight(context, 500),
                width: SizeConfig.convertWidth(context, 389),
                child: ListView.builder(
                padding: EdgeInsets.only(left: 10,right: 8),
                itemCount: 10,
                itemBuilder: (context, int index){
                  return ConversationUser(
                    userId: '123',
                    userName: 'Hina',
                    );
                  }
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}

class ConversationUser extends StatelessWidget {
  String? userId,userName;

  ConversationUser({
    this.userId,
    this.userName,
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
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //profle image
                  CircleAvatar(
                    radius: 30,
                    backgroundImage:  AssetImage('assets/images/profile.jpg'),
                  ),
                  
                  SizedBox(
                    width: 16,
                  ),
                  Container(
                    width: SizeConfig.convertHeight(context, 50),
                    child: Container(
                      child: Text(
                        userName!,
                        style: TextStyle(
                            color: Colors.grey.shade900,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
    
                  //time
                  Container(
                    child: Text(
                      '',
                      // time[index],
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 4
            ),
            Divider(color: Colors.grey.shade700,height: 1,),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      );
  }
}
