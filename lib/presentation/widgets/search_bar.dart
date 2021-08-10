
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/utilities/SizeConfig.dart';
import 'package:flutter_chat_app/utilities/colors.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      alignment: Alignment.center,
      height: SizeConfig.convertHeight(context, 100),
      width: double.infinity,
      padding: EdgeInsets.only(left:10,right:10),
      child: Container(
          height: 50,
          decoration: BoxDecoration(
            border:Border.all(
            color: Colors.grey, width: 2),
          ),
          child: TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: "Search here",
              hintStyle: TextStyle(
                color: searchGray,
                ),
              suffixIcon: Icon(
                Icons.search,
                color: lightGray,
              ),
              contentPadding: EdgeInsets.symmetric(
                  horizontal: 16, vertical: 4),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white, width: 0)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white, width: 0)),
            ),
          )
        ),
    );
  }
}
