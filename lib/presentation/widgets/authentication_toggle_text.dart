import 'package:flutter/material.dart';

class AuthenticationToggleText extends StatelessWidget {

  final String text;
  final VoidCallback onClickFunction;

  AuthenticationToggleText({required this.text, required this.onClickFunction});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0, bottom: 30.0),
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: TextButton(
              child: Container(
                padding: const EdgeInsets.only(left: 20.0),
                alignment: Alignment.center,
                child: Text(
                  text,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              onPressed: onClickFunction
                  ),
          ),
        ],
      ),
    );
  }
}
