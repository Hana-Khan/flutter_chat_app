import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_chat_app/constants.dart';
import 'package:flutter_chat_app/utilities/SizeConfig.dart';
import 'package:flutter_chat_app/utilities/colors.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({ Key? key }) : super(key: key);

  @override
  _RequestScreenState createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: ListView.separated(
        separatorBuilder: (context, index) =>
          SizedBox(
            height:SizeConfig.convertHeight(context, 7),
          ),
          physics: ScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: 12,
          itemBuilder: (BuildContext context, int index) {
          return RequestCard();
        }
      )
    );
  }
}

class RequestCard extends StatelessWidget {
  const RequestCard({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

      },
      child: Container(
        height:SizeConfig.convertHeight(context, 120),
        width: SizeConfig.convertWidth(context, 100),
        child: Card(
          color: white,
          elevation: 0.5,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/profile.jpg",
                      height: SizeConfig.convertHeight(context, 50),
                      width: SizeConfig.convertWidth(context, 50),
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width:SizeConfig.convertWidth(context, 15),),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'User name',
                          textAlign: TextAlign.left,
                          style: kTitleTextStyle,
                        ),
                        Text(
                          'User Bio',
                          textAlign: TextAlign.left,
                          style: ksubtitleTextStyle,
                        ),
                      ],
                    ), 
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                       width: SizeConfig.convertWidth(context, 35),
                       height: SizeConfig.convertHeight(context,29),
                      alignment: Alignment.topCenter,
                       decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(70.0),
                          ),
                        color: Colors.red,
                      ),
                      child: IconButton(
                        highlightColor:  Colors.red.withOpacity(0.4),
                        icon: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 20,
                        ), onPressed: () {
                          
                         },),
                    )
                  ,
                    SizedBox(width: SizeConfig.convertWidth(context, 10),),
                     Container(
                       width: SizeConfig.convertWidth(context, 35),
                       height: SizeConfig.convertHeight(context,29),
                       alignment: Alignment.topCenter,
                       decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(70.0),
                          ),
                        color: greenColor,
                      ),
                       child: IconButton(
                        highlightColor: greenColor.withOpacity(0.4),//lightGray,
                          icon: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 20,
                          ), onPressed: () {  },
                    ),
                     ),
                  ],
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}