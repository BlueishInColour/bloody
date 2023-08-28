import 'package:flutter/material.dart';
import '../../main.dart';
import './nugget_upload_screen.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return (CircleAvatar(
        radius: 30,
        backgroundColor: palette.black,
        child: IconButton(
            onPressed: () {
              debugPrint('clicked');
              showNuggetUploadScreen(context);
              debugPrint('stopclicked');
            },
            icon: Icon(Icons.edit, color: palette.amber))));
  }
}
