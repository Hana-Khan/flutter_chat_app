import 'package:flutter/material.dart';

final kHeadingStyle =
    TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold, color: Colors.black);

final kTextFieldStyle = TextStyle(color: Colors.grey, fontSize: 16.0);


const kSendButtonTextStyle = TextStyle(
    fontFamily: 'Montserrat',
    color: Colors.white,
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
  );

const kMessageTextFieldDecoration = 
InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Write something...',
  hintStyle: TextStyle(
    fontSize: 12,
    ),
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

 const kTitleTextStyle = TextStyle(
    fontFamily: 'Montserrat',
    color: Color(0xff333333),
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
  );

const ksubtitleTextStyle = TextStyle(
  fontSize: 13,
  fontWeight: FontWeight.normal,
  color: Color(0xff818181)
);
