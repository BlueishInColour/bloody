import 'package:flutter/material.dart';
import '../../main.dart';
import '../../under_construction_screen.dart';
import 'video_pod.dart';

class RunwayScreen extends StatefulWidget {
  const RunwayScreen({super.key});

  @override
  State<RunwayScreen> createState() => RunwayScreenState();
}

class RunwayScreenState extends State<RunwayScreen> {
  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget runwayAppBar(context) {
      return AppBar(
        title: Text('runway',
            style: TextStyle(
              color: palette.amber,
            )),
      );
    }

    return (Scaffold(
      appBar: runwayAppBar(context),
      body: const Center(child: VideoPlayerScreen()),
    ));
  }
}
