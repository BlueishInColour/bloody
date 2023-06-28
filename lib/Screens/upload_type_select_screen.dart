import 'package:bloody/Screens/style_upload_screen.dart';
import '../Screens/loundry_upload_screen.dart';
import '../Screens/haute_couture_upload_screen.dart';

import 'package:flutter/material.dart';
import '../main.dart';

//final palette = Palette();

class SelectScreen extends StatelessWidget {
  const SelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: GestureDetector(
        onHorizontalDragEnd: (details) => Navigator.pop(context),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('what do you want to push?',
                  style: TextStyle(color: palette.black, fontSize: 20)),
              SizedBox(
                height: 400,
                width: 300,
                child: Dialog(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Color.fromARGB(43, 129, 50, 219))),
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const StyleUploadScreen())),
                        child: Text('style',
                            style:
                                TextStyle(color: palette.black, fontSize: 20)),
                      ),
                      const Divider(),
                      TextButton(
                        style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Color.fromARGB(43, 129, 50, 219))),
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const HauteCoutureUploadScreen())),
                        child: Text('haute couture',
                            style:
                                TextStyle(color: palette.black, fontSize: 20)),
                      ),
                      const Divider(),
                      TextButton(
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Color.fromARGB(43, 129, 50, 219))),
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const LoundryUploadScreen())),
                          child: Text('loundry',
                              style: TextStyle(
                                  color: palette.black, fontSize: 20)))
                    ],
                  ),
                ),
              ),
              IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.cancel_outlined,
                    size: 35,
                  ))
            ],
          ),
        ),
      ),
    ));
  }
}
