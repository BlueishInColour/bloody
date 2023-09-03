import 'package:flutter/material.dart';
import '../../main.dart';
import './post_upload_screen.dart';

class ExploreFloatingActionButton extends StatelessWidget{
  const ExploreFloatingActionButton({super.key});

  @override
  Widget build (BuildContext context){
    return CircleAvatar(
          radius: 30,
          backgroundColor: palette.black,
          child: IconButton(
              color: palette.amber,
              padding: const EdgeInsets.all(0),
              onPressed: () => showModalBottomSheet(
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
                            topLeft: Radius.circular(70),
                            topRight: Radius.circular(70))),
                    //  isDismissible: bool.fromEnvironment('off'),
                    constraints: const BoxConstraints(maxHeight: 600),
                    builder: (BuildContext context) {
                      return const PostUpload();
                    },
                  ),
              icon: Icon(Icons.file_upload_outlined,
                  size: 40, color: palette.amber)),
        );
       
  }
}