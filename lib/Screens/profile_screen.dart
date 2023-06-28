import 'package:flutter/material.dart';
import '../Widgets/explore_screen_widgets/app_bar.dart';
import '../main.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  ProfileScreenState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('profile')),
      body: (SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            Expanded(
                child: Stack(children: [
              Container(
                height: 61,
                decoration: BoxDecoration(
                    color: palette.lightPurple,
                    borderRadius: BorderRadius.circular(25)),
              ),
              const Positioned(child: CircleAvatar(radius: 30)),
            ]))
          ],
        ),
      )),
    );
  }
}
