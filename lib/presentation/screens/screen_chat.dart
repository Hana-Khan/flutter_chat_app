import 'package:flutter/material.dart';
import 'package:flutter_chat_app/constants.dart';
import 'package:flutter_chat_app/presentation/widgets/clipper.dart';
import 'package:flutter_chat_app/presentation/widgets/messageBubble.dart';
import 'package:flutter_chat_app/utilities/SizeConfig.dart';
import 'package:flutter_chat_app/utilities/colors.dart';

class ChatScreen extends StatefulWidget {

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
    TextEditingController? _messageTextController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          body: SafeArea(
        child: SingleChildScrollView(
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
                      'Chat',
                      style: kHeadingStyle.copyWith(fontSize: 20.0),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: SizeConfig.convertHeight(context, 400),
              width: SizeConfig.convertWidth(context, 389),
              child: ListView.builder(
              padding: EdgeInsets.only(left: 10,right: 8),
              itemCount: 10,
              itemBuilder: (context, int index){
                return MessageBubble(
                    message:'Hello', 
                    isMe:index%2==0?true:false
                  );
                }
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side:BorderSide(color:white)),
              child: TextField(
                autofocus: true,
                controller: _messageTextController,
                onChanged: (value) {          
                              
                },
                  minLines: 6, 
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: kMessageTextFieldDecoration,
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(8),
              child: Container(
                width: SizeConfig.convertHeight(context, 60),
                height: SizeConfig.convertWidth(context, 40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  gradient: LinearGradient(
                    colors: [peachGradient, purpleGradient],
                    begin: const FractionalOffset(0.2, 0.2),
                    end: const FractionalOffset(1.0, 1.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp
                  )
                ),
                child: Builder(builder: (BuildContext context) {
                  return MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0)
                        )
                      ),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Send',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    onPressed: () async {
                       
                      }
                        );
                       }  
                      )
                    ),
                  ),
                ]
              )
            )
          )
        )
      ),
    );
  }
}

