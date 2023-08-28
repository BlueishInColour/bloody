import 'package:flutter/material.dart';
import './a_nugget.dart';
import './floating_button.dart';
import '../../main.dart';

class NuggetScreen extends StatefulWidget {
  const NuggetScreen({super.key});

  @override
  State<NuggetScreen> createState() => NuggetScreenState();
}

class NuggetScreenState extends State<NuggetScreen> {
  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget nuggetAppBar(context) {
      return AppBar(
        title: Text('nuggets',
            style: TextStyle(
              color: palette.amber,
            )),
      );
    }

    return (Scaffold(
      appBar: nuggetAppBar(context),
      floatingActionButton: const FloatingButton(),
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return (const Divider());
        },
        itemCount: 20,
        itemBuilder: (context, _) => const Nugget(),
      ),
    ));
  }
}
