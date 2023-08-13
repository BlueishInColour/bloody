import 'package:flutter/material.dart';
import '../../Screens/explore_screen.dart';
import '../../Screens/post_upload_screen.dart';

extension New on ExploreScreenWidgetState {
  Widget floatingActionButtons(BuildContext context) {
    Widget iconybutton(
      context,
      IconData icon,
      double size,
      Function() re,
    ) {
      return (IconButton.outlined(onPressed: re, icon: Icon(icon, size: size)));
    }

    return (Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 50),
          iconybutton(context, Icons.travel_explore, 50, () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const PostUpload()));
          }),
          iconybutton(context, Icons.favorite_border_rounded, 50, () => null),
          iconybutton(context, Icons.book, 50, () => null),
          iconybutton(context, Icons.file_download_done, 50, () => null),
          iconybutton(
              context,
              Icons.cancel_outlined,
              50,
              () => setState(() {
                    manyFloatingwidget = false;
                  }))
        ]));
  }
}
