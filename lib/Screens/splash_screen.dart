import 'dart:async';
import 'package:flutter/material.dart';

import './swagr_house.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = Duration(seconds: 4);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacement(PageRouteBuilder(
        pageBuilder: ((context, animation, secondaryAnimation) =>
            const SwagrHouse())));
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.local_fire_department_rounded, size: 60, color: palette.red),
        Text('explore fashion',
            style: TextStyle(
                color: palette.black,
                fontSize: 30,
                fontWeight: FontWeight.w900))
      ],
    ));
  }
}
