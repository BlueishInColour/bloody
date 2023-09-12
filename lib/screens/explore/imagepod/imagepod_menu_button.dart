import 'package:flutter/material.dart';
import '../../../main.dart';
import '../../../apis/deta_a.dart';
import '../../../models/post_model.dart';

class ImagepodMenuButton extends StatefulWidget {
  const ImagepodMenuButton(
      {super.key,
      this.color = Colors.white,
      this.gottenPosts = const [],
      this.index = 0});
  final Color color;
  final List<Post> gottenPosts;
  final int index;
  @override
  State<ImagepodMenuButton> createState() => ImagepodMenuButtonState();
}

class ImagepodMenuButtonState extends State<ImagepodMenuButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          showImagepodMenuScreen(context,
              postKey: widget.gottenPosts[widget.index].key);
        },
        icon: Icon(
          Icons.more_vert_rounded,
          color: widget.color,
        ));
  }
}

class ImagepodMenuScreen extends StatelessWidget {
  const ImagepodMenuScreen({super.key, this.postKey = ''});
  final String postKey;
  @override
  Widget build(BuildContext context) {
    askAgain(
        {String question = '',
        String yesText = '',
        String noText = 'cancel',
        yesFunction = '',
        noFunction = ''}) {
      showDialog(
          context: context,
          builder: ((context) {
            return Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: palette.black,
                ),
                width: 250,
                height: 150,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        question,
                        style: TextStyle(color: palette.textColorLight),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(noText,
                                  style: TextStyle(color: palette.amber))),
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(palette.red)),
                              onPressed: () async {
                                var res = await postApi.delete(postKey);
                                print(res);

                                Navigator.pop(context);
                              },
                              child: Text(yesText,
                                  style: TextStyle(color: palette.white)))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }));
    }

    return (Scaffold(
      body: ListView(
        children: [
          ListTile(
            leading:
                Text('&', style: TextStyle(color: palette.amber, fontSize: 30)),
            title: Text('delete post',
                style: TextStyle(color: palette.red, fontSize: 14)),
            onTap: () {
              debugPrint('deleting in progress');
              Navigator.pop(context);
              askAgain(
                  question: 'are you sure you want to delete this post?',
                  yesText: 'delete');
            },
            trailing: Icon(Icons.delete, color: palette.red),
          )
        ],
      ),
    ));
  }
}

showImagepodMenuScreen(context, {String postKey = ''}) {
  return showModalBottomSheet(
      context: context,
      showDragHandle: true,
      useSafeArea: true,
      backgroundColor: palette.amber,
      // anchorPoint: Offset(500, 500),
      isScrollControlled: true,
      enableDrag: true,
      isDismissible: true,
      // barrierColor: palette.white,
      shape: const ContinuousRectangleBorder(
          // side: BorderSide(width: 5),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(70), topRight: Radius.circular(70))),
      //  isDismissible: bool.fromEnvironment('off'),
      constraints: const BoxConstraints(maxHeight: 400),
      builder: (BuildContext context) {
        return ImagepodMenuScreen(
          postKey: postKey,
        );
      });
}
