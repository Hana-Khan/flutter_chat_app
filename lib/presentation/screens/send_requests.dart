import 'package:flutter/material.dart';
import 'package:flutter_chat_app/constants.dart';
import 'package:flutter_chat_app/utilities/SizeConfig.dart';
import 'package:flutter_chat_app/utilities/colors.dart';

class SendRequestScreen extends StatefulWidget {
  const SendRequestScreen({Key? key}) : super(key: key);

  @override
  _SendRequestScreenState createState() => _SendRequestScreenState();
}

class _SendRequestScreenState extends State<SendRequestScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
                  height: SizeConfig.convertHeight(context, 7),
                ),
            physics: ScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: 12,
            itemBuilder: (BuildContext context, int index) {
              return SendRequestCard();
            }));
  }
}

class SendRequestCard extends StatelessWidget {
  const SendRequestCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
          height: SizeConfig.convertHeight(context, 120),
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
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/profile.jpg",
                        height: SizeConfig.convertHeight(context, 50),
                        width: SizeConfig.convertWidth(context, 50),
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: SizeConfig.convertWidth(context, 15),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
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
                  Container(
                    width: SizeConfig.convertWidth(context, 35),
                    height: SizeConfig.convertHeight(context, 29),
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                      color: gray,
                    ),
                    child: IconButton(
                      highlightColor: Colors.red.withOpacity(0.4),
                      icon: Icon(
                        Icons.add,
                        color: grayish,
                        size: 20,
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
