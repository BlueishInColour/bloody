import 'package:flutter/material.dart';
import '../../main.dart';
import '../explore/imagepod.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => SavedScreenState();
}

class SavedScreenState extends State<SavedScreen> {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        body: ListView.builder(
      itemCount: 3,
      itemBuilder: (context, _) => ImagePod(),
    )));
  }
}
