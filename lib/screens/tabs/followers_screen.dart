import 'package:flutter/material.dart';
import '../../main.dart';
import 'floating_search_button.dart';

class FollowersScreen extends StatefulWidget {
  const FollowersScreen({super.key});

  @override
  State<FollowersScreen> createState() => FollowersScreenState();
}

class FollowersScreenState extends State<FollowersScreen> {
  Widget oneFollower(context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 60,
        child: Row(children: [
          CircleAvatar(backgroundColor: palette.amber, radius: 30),
          const SizedBox(width: 10),
          Text('@oluwapelumi', style: TextStyle(color: palette.linkTextColor)),
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
            return oneFollower(context);
          })),
    );
  }
}
