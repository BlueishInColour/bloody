import 'package:flutter/material.dart';
import '../../main.dart';

class Specific extends StatefulWidget {
  const Specific({super.key});

  @override
  State<Specific> createState() => SpecificState();
}

class SpecificState extends State<Specific> {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: Text(
          'take specific/custom measurement',
          style: TextStyle(color: palette.black, fontSize: 15),
        ),
      ),
    ));
  }
}
