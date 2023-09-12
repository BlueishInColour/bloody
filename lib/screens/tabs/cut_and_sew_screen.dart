import 'package:flutter/material.dart';
import '../../under_construction_screen.dart';
import './floating_search_button.dart';

class CutAndSewScreen extends StatefulWidget {
  const CutAndSewScreen({super.key});

  @override
  State<CutAndSewScreen> createState() => CutAndSewScreenState();
}

class CutAndSewScreenState extends State<CutAndSewScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButton: TabsFloatingButton(
        iconData: Icons.cut_rounded,
      ),
      body: UnderConstruction(),
    );
  }
}
