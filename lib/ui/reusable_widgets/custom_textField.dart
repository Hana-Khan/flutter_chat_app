// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_chat_app/utilities/SizeConfig.dart';

// class CustomizableTextField extends StatefulWidget {
//   String? hintText;
//   bool? enable;
//   bool? isPasswordField;
//   TextEditingController? controller;
//   TextInputType? textInputType;
//   TextCapitalization? textCapitalization;
//   List<TextInputFormatter>? textInputFormatter;
//   final Function? validator;
//   bool? obsecuretext;
//   Widget? eyeIcon;

//   CustomizableTextField({
//     Key? key,
//     @required this.hintText,
//     @required this.enable,
//     @required this.isPasswordField,
//     @required this.controller,
//     @required this.textInputType,
//     @required this.textCapitalization,
//     @required this.textInputFormatter,
//     required this.validator,
//     @required this.obsecuretext,
//     @required this.eyeIcon,
//   });

//   @override
//   _CustomizableTextFieldState createState() => _CustomizableTextFieldState();
// }

// class _CustomizableTextFieldState extends State<CustomizableTextField> {

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: SizeConfig.blockSizeHorizontal! * 16,
//       width: SizeConfig.blockSizeHorizontal! * 70,
//       child: TextFormField(
//         autovalidateMode: AutovalidateMode.onUserInteraction,
//         obscureText: widget.obsecuretext!,
//         controller: widget.controller,
//         keyboardType: widget.textInputType,
//         // textCapitalization: textCapitalization,
//         enabled: widget.enable,
//         inputFormatters: widget.textInputFormatter,
//         validator: widget.validator,
//         showCursor: true,
//         decoration: InputDecoration(
//           suffixIcon: widget.eyeIcon,
//           helperText: ' ',
//           labelText: widget.hintText,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.all(Radius.circular(13.0)),
//             borderSide: BorderSide(
//               color: Colors.grey,
//               style: BorderStyle.none,
//             ),
//           ),
//           filled: true,
//           fillColor: Color(0xFFF2F3F5),
//           hintStyle: TextStyle(
//               color: Color(0xFF666666),
//               ),
//         ),
//       ),
//     );
//   }
// }
