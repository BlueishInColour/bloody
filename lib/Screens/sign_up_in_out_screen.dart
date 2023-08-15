import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import '../main.dart';
import './splash_screen.dart';

class SignUpInOutScreeen extends StatefulWidget {
  const SignUpInOutScreeen({super.key});

  @override
  State<SignUpInOutScreeen> createState() => SignUpInOutScreeenState();
}

class SignUpInOutScreeenState extends State<SignUpInOutScreeen> {
  int selectedIndex = 0;
  List<int> selectedprofilepix = [];
  @override
  Widget build(BuildContext context) {
    Widget appName() {
      return (Text.rich(TextSpan(children: [
        TextSpan(
            text: 'DIO',
            style: TextStyle(
                // fontFamily: 'Geologica_Cursive-Bold',
                color: palette.black,
                fontSize: 35,
                fontWeight: FontWeight.w600)),
        TextSpan(
            text: 'n',
            style: TextStyle(
                fontFamily: 'Geologica_Cursive-Bold',
                color: palette.black,
                fontSize: 47,
                fontWeight: FontWeight.w500)),
        //  WidgetSpan(
        //      child: Icon(
        //    Icons.local_fire_department_outlined,
        //    color: palette.red,
        //    size: 35,
        //  )),
      ])));
    }

    Widget tabBar(context) {
      Widget textbutton(context,
          {int index = 0, String text = '', color = Colors.black87}) {
        return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              print(selectedIndex);
            },
            child: Text(text, style: TextStyle(fontSize: 20, color: color)));
      }

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          textbutton(context,
              text: 'login',
              index: 0,
              color: selectedIndex == 0 ? Colors.blue : null),
          textbutton(context,
              text: 'signup',
              index: 1,
              color: selectedIndex == 1 ? Colors.blue : null)
        ],
      );
    }

    Widget loginPart(BuildContext context) {
      //
      Widget textfield(context,
          {String hinttext = '', bool obscuretext = false}) {
        return TextField(
          obscureText: obscuretext,
          decoration: InputDecoration(
              hintText: hinttext,
              fillColor: palette.grey,
              focusColor: palette.grey,
              hoverColor: palette.grey),
        );
      }

      Widget elevatedbutton(context) {
        return ElevatedButton(
          onPressed: () => null,
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(palette.grey),
              foregroundColor: MaterialStatePropertyAll(palette.black),
              minimumSize: const MaterialStatePropertyAll(Size(200, 60))),
          child: const Text('login'),
        );
      }

      return (Card(
        color: Colors.white,
        elevation: 0,
        child: SizedBox(
            height: 300,
            width: 300,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  textfield(context, hinttext: '@username'),
                  textfield(context, hinttext: '*******', obscuretext: true),
                  elevatedbutton(context),
                ],
              ),
            )),
      ));
    }

    Widget signUpPart(BuildContext context) {
      Widget profilepix(context) {
        getFileImages() async {
          print('connected');
          var image = await ImagePicker.platform.pickImage(
            source: ImageSource.gallery,
          );

          List<int> bytes = await image!.readAsBytes();
          print(bytes);
          print('done converting');
          setState(() {
            selectedprofilepix = bytes;
          });
          print('done setting bytes');
        }

        getCameraImages() async {
          print('connected');
          var image = await ImagePicker.platform.pickImage(
              source: ImageSource.camera,
              preferredCameraDevice: CameraDevice.rear);
          List<int> bytes = await image!.readAsBytes();
          setState(() {
            selectedprofilepix = bytes;
          });
        }

        return (Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 35,
              backgroundImage: selectedprofilepix.isNotEmpty
                  ? MemoryImage(Uint8List.fromList(selectedprofilepix))
                  : null,
            ),
            IconButton(
              onPressed: () => getFileImages(),
              icon: Icon(Icons.file_upload_outlined),
              iconSize: 40,
            ),
            IconButton(
                onPressed: () => getCameraImages(),
                iconSize: 38,
                icon: Icon(
                  Icons.camera_alt_outlined,
                ))
          ],
        ));
      }

      //
      Widget textfield(context,
          {String hinttext = '', bool obscuretext = false}) {
        return TextField(
          obscureText: obscuretext,
          decoration: InputDecoration(
              hintText: hinttext,
              fillColor: palette.grey,
              focusColor: palette.grey,
              hoverColor: palette.grey),
        );
      }

      Widget elevatedbutton(context) {
        return ElevatedButton(
          onPressed: () => null,
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(palette.grey),
              foregroundColor: MaterialStatePropertyAll(palette.black),
              minimumSize: const MaterialStatePropertyAll(Size(200, 60))),
          child: const Text('signup'),
        );
      }

      return (Card(
        color: Colors.white,
        elevation: 0,
        child: SizedBox(
            height: 500,
            width: 300,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  profilepix(context),
                  textfield(context, hinttext: 'fullname'),
                  textfield(context, hinttext: '@username'),
                  textfield(context, hinttext: 'password'),
                  textfield(context, hinttext: 'confirm password'),
                  elevatedbutton(context),
                ],
              ),
            )),
      ));
    }

    return (Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            appName(),
            tabBar(context),
            selectedIndex == 0 ? loginPart(context) : signUpPart(context),
          ],
        ),
      ),
    ));
  }
}
