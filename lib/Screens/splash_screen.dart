import 'dart:async';
import 'package:flutter/material.dart';

import './swagr_house.dart';

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
      backgroundColor: Colors.white,
      bottomSheet: bottomSheet(),
    );
  }

  Widget body(BuildContext context) {
    return Center(
        child: CircleAvatar(
      backgroundColor: palette.red,
      radius: 50,
      child: Icon(
        size: 70,
        color: palette.white,
        Icons.local_fire_department_outlined,
      ),
    ));
  }

  bottomSheet() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.baseline,
      children: [
        Text.rich(
          TextSpan(children: [
            TextSpan(
                text: 'freak',
                style: TextStyle(color: palette.black, fontSize: 30)),
            TextSpan(
                text: 'In', style: TextStyle(color: palette.red, fontSize: 30)),
          ]),
        ),
      ],
    );
  }
}
