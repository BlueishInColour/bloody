import 'package:flutter/material.dart';
import '../../main.dart';
import './upload_new_category.dart';

class SearchFloatingButton extends StatelessWidget {
  const SearchFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: palette.black,
      child: IconButton(
          onPressed: () => showNewCategoryUploadScreen(context),
          icon: Icon(
            Icons.add,
            color: palette.amber,
            size: 30,
          )),
    );
  }
}
