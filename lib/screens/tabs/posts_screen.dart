import 'package:flutter/material.dart';
import '../../main.dart';
import '../explore/imagepod.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => PostScreenState();
}

class PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        body: ListView.builder(
      itemCount: 3,
      itemBuilder: (context, _) => ImagePod(),
    )));
  }
}
