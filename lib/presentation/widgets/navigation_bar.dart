
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/presentation/screens/screen_home.dart';
import 'package:flutter_chat_app/presentation/screens/screen_inbox.dart';
import 'package:flutter_chat_app/utilities/SizeConfig.dart';
import 'package:flutter_chat_app/utilities/colors.dart';

class BottomNavigation extends StatefulWidget {

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}
class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: blackButton,
      shape: CircularNotchedRectangle(),
      notchMargin: 3.0,
      child: Container(
      height: SizeConfig.convertHeight(context, 50),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            iconSize: 30.0,
            icon: Icon(Icons.person,color: white),
            onPressed: () {
              // Navigator.push(
              //   context, 
              //   MaterialPageRoute(builder: (context) => InboxScreen()),
              // );
            },
          ),
          IconButton(
            iconSize: 30.0,
            icon: Icon(Icons.home,color: white),
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
          IconButton(
            iconSize: 30.0,
            icon: Icon(Icons.chat_bubble,color: white),
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => InboxScreen()),
              );
            },
          )
          ],
        ),
      ),
    );
  }
}
