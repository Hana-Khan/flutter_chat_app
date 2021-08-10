import 'package:flutter/material.dart';
import 'package:flutter_chat_app/presentation/widgets/clipper.dart';

import '../../constants.dart';

class AuthBackground extends StatelessWidget {
  final String? screenTitle;

  AuthBackground({required this.screenTitle});
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        decoration: BoxDecoration(
          image: new DecorationImage(
            image: AssetImage('assets/full_bloom.png'),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 50.0, bottom: 50.0),
        child: Column(
          children: <Widget>[
            Text("Chat App", style: kHeadingStyle),
            Text(
              screenTitle!,
              style: kHeadingStyle.copyWith(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
