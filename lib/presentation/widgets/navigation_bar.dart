
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/presentation/screens/screen_home.dart';
import 'package:flutter_chat_app/presentation/screens/screen_inbox.dart';
import 'package:flutter_chat_app/presentation/screens/user_profile.dart';
import 'package:flutter_chat_app/utilities/SizeConfig.dart';
import 'package:flutter_chat_app/utilities/colors.dart';

class BottomNavigation extends StatefulWidget {

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}
class _BottomNavigationState extends State<BottomNavigation> {

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 3.0,
      color: white,
      shape: CircularNotchedRectangle(),
      notchMargin: 3.0,
      child: Container(
        height: SizeConfig.convertHeight(context, 46),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            iconSize: 30.0,
            icon: Icon(Icons.person,color: grayish),
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => UserProfile()),
              );
            },
          ),
          IconButton(
            iconSize: 30.0,
            icon: Icon(Icons.home,color: grayish),
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
          IconButton(
            iconSize: 30.0,
            icon: Icon(Icons.chat_bubble,color: grayish),
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => InboxScreen()),
              );
            },
          )
          ],
        ),
      ),
    );
  }
}

//   int pageIndex = 0;

//  Widget _showPage =  new HomeScreen();

//  Widget _pageChooser(int page)
//     {
//         switch (page)
//         {
//           case 0:
//             return UserProfile();
//             break;

//           case 1:
//             return HomeScreen();
//             break;

//           case 2:
//             return InboxScreen();
//             break;


//           default:
//             return HomeScreen();
//         }
//     }


// @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         bottomNavigationBar: Container(
//           decoration: new BoxDecoration(
//             // borderRadius: BorderRadius.circular(28.0),
//             gradient: LinearGradient(
//                 begin: Alignment.topRight,
//                 end: Alignment.bottomLeft,
//                 colors: [Colors.deepPurple, Colors.purple]),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black,
//                 blurRadius: 25.0, // soften the shadow
//                 spreadRadius: -10.0, //extend the shadow
//               )
//             ],
//           ),
//           child: CurvedNavigationBar(
//             index: 2,
//             color: Color.fromRGBO(58, 66, 86, 1.0),
//             buttonBackgroundColor: Colors.purple.withOpacity(0.6),
//             backgroundColor: Colors.transparent,
//             animationDuration: Duration(milliseconds: 200),
//             animationCurve: Curves.bounceInOut,
//             items: <Widget>[
//               Icon(Icons.person, size: 32, color: Colors.white,),
//               Icon(Icons.home, size: 40, color: Colors.white,),
//               Icon(Icons.chat, size: 32, color: Colors.white,),
//             ],
//           onTap: (int tappedPage){
//             setState(() {
//               _showPage = _pageChooser(tappedPage);
//             });
//           }
//         ),
//         ),
//         body: Container(
//           color: Colors.transparent,
//           child: Center(
//             child: _showPage,
//       ),
//     ));
//   }


// }