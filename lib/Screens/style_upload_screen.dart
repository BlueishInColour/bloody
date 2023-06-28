import 'package:flutter/material.dart';
import '../main.dart';
//import 'explore_screen.dart';
import 'dart:io';
//import 'dart:ui' as ui;

//import 'package:image_editor/image_editor.dart';
//import 'package:image/image.dart' as img;

import '../Widgets/upload_screen_widgets/buttons_functions.dart';
import '../Widgets/upload_screen_widgets/style_upload_widget.dart';
//import 'package:flutter_painter/flutter_painter.dart';
//import '../Widgets/style_upload_screen_widgets/buttons_functions.dart';

//final palette = Palette();

class StyleUploadScreen extends StatefulWidget {
  const StyleUploadScreen({super.key});
  @override
  State<StyleUploadScreen> createState() => StyleUploadScreenState();
}

class StyleTeleportData {
  StyleTeleportData();
  String signName = 'style name';
  String styleName = 'unique style name';
  String? styleType = 'single';
  String styleTypeDetails = 'album name';
  double? fontSize = 15;
  Color? textColor = Colors.white;
}

final styleTeleportData = StyleTeleportData();
StyleUploadPainter styleUploadPainter = StyleUploadPainter(styleTeleportData);

class StyleUploadScreenState extends State<StyleUploadScreen> {
  // PainterController controller = PainterController();
  File imagefile = File('/home/pelumi/bloody/assets/images/pexel.jpg');
  String color = 'Colors.red';
  String? styleType = '';
  @override
  // if (explore.image )
  Widget build(BuildContext context) {
    return (Scaffold(
      backgroundColor: palette.lightPurple,
      //  bottomSheet: bottomForm(context),
      body: Center(
        child: CustomPaint(
          size: const Size(300, 500),
          foregroundPainter: styleUploadPainter,
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const BackButton(
                style: ButtonStyle(
                    iconSize: MaterialStatePropertyAll(30),
                    padding: MaterialStatePropertyAll(EdgeInsets.all(2)))),
            Expanded(
                flex: 20,
                child: SizedBox(
                    height: 40,
                    child: styleUploadForm(
                      context,
                    ))),
            stylebottombuttons(context, styleTeleportData),
          ],
        ));
  }
}

///  child: (SingleChildScrollView(
  //                scrollDirection: Axis.horizontal,
  //                child: styleUploadForm(context),
  //              )),

