import 'dart:async';
import 'package:flutter/material.dart';

import '../main.dart';
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
      backgroundColor: palette.grey,
      radius: 70,
      child: Text.rich(TextSpan(children: [
        TextSpan(
            text: palette.appName,
            style: TextStyle(
                // fontFamily: 'Geologica_Cursive-Bold',
                color: palette.black,
                fontSize: 35,
                fontWeight: FontWeight.w600)),
        TextSpan(
            text: '',
            style: TextStyle(
                fontFamily: 'Geologica_Cursive-Bold',
                color: palette.black,
                fontSize: 47,
                fontWeight: FontWeight.w500)),
        //  WidgetSpan(
        //      child: Icon(
        //    Icons.local_fire_department_outlined,
        //    color: palette.red,
        //    size: 35,
        //  )),
      ])),
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
                text: 'explore',
                style: TextStyle(
                    fontFamily: 'Geologica_Cursive-Bold',
                    color: palette.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w500)),
            TextSpan(
                text: '   fashion',
                style: TextStyle(
                    fontFamily: 'Geologica_Cursive-Bold',
                    color: palette.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w500)),
          ]),
        ),
      ],
    );
  }
}
