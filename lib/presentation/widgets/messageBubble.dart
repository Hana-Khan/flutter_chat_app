
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/utilities/colors.dart';

Widget MessageBubble({String? message,bool? isMe}){
  return Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: isMe!?MainAxisAlignment.end:MainAxisAlignment.start,
    children: [
      !isMe?CircleAvatar(
        backgroundColor: whitish,
        radius: 20.0,
        backgroundImage: AssetImage('assets/images/profile.jpg',)
      ):Container(),
      // Expanded(
      //   child: Container(
      //     margin: EdgeInsets.all(6),
      //     child: Material(
      //       borderRadius: BorderRadius.all(Radius.circular(30.0)) ,
      //       elevation: 5.0,
      //       color: isMe ? peachGradient : Colors.white,
      //       child: Padding(
      //         padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      //         child: Text(
      //           message,
      //           overflow: TextOverflow.ellipsis,
      //           style: TextStyle(
      //             color: isMe ? Colors.white : Colors.black54,
      //             fontSize: 15.0,
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
      Container(
        margin: const EdgeInsets.all(3.0),
          padding: EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 10.0,
          ),
            decoration: BoxDecoration(
              color: (isMe?peachGradient:white),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
          //  side:BorderSide(color:isMe?peachGradient:white)),
        child: Text(
          message!,
          softWrap: true,
          textAlign: isMe?TextAlign.right:TextAlign.left,
          style: TextStyle(
            fontSize: 12,
            color: isMe?white:blakish,
            ),
        ),
      ),
      isMe?CircleAvatar(
        backgroundColor: whitish,
        radius: 20.0,
        backgroundImage: AssetImage('assets/images/profile.jpg',)
      ):Container(),
    ],
  );
} 



