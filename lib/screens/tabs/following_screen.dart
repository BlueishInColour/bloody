import 'package:flutter/material.dart';
import './floating_search_button.dart';
import '../../main.dart';

class FollowingScreen extends StatefulWidget {
  const FollowingScreen({super.key});

  @override
  State<FollowingScreen> createState() => FollowingScreenState();
}

class FollowingScreenState extends State<FollowingScreen> {
  Widget oneFollowing(context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 60,
        child: Row(children: [
          CircleAvatar(backgroundColor: palette.amber, radius: 30),
          const SizedBox(width: 10),
          Text('@lionardo d1 vinci',
              style: TextStyle(color: palette.linkTextColor)),
          const Expanded(child: SizedBox())
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const TabsFloatingSearchButton(),
      body: (ListView.builder(
          itemCount: 10,
          itemBuilder: (context, _) {
            return oneFollowing(context);
          })),
    );
  }
}
