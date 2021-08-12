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
          Divider(thickness: 1,),
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
    return Container(
      height:SizeConfig.convertHeight(context, 120),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("assets/images/profile.jpg",),
                ),
              SizedBox(width:SizeConfig.convertWidth(context, 15),),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'User name',
                    textAlign: TextAlign.left,
                    style: kTitleTextStyle,
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: (){
                          
                        },
                        child: Container(
                          width: SizeConfig.convertWidth(context, 70),
                          height: SizeConfig.convertHeight(context,26),
                          padding: EdgeInsets.all(8),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                              ),
                            color: Colors.blue,
                          ),
                          child:Text(
                            'Accept',
                            textAlign: TextAlign.center,
                            style: acceptBtnTextStyle,
                          ),
                        ),
                      ),
                      SizedBox(width: SizeConfig.convertWidth(context, 5),),
                      InkWell(
                        onTap: (){
                          
                        },
                        child: Container(
                         width: SizeConfig.convertWidth(context, 70),
                          height: SizeConfig.convertHeight(context,26),
                          padding: EdgeInsets.all(8),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                              ),
                            color: whitish,
                          ),
                          child:Text(
                            'Delete',
                            textAlign: TextAlign.center,
                            style: deleteBtnTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ), 
            ],
          ),
        ),
      )
    );
  }
}