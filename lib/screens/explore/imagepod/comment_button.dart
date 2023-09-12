import 'package:flutter/material.dart';
import '../../../main.dart';
import '../../../apis/deta_a.dart';

class CommentButton extends StatefulWidget {
  const CommentButton({super.key});

  @override
  State<CommentButton> createState() => CommentbuttonState();
}

class CommentbuttonState extends State<CommentButton> {
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
              ? Icon(Icons.chat_bubble, size: 20, color: palette.amber)
              : const Icon(Icons.chat_bubble, size: 20),
        ),
        Text('2k',
            style: TextStyle(
                color: clicked ? palette.amber : palette.textColorLight))
      ],
    );
  }
}
