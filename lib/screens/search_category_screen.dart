import 'package:flutter/material.dart';

class SearchCategoryScreen extends StatelessWidget {
  const SearchCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Column(children: [
        Icon(
          Icons.construction,
          size: 400,
          color: Colors.black54,
        ),
        Text('''minions are still working here, 
          find better things to do oustide here'''),
        BackButton()
      ])),
    );
  }
}
