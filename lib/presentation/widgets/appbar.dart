
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/utilities/SizeConfig.dart';

class AppBarContainer extends StatelessWidget {
  final String? titletext;
  AppBarContainer({this.titletext});
  

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.convertHeight(context, 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 18,
              color: Color(0xFF3a3737),
            ),
            onPressed: () {
                Navigator.of(context).pop();
            } 
          ),

          Text(titletext!, 
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF3a3737),
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
          Container(
            child: IconButton(
              icon: new Icon(Icons.notification_important,color: Color(0xFF3a3737),
              size: 28,),
              onPressed: () {
              }
            ),
          ),
        ],
      ),
    );
  }
}