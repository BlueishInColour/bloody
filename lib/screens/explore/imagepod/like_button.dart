import 'package:flutter/material.dart';
import '../../../main.dart';
import '../../../models/associate_model.dart';
import '../../../models/post_model.dart';
import '../../../apis/deta_a.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({super.key, required this.post});
  final Post post;

  @override
  State<LikeButton> createState() => LikebuttonState();
}

class LikebuttonState extends State<LikeButton> {
  String savedKey = '';

  @override
  Widget build(BuildContext context) {
    Post post = widget.post;
    Associate likeAssociate = Associate(
        associationType: 'like',
        sourceId: '@oluwapelumi',
        destinationId: post.id);
    Associate unlikeAssociate = Associate();
    likeit() async {
      debugPrint('about to like it ');
      var res = await associationApi.put(likeAssociate.toJson(), key: post.id);
      print(res);
      setState(() {
        savedKey = res['key'].toString();
        print(savedKey);
      });
    }

    unlikeit() async {
      debugPrint('about to unnnnlike it ');
      var res = await associationApi.delete(savedKey);
      print(res);
      setState(() {
        savedKey = '';
      });
      print(savedKey);
    }

    return Column(
      children: [
        IconButton(
          onPressed: () {
            debugPrint('clicked');
            savedKey.isNotEmpty ? unlikeit() : likeit();
          },
          icon: savedKey.isNotEmpty
              ? Icon(Icons.favorite_rounded, color: palette.red)
              : const Icon(Icons.favorite_rounded),
        ),
        Text('2k',
            style: TextStyle(
                color:
                    savedKey.isNotEmpty ? palette.red : palette.textColorLight))
      ],
    );
  }
}
