import 'package:flutter/material.dart';
import '../../Screens/style_upload_screen.dart';
import '../../main.dart';

///<<<<<<<<<<<<<<< style Upload Form

extension StyleUploadFormWidget on StyleUploadScreenState {
  Widget styleUploadForm(BuildContext context) {
    return (ListView(
      scrollDirection: Axis.horizontal,
      children: [
        SizedBox(
          width: 300,
          child: TextField(
            onChanged: (value) => setState(() {
              styleTeleportData.styleName = value;
            }),
            decoration: const InputDecoration(hintText: 'unique style name'),
          ),
        ),
        const SizedBox(width: 20),
        SizedBox(
          width: 300,
          child: TextField(
            onChanged: (value) => setState(() {
              styleTeleportData.signName = value;
              debugPrint(styleTeleportData.signName);
            }),
            decoration: const InputDecoration(hintText: 'signed name'),
          ),
        ),
        const SizedBox(width: 20),
        SizedBox(
          //  height: 20,
          child: DropdownMenu(
            onSelected: (value) {
              setState(() {
                styleTeleportData.styleType = value;
              });
            },
            dropdownMenuEntries: const [
              DropdownMenuEntry(value: 'single', label: 'single'),
              DropdownMenuEntry(value: 'collection', label: 'collection'),
              DropdownMenuEntry(value: 'album', label: 'album')
            ],
            hintText: 'single',
            helperText: 'single',
          ),
        ),
        const SizedBox(width: 20),
        SizedBox(
          width: styleTeleportData.styleType == 'single' ? 0 : 300,
          child: TextField(
            onChanged: (value) => setState(() {
              styleTeleportData.styleTypeDetails = value;
            }),
            decoration: InputDecoration(
                suffixText: styleTeleportData.styleType == 'collection'
                    ? 'collection'
                    : 'album',
                hintText: styleTeleportData.styleType == 'collection'
                    ? 'enter collection name'
                    : 'enter album name'),
          ),
        ),
        const SizedBox(width: 20),
      ],
    ));
  }
  //
  //
  //>>>>>>>>>>>>>>>>> style upload form

  Widget stylebottombuttons(
      BuildContext context, StyleTeleportData teleportData) {
    return (Row(children: [
      DropdownMenu(
        hintText: 'No. of Non-Whites',
        width: 15,
        trailingIcon: const Text(''),
        inputDecorationTheme: InputDecorationTheme(
            contentPadding: const EdgeInsets.all(0),
            fillColor: palette.lightPurple,
            focusColor: palette.lightPurple),
        leadingIcon: Icon(
          Icons.title_rounded,
          color: palette.red,
          size: 25,
        ),
        onSelected: (value) {
          setState(() {
            switch (value) {
              case '1':
                teleportData.fontSize = 15;
                break;
              case '2':
                teleportData.fontSize = 20;
                break;
              case '3':
                teleportData.fontSize = 25;
                break;
              default:
                teleportData.fontSize = 15;
            }
          });
        },
        dropdownMenuEntries: const [
          DropdownMenuEntry(value: '1', label: 'x1'),
          DropdownMenuEntry(value: '2', label: 'x2'),
          DropdownMenuEntry(value: '3', label: 'x3'),
        ],
      ),
      const SizedBox(width: 15),
      DropdownMenu(
        hintText: 'No. of Non-Whites',
        width: 10,
        trailingIcon: const Text(''),
        inputDecorationTheme: InputDecorationTheme(
            contentPadding: const EdgeInsets.only(bottom: 10),
            fillColor: palette.lightPurple,
            focusColor: palette.lightPurple),
        leadingIcon: Icon(
          Icons.palette,
          color: palette.red,
          size: 25,
        ),
        onSelected: (value) {
          setState(() {
            switch (value) {
              case 'black':
                teleportData.textColor = Colors.black;
                break;

              case 'white':
                teleportData.textColor = Colors.white;
                break;
              case 'blue':
                teleportData.textColor = Colors.blue;
                break;
              case 'red':
                teleportData.textColor = Colors.red;
                break;
              case 'purple':
                teleportData.textColor = Colors.purple;
                break;

              case 'green':
                teleportData.textColor = Colors.green;
                break;
              case 'yellow':
                teleportData.textColor = Colors.yellow;
                break;
              default:
                teleportData.textColor = Colors.white;
            }
          });
        },
        dropdownMenuEntries: const [
          DropdownMenuEntry(value: 'black', label: 'black'),
          DropdownMenuEntry(value: 'white', label: 'white'),
          DropdownMenuEntry(value: 'blue', label: 'blue'),
          DropdownMenuEntry(value: 'red', label: 'red'),
          DropdownMenuEntry(value: 'purple', label: 'purple'),
          DropdownMenuEntry(value: 'yellow', label: 'yellow'),
          DropdownMenuEntry(value: 'green', label: 'green'),
        ],
      ),
    ]));
  }

  //>>>>>>>>>>>>>>>>>>>>>>>>>>bottombuttons for texttitle and color palatte
}
