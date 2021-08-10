import 'package:flutter/material.dart';

import '../../constants.dart';

class FormTextField extends StatefulWidget {
  final TextEditingController controller;
  final String textFieldTitle;
  final String textFieldHintText;
  final IconData icon;

  FormTextField(
      {required this.controller,
      required this.textFieldTitle,
      required this.textFieldHintText,
      required this.icon});

  @override
  _FormTextFieldState createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 40.0),
          child: Text(widget.textFieldTitle, style: kTextFieldStyle),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.withOpacity(0.5),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Row(
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                child: Icon(
                  widget.icon,
                  color: Colors.grey,
                ),
              ),
              Container(
                height: 30.0,
                width: 1.0,
                color: Colors.grey.withOpacity(0.5),
                margin: const EdgeInsets.only(left: 00.0, right: 10.0),
              ),
              Expanded(
                child: TextField(
                  controller: widget.controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: widget.textFieldHintText,
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
