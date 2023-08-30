import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../main.dart';

class Nugget extends StatefulWidget {
  const Nugget({super.key});

  @override
  State<Nugget> createState() => NuggetState();
}

class NuggetState extends State<Nugget> {
  @override
  Widget build(BuildContext context) {
//nugget will be enclosed in a row with three column
//1st column will have profilepix of poster, likebutton, and time posted
//2nd column will have the picture for the post
//3rd will have short text for the post

    Widget firstColumn(context) {
      return Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: (Container(
            decoration: BoxDecoration(
                color: palette.amber, borderRadius: BorderRadius.circular(15)),
            width: 150,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => Container(
                width: 150,
                decoration: BoxDecoration(
                    color: palette.amber,
                    borderRadius: BorderRadius.circular(15)),
              ),
              imageUrl:
                  'https://ik.imagekit.io/bluerubic/flutter_imagekit/Logopit_1692812359977_YIjC9fthW.jpg',
              placeholder: (context, _) =>
                  Container(width: 150, color: palette.amber),
            ))),
      );
    }

    Widget rowInSeconColumn(context) {
      return Row(
        children: [
          Text('@oluwapelumide',
              style: TextStyle(fontSize: 12, color: palette.linkTextColor)),
          const Expanded(child: SizedBox()),
          Text('1d',
              style: TextStyle(fontSize: 12, color: palette.textColorLight))
        ],
      );
    }

    Widget secondColumn(context) {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              rowInSeconColumn(context),
              Expanded(
                child: (Text(
                  'this is the  firs time ill spend so much time coding stuff that is barely posible all i want to do is render widgets from the net as in thi is my deram since day one',
                  maxLines: 5,
                  style: TextStyle(
                    fontSize: 12,
                    overflow: TextOverflow.ellipsis,
                    color: palette.textColorLight,
                  ),
                )),
              ),
            ],
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: 100,
        child: (Row(
          children: [firstColumn(context), secondColumn(context)],
        )),
      ),
    );
  }
}
