import 'dart:async';
import 'package:flutter/material.dart';

import '../../main.dart';
import 'swagr_house.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var duration = const Duration(seconds: 4);
    return Timer(duration, navigationPage);
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
      body: body(context),
      backgroundColor: palette.black,
      //  bottomSheet: bottomSheet(),
    );
  }

  Widget body(BuildContext context) {
    return Center(
        child: Text.rich(TextSpan(children: [
      TextSpan(
          text: '&',
          style: TextStyle(
              fontFamily: 'Geologica_Auto-Black',
              color: palette.white,
              fontSize: 70,
              fontWeight: FontWeight.w800)),
    ])));
  }
}
