import 'package:flutter/material.dart';
import 'package:flutter_chat_app/constants.dart';
import 'package:flutter_chat_app/presentation/screens/screen_chat.dart';
import 'package:flutter_chat_app/presentation/widgets/clipper.dart';
import 'package:flutter_chat_app/utilities/SizeConfig.dart';

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
                  padding: EdgeInsets.only(top: 30.0, bottom: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Inbox',
                        style: kHeadingStyle.copyWith(fontSize: 20.0),
                      ),
                    ],
                  ),
                ),
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
