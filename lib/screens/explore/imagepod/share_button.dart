import 'package:flutter/material.dart';
import '../../../main.dart';
import '../../../apis/deta_a.dart';

class ShareButton extends StatefulWidget {
  const ShareButton({super.key});

  @override
  State<ShareButton> createState() => SharebuttonState();
}

class SharebuttonState extends State<ShareButton> {
  bool clicked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {
            debugPrint('clicked');
            setState(() {
              clicked = !clicked;
            });
          },
          icon: clicked
              ? Icon(Icons.share_rounded, color: palette.amber)
              : Icon(Icons.share_rounded),
        ),
        Text('2k',
            style: TextStyle(
                color: clicked ? palette.amber : palette.textColorLight))
      ],
    );
  }
}
