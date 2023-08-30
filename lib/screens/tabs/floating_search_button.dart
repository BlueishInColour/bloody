import 'package:flutter/material.dart';
import '../../main.dart';

class TabsFloatingSearchButton extends StatelessWidget {
  const TabsFloatingSearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return (CircleAvatar(
        backgroundColor: palette.black,
        radius: 30,
        child: IconButton(
          onPressed: () => debugPrint('search button clicked'),
          icon: Icon(Icons.search, color: palette.amber),
        )));
  }
}
