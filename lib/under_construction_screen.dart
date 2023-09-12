import 'package:flutter/material.dart';
import './main.dart';

class UnderConstruction extends StatelessWidget {
  const UnderConstruction({super.key});
  @override
  Widget build(BuildContext context) {
    return (Center(
      child: Column(children: [
        Icon(Icons.construction, size: 300, color: palette.white),
        const SizedBox(height: 20),
        const BackButton()
      ]),
    ));
  }
}
