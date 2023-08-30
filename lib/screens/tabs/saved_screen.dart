import 'package:flutter/material.dart';
import '../../main.dart';
import '../explore/imagepod.dart';
import './floating_search_button.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => SavedScreenState();
}

class SavedScreenState extends State<SavedScreen> {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        floatingActionButton: const TabsFloatingSearchButton(),
        body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, _) => ImagePod(),
        )));
  }
}
