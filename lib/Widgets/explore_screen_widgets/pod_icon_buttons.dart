import 'package:flutter/material.dart';
import '../../main.dart';
import '../dummy_data.dart';

//final isSelected
class icon extends StatefulWidget {
  const icon({required this.re, required this.icony, super.key});
  final Function() re;
  final IconData icony;

  @override
  State<icon> createState() => _IconState();
}

class _IconState extends State<icon> {
  // const _iconState({ , icon});
//  final Function() re;
  //final IconData icon ;
  bool isPressed = false;
  var pulledstyle = <String>[];

  @override
  Widget build(BuildContext context) {
    return (IconButton(
      onPressed: () {
        widget.re;
        setState(() {
          isPressed = !isPressed;
        });
        debugPrint('was clicked now');
        pulledstyle = [...pulledstyle, posts[0].postedpix];
        debugPrint('$pulledstyle');
      },
      isSelected: false,
      icon: Icon(
        widget.icony,
        color: isPressed ? palette.red : palette.grey,
      ),
    ));
  }
}
