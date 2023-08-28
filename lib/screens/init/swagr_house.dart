import '../search/init_search_screen.dart';

import '../../main.dart';
import 'package:flutter/material.dart';

import '../tabs/init_tabs_screen.dart';
import '../explore/profile_screen/init_profile_screen.dart';
import '../explore/init_explore_screen.dart';
import '../nugget/init_nuggets_screen.dart';

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
            child: Center(
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
        const Center(child: NuggetScreen()),
        const Center(child: SearchScreen()),
        const Center(child: TabsScreen()),
      ][selectedPageIndex],

      bottomNavigationBar: NavigationBar(
          backgroundColor: palette.black,
          selectedIndex: selectedPageIndex,
          onDestinationSelected: (int index) => setState(() {
                selectedPageIndex = index;
              }),
          destinations: <NavigationDestination>[
            NavigationDestination(
              icon: Icon(Icons.home_outlined, color: palette.white),
              selectedIcon: Icon(
                Icons.home_filled,
                color: palette.amber,
                fill: 1,
              ),
              label: 'home',
            ),
            NavigationDestination(
                icon: Icon(Icons.apps, color: palette.white),
                selectedIcon: Icon(
                  Icons.apps_rounded,
                  color: palette.amber,
                  fill: 1,
                ),
                label: 'nuggets'),
            NavigationDestination(
              icon: Icon(Icons.search, color: palette.white),
              selectedIcon: Icon(Icons.search, size: 27, color: palette.amber),
              label: 'expore',
            ),
            NavigationDestination(
                icon: Icon(Icons.notifications_outlined, color: palette.white),
                selectedIcon: Icon(
                  Icons.notifications_rounded,
                  color: palette.amber,
                  fill: 1,
                ),
                label: 'notify'),
          ]),
    );
  }
}
