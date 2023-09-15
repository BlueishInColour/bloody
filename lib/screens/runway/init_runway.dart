import 'package:flutter/material.dart';
import '../../main.dart';
import '../../under_construction_screen.dart';
import 'video_pod.dart';
import './video_stream_player.dart';

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
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.video_camera_front,
          ),
          onPressed: () {
            Navigator.push(context,
                PageRouteBuilder(pageBuilder: (context, _, __) {
              return const VideoStream();
            }));
          }),
      body: const Center(child: VideoPlayerScreen()),
    ));
  }
}
