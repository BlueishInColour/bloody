import 'package:bloody/Screens/search_screen.dart';

import 'package:bloody/Screens/post_upload_screen.dart';
import '../Screens/haute_couture_upload_screen.dart';

import '../main.dart';
import 'package:flutter/material.dart';

//import 'style_upload_screen.dart';
//import 'loundry_upload_screen.dart';
import 'notification_screen.dart';
import 'profile_screen.dart';
import 'explore_screen.dart';

final palette = Palette();

class SwagrHouse extends StatefulWidget {
  const SwagrHouse({super.key});

  @override
  State<SwagrHouse> createState() => SwagrHouseState();
}

class SwagrHouseState extends State<SwagrHouse> {
  int selectedPageIndex = 0;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late VoidCallback _showPersBottomSheetCallBack;

  @override
  void initState() {
    super.initState();
    _showPersBottomSheetCallBack = _showPersistentBottomSheet;
  }

  void _showPersistentBottomSheet() {
    setState(() {
      _showPersBottomSheetCallBack = () => null;
    });
    _scaffoldKey.currentState!
        .showBottomSheet((context) {
          return Container(
            height: 200.0,
            color: Colors.green,
            child: const Center(
              child: Text("Persistent BottomSheet",
                  textScaleFactor: 2,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          );
        })
        .closed
        .whenComplete(() {
          if (mounted) {
            setState(() {
              _showPersBottomSheetCallBack = _showPersistentBottomSheet;
            });
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: appbar(context),
      backgroundColor: palette.white,
      body: [
        const Center(child: ExploreScreenWidget()),
        const Center(child: SearchScreen()),
        const Center(child: NotificationScreen()),
        const Center(child: ProfileScreen(mine: true)),
      ][selectedPageIndex],

      bottomNavigationBar: NavigationBar(
          backgroundColor: palette.white,
          selectedIndex: selectedPageIndex,
          onDestinationSelected: (int index) => setState(() {
                selectedPageIndex = index;
              }),
          destinations: const <NavigationDestination>[
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(
                Icons.home_filled,
                color: Colors.black,
                fill: 1,
              ),
              label: 'home',
            ),
            NavigationDestination(
              icon: Icon(Icons.search),
              selectedIcon: Icon(Icons.search, size: 27),
              label: 'expore',
            ),
            NavigationDestination(
                icon: Icon(Icons.notifications_outlined),
                selectedIcon: Icon(
                  Icons.notifications_rounded,
                  color: Colors.black,
                  fill: 1,
                ),
                label: 'notify'),
            NavigationDestination(
                icon: Icon(Icons.auto_awesome_mosaic_outlined),
                selectedIcon: Icon(
                  Icons.auto_awesome_mosaic_rounded,
                  color: Colors.black,
                ),
                label: 'profile'),
          ]),
    );
  }
}

Widget dialog(BuildContext context) {
  return (Dialog(
    child: SizedBox(
      height: 220,
      width: 40,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            style: const ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Color.fromARGB(43, 129, 50, 219))),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const PostUpload())),
            child: const Text('style',
                style: TextStyle(color: Colors.white, fontSize: 15)),
          ),
          const Divider(),
          TextButton(
            style: const ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Color.fromARGB(43, 129, 50, 219))),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const HauteCoutureUploadScreen())),
            child: Text('haute couture',
                style: TextStyle(color: palette.white, fontSize: 15)),
          ),
          const Divider(),
          TextButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(43, 129, 50, 219))),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const PostUpload())),
              child: Text('loundry',
                  style: TextStyle(color: palette.white, fontSize: 15)))
        ],
      ),
    ),
  ));
}
