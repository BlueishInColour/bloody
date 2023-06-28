import '../../Screens/loundry_upload_screen.dart';
import 'package:flutter/material.dart';
import '../../main.dart';

extension LoundryUploadFormWidget on LoundryUploadScreenState {
  //<<<<<<<<<<<<< loundry upload form

  Widget loundryUploadForm(BuildContext context) {
    return (Row(children: [
      SizedBox(
          width: 300,
          child: TextField(
              onChanged: (value) => setState(() {
                    loundryTeleportData.fullname = value;
                  }),
              decoration: const InputDecoration(hintText: 'full name'))),
      const SizedBox(width: 20),
      SizedBox(
          width: 170,
          height: 400,
          child: TextField(
              onChanged: (value) => setState(() {
                    loundryTeleportData.phoneNumber = value;
                  }),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'phone number'))),
      const SizedBox(width: 20),
      DropdownMenu(
        hintText: 'total number of clothes',
        width: 200,
        onSelected: (value) => setState(() {
          loundryTeleportData.totalNumberOfClothes = value;
        }),
        dropdownMenuEntries: const [
          DropdownMenuEntry(value: '1', label: '1'),
          DropdownMenuEntry(value: '2', label: '2'),
          DropdownMenuEntry(value: '3', label: '3'),
          DropdownMenuEntry(value: '4', label: '4'),
          DropdownMenuEntry(value: '5', label: '5'),
          DropdownMenuEntry(value: '6', label: '6'),
          DropdownMenuEntry(value: '7', label: '7'),
          DropdownMenuEntry(value: '8', label: '8'),
          DropdownMenuEntry(value: '9', label: '9'),
          DropdownMenuEntry(value: '10', label: '10'),
          DropdownMenuEntry(value: '1', label: '11'),
          DropdownMenuEntry(value: '12', label: '12'),
          DropdownMenuEntry(value: '13', label: '13'),
          DropdownMenuEntry(value: '14', label: '14'),
          DropdownMenuEntry(value: '15', label: '15'),
          DropdownMenuEntry(value: '16', label: '16'),
          DropdownMenuEntry(value: '17', label: '17'),
          DropdownMenuEntry(value: '18', label: '18'),
          DropdownMenuEntry(value: '19', label: '19'),
          DropdownMenuEntry(value: '20', label: '20'),
          DropdownMenuEntry(value: '21', label: '21'),
          DropdownMenuEntry(value: '22', label: '22'),
          DropdownMenuEntry(value: '23', label: '23'),
          DropdownMenuEntry(value: '24', label: '24'),
          DropdownMenuEntry(value: '25', label: '25'),
          DropdownMenuEntry(value: '26', label: '26'),
          DropdownMenuEntry(value: '27', label: '27'),
          DropdownMenuEntry(value: '28', label: '28'),
        ],
      ),
      const SizedBox(width: 20),
      DropdownMenu(
        hintText: 'total no. of whites or off white',
        width: 200,
        onSelected: (value) => setState(() {
          loundryTeleportData.totalNumberOfWhites = value;
        }),
        dropdownMenuEntries: const [
          DropdownMenuEntry(value: '1', label: '1'),
          DropdownMenuEntry(value: '2', label: '2'),
          DropdownMenuEntry(value: '3', label: '3'),
          DropdownMenuEntry(value: '4', label: '4'),
          DropdownMenuEntry(value: '5', label: '5'),
          DropdownMenuEntry(value: '6', label: '6'),
          DropdownMenuEntry(value: '7', label: '7'),
          DropdownMenuEntry(value: '8', label: '8'),
          DropdownMenuEntry(value: '9', label: '9'),
          DropdownMenuEntry(value: '10', label: '10'),
          DropdownMenuEntry(value: '11', label: '11'),
          DropdownMenuEntry(value: '12', label: '12'),
          DropdownMenuEntry(value: '13', label: '13'),
          DropdownMenuEntry(value: '14', label: '14'),
          DropdownMenuEntry(value: '15', label: '15'),
          DropdownMenuEntry(value: '16', label: '16'),
          DropdownMenuEntry(value: '17', label: '17'),
          DropdownMenuEntry(value: '18', label: '18'),
          DropdownMenuEntry(value: '19', label: '19'),
          DropdownMenuEntry(value: '20', label: '20'),
          DropdownMenuEntry(value: '21', label: '21'),
          DropdownMenuEntry(value: '22', label: '22'),
          DropdownMenuEntry(value: '23', label: '23'),
          DropdownMenuEntry(value: '24', label: '24'),
          DropdownMenuEntry(value: '25', label: '25'),
          DropdownMenuEntry(value: '26', label: '26'),
          DropdownMenuEntry(value: '27', label: '27'),
          DropdownMenuEntry(value: '28', label: '28'),
        ],
      ),
      const SizedBox(width: 20),
      DropdownMenu(
        hintText: 'total no. of Non-Whites',
        width: 200,
        onSelected: (value) => setState(() {
          loundryTeleportData.totalNumberOfNonWhites = value;
        }),
        dropdownMenuEntries: const [
          DropdownMenuEntry(value: '1', label: '1'),
          DropdownMenuEntry(value: '2', label: '2'),
          DropdownMenuEntry(value: '3', label: '3'),
          DropdownMenuEntry(value: '4', label: '4'),
          DropdownMenuEntry(value: '5', label: '5'),
          DropdownMenuEntry(value: '6', label: '6'),
          DropdownMenuEntry(value: '7', label: '7'),
          DropdownMenuEntry(value: '8', label: '8'),
          DropdownMenuEntry(value: '9', label: '9'),
          DropdownMenuEntry(value: '10', label: '10'),
          DropdownMenuEntry(value: '1', label: '11'),
          DropdownMenuEntry(value: '12', label: '12'),
          DropdownMenuEntry(value: '13', label: '13'),
          DropdownMenuEntry(value: '14', label: '14'),
          DropdownMenuEntry(value: '15', label: '15'),
          DropdownMenuEntry(value: '16', label: '16'),
          DropdownMenuEntry(value: '17', label: '17'),
          DropdownMenuEntry(value: '18', label: '18'),
          DropdownMenuEntry(value: '19', label: '19'),
          DropdownMenuEntry(value: '20', label: '20'),
          DropdownMenuEntry(value: '21', label: '21'),
          DropdownMenuEntry(value: '22', label: '22'),
          DropdownMenuEntry(value: '23', label: '23'),
          DropdownMenuEntry(value: '24', label: '24'),
          DropdownMenuEntry(value: '25', label: '25'),
          DropdownMenuEntry(value: '26', label: '26'),
          DropdownMenuEntry(value: '27', label: '27'),
          DropdownMenuEntry(value: '28', label: '28'),
        ],
      ),
      const SizedBox(width: 20),
      ElevatedButton(
        onPressed: () {
          debugPrint('oky');
          //  loundryUploadPainter.createImage();
          debugPrint('oky again');
        },
        style: const ButtonStyle(
          fixedSize: MaterialStatePropertyAll(Size.fromHeight(35)),
        ),
        child: const Text('push'),
      ),
      const SizedBox(width: 25),
    ]));
  }

