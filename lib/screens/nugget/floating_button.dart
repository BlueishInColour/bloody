import 'package:flutter/material.dart';
import '../../main.dart';
import './nugget_upload_screen.dart';

import '../Test/master.dart';

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
            //  showNuggetUploadScreen(context);
            Navigator.push(context, PageRouteBuilder(pageBuilder: (context,_,__)=>Master()));
              debugPrint('stopclicked');
            },
            icon: Icon(Icons.edit, color: palette.amber))));
  }
}
