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
            _buildMessageBox()
                ]
              )
            )
          )
        )
      ),
    );
  }
}

class _buildMessageBox extends StatelessWidget {
  const _buildMessageBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Theme.of(context).accentColor),
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Form(
            // key: _formKey,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 8,
                  child: TextFormField(
                    key: Key('Message'),
                    // validator: NameFieldValidator.validate,
                    // onSaved: (value) => _message = value,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Message',
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: InkWell(
                    // onTap: _sendMessage,
                    child: Icon(Icons.send),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

