import 'package:flutter/material.dart';
import 'main.dart';

//texty form widget
Widget textyfield(
  context,
  String labeltext,
  String hinttext, {
  TextInputType keyboardtype = TextInputType.text,
  double width = 350,
  double height = 40,
  void Function(String)? onChanged,
  void Function()? onEditingComplete,
  bool obscureText = false,
}) {
  return (SizedBox(
      height: 40,
      width: 300,
      //  color: palette. lightPurple,
      child: TextField(
        keyboardType: keyboardtype,
        cursorColor: palette.white,
        obscureText: obscureText,
        onEditingComplete: onEditingComplete,
        onChanged: onChanged,
      )));
}

// textybutton //
///
/////
///
///
///
///
Widget textybutton(context, String name, Function() re) {
  return (Container(
    decoration: BoxDecoration(
      color: palette.red,
      borderRadius: BorderRadius.circular(9),
    ),
    child: TextButton(
      onPressed: re,
      child: Text(
        name,
        style: TextStyle(color: palette.white),
      ),

      //   style: ButtonStyle(backgroundColor: Colors.blue),
    ),
  ));
}

Widget iconybutton(
  context,
  IconData icon,
  double size,
  Function() re,
) {
  return (IconButton.outlined(onPressed: re, icon: Icon(icon, size: size)));
}