//<<<<<<<<<<<<<<<<<<<<<<<bottombuttons for texttitle and color palatte

  // GroupValue _groupValue = const GroupValue();

  Widget loundrybottombuttons(
      BuildContext context, LoundryTeleportData teleportData) {
    return (Row(children: [
      SizedBox(
        height: 25,
        width: 25,
        child: DropdownMenu(
          hintText: 'No. of Non-Whites',
          width: 50,
          trailingIcon: const Text(''),
          inputDecorationTheme: InputDecorationTheme(
              contentPadding: const EdgeInsets.all(0),
              fillColor: palette.lightPurple,
              focusColor: palette.lightPurple),
          leadingIcon: Icon(
            Icons.title_rounded,
            color: palette.red,
            size: 30,
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
      ),
      const SizedBox(width: 15),
      SizedBox(
        height: 25,
        width: 25,
        child: DropdownMenu(
          hintText: 'No. of Non-Whites',
          width: 50,
          trailingIcon: const Text(''),
          inputDecorationTheme: InputDecorationTheme(
              contentPadding: const EdgeInsets.only(bottom: 10),
              fillColor: palette.lightPurple,
              focusColor: palette.lightPurple),
          leadingIcon: Icon(
            Icons.palette,
            color: palette.red,
            size: 30,
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
      ),
    ]));
  }

  //>>>>>>>>>>>>>>>>>>>>>>>>>>bottombuttons for texttitle and color palatte
}
