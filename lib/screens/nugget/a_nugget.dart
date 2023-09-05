import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../main.dart';
import '../../models/nugget_model.dart';

class ANugget extends StatefulWidget {
  const ANugget({super.key, required this.gottenNuggets, required this.index});

  final List<Nugget> gottenNuggets;
  final int index;
  @override
  State<ANugget> createState() => ANuggetState();
}

class ANuggetState extends State<ANugget> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
//ANugget will be enclosed in a row with three column
//1st column will have profilepix of poster, likebutton, and time posted
//2nd column will have the picture for the post
//3rd will have short text for the post
    List<Nugget> gottenNuggets = widget.gottenNuggets;
    int index = widget.index;

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
              imageUrl: gottenNuggets[index].photosUrl,
              placeholder: (context, _) =>
                  Container(width: 150, color: palette.amber),
            ))),
      );
    }

    Widget rowInSeconColumn(context) {
      return Row(
        children: [
          Text(gottenNuggets[index].postedBy,
              style: TextStyle(fontSize: 12, color: palette.linkTextColor)),
          const Expanded(child: SizedBox()),
          Text(gottenNuggets[index].tags,
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
                  gottenNuggets[index].text,
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
