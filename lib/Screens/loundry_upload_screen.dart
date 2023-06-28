import 'package:flutter/material.dart';
import '../main.dart';
//import 'explore_screen.dart';
import 'dart:io';
//import 'dart:ui' as ui;

//import 'package:image_editor/image_editor.dart';
//import 'package:image/image.dart' as img;

import '../Widgets/upload_screen_widgets/buttons_functions.dart';
import '../Widgets/upload_screen_widgets/loundry_upload_widget.dart';
//import 'package:flutter_painter/flutter_painter.dart';
//import '../Widgets/loundry_upload_screen_widgets/buttons_functions.dart';

//final palette = Palette();

class LoundryUploadScreen extends StatefulWidget {
  const LoundryUploadScreen({super.key});

  @override
  State<LoundryUploadScreen> createState() => LoundryUploadScreenState();
}

class LoundryTeleportData {
  LoundryTeleportData();
  String fullname = '';
  String phoneNumber = '';
  String? totalNumberOfClothes = '';
  String? totalNumberOfWhites = '';
  String? totalNumberOfNonWhites = '';
  String price = '';
  Color? textColor = const Color.fromARGB(255, 255, 255, 255);
  double? fontSize = 15;
}

final loundryTeleportData = LoundryTeleportData();
LoundryUploadPainter loundryUploadPainter =
    LoundryUploadPainter(loundryTeleportData);

class LoundryUploadScreenState extends State<LoundryUploadScreen> {
  // PainterController controller = PainterController();
  File imagefile = File('/home/pelumi/bloody/assets/images/pexel.jpg');
  String color = 'Colors.red';
  String? loundryType = '';
  @override
  // if (explore.image )
  Widget build(BuildContext context) {
    return (Scaffold(
      backgroundColor: palette.lightPurple,
      //  bottomSheet: bottomForm(context),
      body: Center(
        child: CustomPaint(
          size: const Size(300, 500),
          foregroundPainter: loundryUploadPainter,
          child: Image.file(imagefile, fit: BoxFit.cover),
        ),
      ),
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: together(context),
          foregroundColor: palette.red),
    ));
  }

  Widget together(BuildContext context) {
    return SizedBox(
        height: 40,
        child: Row(
          children: [
            const BackButton(
                style: ButtonStyle(
                    iconSize: MaterialStatePropertyAll(15),
                    padding: MaterialStatePropertyAll(EdgeInsets.all(2)))),
            Expanded(
                child: SizedBox(
              height: 50,
              //width: 400,
              child: (SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: loundryUploadForm(context),
              )),
            )),
            loundrybottombuttons(context, loundryTeleportData)
          ],
        ));
  }
}
