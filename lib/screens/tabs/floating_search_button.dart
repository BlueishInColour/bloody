import 'package:flutter/material.dart';
import '../../main.dart';

class TabsFloatingButton extends StatelessWidget {
  const TabsFloatingButton({super.key, this.iconData = Icons.search});
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return (CircleAvatar(
        backgroundColor: palette.black,
        radius: 30,
        child: IconButton(
          onPressed: () => debugPrint('search button clicked'),
          icon: Icon(iconData, color: palette.amber),
        )));
  }
}
