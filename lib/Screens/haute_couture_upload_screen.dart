import 'package:flutter/material.dart';
import '../main.dart';

import '../Widgets/haute_couture_upload_widgets/generic_screen.dart';
import '../Widgets/haute_couture_upload_widgets/specific_screen.dart';

class HauteCoutureUploadScreen extends StatefulWidget {
  const HauteCoutureUploadScreen({super.key});

  @override
  State<HauteCoutureUploadScreen> createState() =>
      HauteCoutureUploadScreenState();
}

class HauteCoutureUploadScreenState extends State<HauteCoutureUploadScreen> {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
            title: const Text(
              'haute couture',
            ),
            toolbarHeight: 35),
        bottomNavigationBar: const SizedBox(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: null,
                  child: Text('push', style: TextStyle(fontSize: 15))),
              SizedBox(width: 10)
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  choseFabric(context),
                  choseStyle(context),
                  choseMeasurement(context),
                  const SizedBox(height: 30),
                  const SizedBox(
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(hintText: 'other details'),
                    ),
                  ),
                  const Divider(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(hintText: 'fullname'),
                    ),
                  ),
                  const Divider(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(hintText: 'Phone Number'),
                    ),
                  ),
                  const Divider(
                    height: 10,
                  ),
                ],
              ),
            ],
          ),
        )));
  }

  Widget containPod(
      BuildContext context, IconData icon, Color color, Function()? re,
      {double width = 100, String iconText = ''}) {
    return (Stack(
      children: [
        Expanded(
          child: Container(
            width: width,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              color: color,
            ),
          ),
        ),
        Positioned(
          right: 20,
          left: 20,
          top: 20,
          bottom: 20,
          child: Center(
              child: IconButton(onPressed: re, icon: Icon(icon, size: 30))),
        ),
        Positioned(
            left: 20, right: 20, top: 20, child: Center(child: Text(iconText)))
      ],
    ));
  }

  Widget choseFabric(BuildContext context) {
    return (Column(
      children: [
        const Text('fabric : choose fabric to use'),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              containPod(context, Icons.camera, palette.black, null),
              containPod(
                  context, Icons.file_present_rounded, palette.lightPurple, null),
              containPod(context, Icons.explore, palette.lightPurple, null)
            ],
          ),
        ),
        const SizedBox(height: 60),
        const Divider(
          height: 10,
        ),
      ],
    ));
  }

  Widget choseStyle(BuildContext context) {
    return (Column(
      children: [
        const Text('style/design : choose what to use'),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              containPod(context, Icons.camera, palette.black, null),
              containPod(
                  context, Icons.file_present_rounded, palette.lightPurple, null),
              containPod(context, Icons.explore, palette.lightPurple, null)
            ],
          ),
        ),
        const SizedBox(height: 60),
        const Divider(
          height: 10,
        ),
      ],
    ));
  }

  Widget choseMeasurement(BuildContext context) {
    return (Column(children: [
      const Text('measurement : take body measurement'),
      const SizedBox(height: 10),
      SizedBox(
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            containPod(
                context,
                Icons.explore,
                palette.lightPurple,
                () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Generic())),
                width: 170,
                iconText: 'generic'),
            containPod(
                context,
                Icons.explore,
                palette.lightPurple,
                () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Specific())),
                width: 170,
                iconText: 'specific')
          ],
        ),
      ),
      const SizedBox(height: 60),
      const Divider(
        height: 10,
      ),
    ]));
  }
}
