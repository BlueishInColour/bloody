import '../search/init_search_screen.dart';

import '../../main.dart';
import 'package:flutter/material.dart';

import '../notification/init_notification_screen.dart';
import '../profile/init_profile_screen.dart';
import '../explore/init_explore_screen.dart';

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
            child:  Center(
              child: Text("Persistent BottomSheet",
                  textScaleFactor: 2,
                  style: TextStyle(
                      color: palette.white, fontWeight: FontWeight.bold)),
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
      backgroundColor: palette.black,
      body: [
        const Center(child: ExploreScreenWidget()),
        const Center(child: SearchScreen()),
        const Center(child: NotificationScreen()),
        const Center(child: ProfileScreen(mine: true)),
      ][selectedPageIndex],

      bottomNavigationBar: NavigationBar(
          backgroundColor: palette.black,
          selectedIndex: selectedPageIndex,
          onDestinationSelected: (int index) => setState(() {
                selectedPageIndex = index;
              }),
          destinations:  <NavigationDestination>[
            NavigationDestination(
              icon: Icon(Icons.home_outlined,color:palette.white),
              selectedIcon: Icon(
                Icons.home_filled,
                color: palette.white,
                fill: 1,
              ),
              label: 'home',
            ),
            NavigationDestination(
              icon: Icon(Icons.search,color:palette.white),
              selectedIcon: Icon(Icons.search, size: 27,color:palette.white),
              label: 'expore',
            ),
            NavigationDestination(
                icon: Icon(Icons.notifications_outlined,color:palette.white),
                selectedIcon: Icon(
                  Icons.notifications_rounded,
                  color: palette.white,
                  fill: 1,
                ),
                label: 'notify'),
            NavigationDestination(
                icon: Icon(Icons.auto_awesome_mosaic_outlined,color:palette.white),
                selectedIcon: Icon(
                  Icons.auto_awesome_mosaic_rounded,
                  color: palette.white,
                ),
                label: 'profile'),
          ]),
    );
  }
}
