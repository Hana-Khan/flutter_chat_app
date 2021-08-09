// import 'package:flutter/material.dart';
// import 'package:flutter_chat_app/ui/reusable_widgets/custom_textField.dart';
// import 'package:flutter_chat_app/utilities/SizeConfig.dart';

// class SignUpScreen extends StatefulWidget {
//   @override
//   _SignUpScreenState createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   bool isPasswordField=false;

//   bool _showPassword = false;
//   bool obsecuretext=false;
//   TextEditingController usernameController = TextEditingController();

//   TextEditingController passwordController = TextEditingController();

//   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();

//   var _username;

//   var _password;

//   var _regNumbervalue;

//   bool? _isLoading;

//   bool? _isSigningIn;

//   bool? _isPassword;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Color(0xffF0F0F0),
//         body: SingleChildScrollView(
//           physics: NeverScrollableScrollPhysics(),
//           padding: EdgeInsets.only(top: 20,bottom: 10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: SizeConfig.blockSizeVertical! * 4,
//               ),
//               Container(
//             child: Text('Sign Up', 
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               color: Color(0xff740412),
//               fontSize: 20,
//               fontWeight: FontWeight.bold
//             ),),),

//             SizedBox(
//                 height: SizeConfig.blockSizeVertical! * 2,
//               ),
//               form(),
//               SizedBox(
//                 height: SizeConfig.blockSizeVertical! * 2,
//               ),
//               Container(
//                 width: SizeConfig.blockSizeHorizontal! * 70,
//                 // height: SizeConfig.blockSizeVertical*5,
//                 decoration: BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                         color: Color(0xff740412),
//                       ),
//                 child: Builder(builder: (BuildContext context) {
//                   return MaterialButton(
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(5.0)
//                           )
//                         ),
//                     child: Container(
//                       alignment: Alignment.topCenter,
//                       child: Text(
//                         'text',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 16.0,
//                           fontWeight: FontWeight.normal,
//                         ),
//                       ),
//                     ),
//                   onPressed: (){

//                   }
//                   );
//                 }  
//               )
//             )
//           ]
//         )
//       )
//     )
//   );
//   }

//   form() {

//     return Form(
//       key: formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//            CustomizableTextField(
//               controller: usernameController,
//               obsecuretext: false,
//               hintText: 'Username',
//               isPasswordField: false,
//               // textInputType: TextInputType.text,
//               textCapitalization: TextCapitalization.words,
//               // enable:_isSigningUIn ? false : true,
//               validator: (usernamevalue) {
//                 if (usernamevalue.isEmpty) {
//                   return 'Enter your Full Name.';
//                 } else
//                   _username = usernamevalue;

//                 return null;
//               }),
//           SizedBox(height: SizeConfig.blockSizeVertical! * 1),
//           CustomizableTextField(
//               controller: usernameController,
//               obsecuretext: false,
//               hintText: 'Email Address',
//               isPasswordField: false,
//               // textInputType: TextInputType.text,
//               textCapitalization: TextCapitalization.words,
//               // enable:_isSigningUIn ? false : true,
//               validator: (usernamevalue) {
//                 if (usernamevalue.isEmpty) {
//                   return 'Enter your Email address.';
//                 } else
//                   _username = usernamevalue;

//                 return null;
//               }),
//           SizedBox(height: SizeConfig.blockSizeVertical! * 1),
//           CustomizableTextField(
//               controller: passwordController,
//               obsecuretext: obsecuretext,
//               hintText: 'Password',
//               isPasswordField: true,
//               textInputType: TextInputType.text,
//               // enable:_isSigningIn ? false : true,
//               eyeIcon: isPasswordField
//               ? IconButton(
//                   icon: Icon(
//                     Icons.remove_red_eye,
//                     color: _showPassword ? Colors.blue : Colors.grey,
//                   ),
//                   onPressed: () {
//                     setState(() {
//                       _showPassword=!_showPassword;
//                       obsecuretext = !obsecuretext;
//                     });
//                   },
//                 )
//               : null,
//               validator: (passwordValue) {
//                 if (passwordValue.isEmpty) {
//                   return 'Enter any password.';
//                 } else
//                   _password = passwordValue;
//                 return null;
//               }),
//               SizedBox(height: SizeConfig.blockSizeVertical! * 1),
//           CustomizableTextField(
//               controller: passwordController,
//               obsecuretext: true,
//               hintText: 'Confirm Password',
//               isPasswordField: true,
//               textInputType: TextInputType.text,
//               // enable:_isSigningIn ? false : true,
//               validator: (passwordValue) {
//                 if (passwordValue.isEmpty) {
//                   return 'Enter any password.';
//                 } else
//                   _password = passwordValue;
//                 return null;
//               }),
              
//         ],
//       ),
//     );
//   }
// }