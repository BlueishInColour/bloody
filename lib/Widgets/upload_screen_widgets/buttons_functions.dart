import 'dart:ui' as ui;
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import '../../main.dart';
import '../../Screens/loundry_upload_screen.dart';

import '../../Screens/style_upload_screen.dart';

//final palette = Palette();

class StyleUploadPainter extends CustomPainter {
  StyleUploadPainter(this.styleteleportedData);
  StyleTeleportData styleteleportedData;

  @override
  paint(Canvas canvas, Size size) {
    final textSpan = TextSpan(
      text: '''

${styleteleportedData.styleName}
${styleteleportedData.signName}
${styleteleportedData.styleTypeDetails} 

''',
      style: TextStyle(
          color: styleteleportedData.textColor,
          fontSize: styleteleportedData.fontSize,
          fontWeight: FontWeight.bold,
          backgroundColor: palette.lightPurple),
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );

    debugPrint(styleteleportedData.signName);

    textPainter.layout(
      minWidth: 0.0,
      maxWidth: size.width,
    );

    const offset = Offset(30, 50);
    // return textPainter;
    //return offset;
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

final recorder = PictureRecorder();

class LoundryUploadPainter extends CustomPainter {
  LoundryUploadPainter(this.loundryTeleportedData);
  LoundryTeleportData loundryTeleportedData;

  final canvas = Canvas(recorder);

  @override
  paint(Canvas canvas, Size size) {
    final textSpan = TextSpan(
      text: '''
full name : ${loundryTeleportedData.fullname}
phone number : ${loundryTeleportedData.phoneNumber}
total no. of clothes : ${loundryTeleportedData.totalNumberOfClothes}
total no. of whites : ${loundryTeleportedData.totalNumberOfWhites}
total no. of non whites ${loundryTeleportedData.totalNumberOfNonWhites}


price : calculating

''',
      style: TextStyle(
          color: loundryTeleportedData.textColor,
          fontSize: loundryTeleportedData.fontSize,
          fontWeight: FontWeight.bold,
          backgroundColor: palette.lightPurple),
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(
      minWidth: 0.0,
      maxWidth: size.width,
    );

    const offset = Offset(30, 50);
    // return textPainter;
    //return offset;
    textPainter.paint(canvas, offset);
    recorder.endRecording().toImage(700, 1000);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

//  Future<ByteData?> createImage() async {
//    ui.Image img = await picture.toImage(200, 200);
//    final ByteData? pngBytes =
//        await img.toByteData(format: ImageByteFormat.png);
// debugPrint('oky');
//    return pngBytes;
//  }

//\

//class DressMakingUploadPainter extends CustomPainter {
//  DressMakingUploadPainter(this.teleportedData);
//
//  LoundryTeleportData teleportedData;
//
//  Future<ByteData?> generateSquareWithText(String text) async {
//    final recorder = PictureRecorder();
//    final canvas = Canvas(
//        recorder, Rect.fromPoints(Offset(0.0, 0.0), Offset(200.0, 200.0)));
//
//    final stroke = Paint()
//      ..color = Colors.grey
//      ..style = PaintingStyle.stroke;
//
//    canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 200.0, 200.0), stroke);
//
//    final textPainter = TextPainter(
//        text: TextSpan(
//          text: text,
//          style: TextStyle(
//            color: Colors.black,
//            fontSize: 30,
//          ),
//        ),
//        textDirection: TextDirection.ltr,
//        textAlign: TextAlign.center);
//    textPainter.layout();d
//
//// Draw the text centered around the point (50, 100) for instance
//    final offset =
//        Offset(50 - (textPainter.width / 2), 100 - (textPainter.height / 2));
//    textPainter.paint(canvas, offset);
//
//    final picture = recorder.endRecording();
//    ui.Image img = await picture.toImage(200, 200);
//    final ByteData? pngBytes =
//        await img.toByteData(format: ImageByteFormat.png);
//
//    return pngBytes;
//  }
//
//  //\
//
//  @override
//  bool shouldRepaint(CustomPainter oldDelegate) {
//    return true;
//  }
//}

class BitmapUtils {
  Future<Uint8List> generateImagePngAsBytes(String text) async {
    ByteData? image = await generateSquareWithText(text);
    return image!.buffer.asUint8List();
  }

  Future<ByteData?> generateSquareWithText(String text) async {
    final recorder = PictureRecorder();
    final canvas = Canvas(recorder,
        Rect.fromPoints(const Offset(0.0, 0.0), const Offset(200.0, 200.0)));

    final stroke = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    canvas.drawRect(const Rect.fromLTWH(0.0, 0.0, 200.0, 200.0), stroke);

    final textPainter = TextPainter(
        text: TextSpan(
          text: text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 30,
          ),
        ),
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center);
    textPainter.layout();

// Draw the text centered around the point (50, 100) for instance
    final offset =
        Offset(50 - (textPainter.width / 2), 100 - (textPainter.height / 2));
    textPainter.paint(canvas, offset);

    final picture = recorder.endRecording();
    ui.Image img = await picture.toImage(200, 200);
    final ByteData? pngBytes =
        await img.toByteData(format: ImageByteFormat.png);

    return pngBytes;
  }
}
