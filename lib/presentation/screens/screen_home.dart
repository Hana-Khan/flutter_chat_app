import 'package:flutter/material.dart';
import 'package:flutter_chat_app/presentation/screens/screen_requests.dart';
import 'package:flutter_chat_app/presentation/screens/screen_send_requests.dart';
import 'package:flutter_chat_app/presentation/widgets/navigation_bar.dart';
import 'package:flutter_chat_app/presentation/widgets/search_bar.dart';
import 'package:flutter_chat_app/utilities/SizeConfig.dart';
import 'package:flutter_chat_app/utilities/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  int _selectedIndex = 0;

  final tabs = [
    RequestScreen(),
    SendRequestScreen(),
  ];
  Future<void> _onTapped(int index) async {
    //
    if (index == 0) {
      setState(() {
         _selectedIndex = index;
      });
    }
    else if(index==1){
      setState(() {
         _selectedIndex = index;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: screenBackground,
        bottomNavigationBar: BottomNavigation(),
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(
            // top:SizeConfig.convertHeight(context, 20),
            left: SizeConfig.convertWidth(context, 20),
            bottom: SizeConfig.convertHeight(context, 20),
            right: SizeConfig.convertWidth(context, 20)
          ),
          child: Column(
            children: [
              Container(
                color: white,
                alignment: Alignment.center,
                height: SizeConfig.convertHeight(context, 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    onTap: (){
                      _onTapped(0);
                      // _selectedIndex=0;
                    },
                    child: Ink( 
                      color: Colors.transparent,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                            'Requests',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: _selectedIndex==0?selectedColor:notSelectedColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            )
                          ),
                      ),
                    ),
                  ),
                    InkWell(
                      splashColor: Colors.transparent,
                      onTap: (){
                        _onTapped(1);
                        // _selectedIndex=1;
                      },
                      child: Ink( 
                        color: Colors.transparent,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Add Friends',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: _selectedIndex==1?selectedColor:notSelectedColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            )
                          ),
                        ),
                      ),
                    ),
                ],),
              ),
              SizedBox(
                height:SizeConfig.convertHeight(context, 10),
              ),
              Container(
                color: white,
                alignment: Alignment.center,
                height: SizeConfig.convertHeight(context, 80),
                width: double.infinity,
                child: SearchContainer()
              ),
              SizedBox(
                height:SizeConfig.convertHeight(context, 10),
              ),
              Container(
                color: screenBackground,
                alignment: Alignment.topCenter,
                height: SizeConfig.convertHeight(context, 450),
                child: tabs[_selectedIndex],
              ),
            ],
          ),
        ),
      ),  
    );
  }
}
