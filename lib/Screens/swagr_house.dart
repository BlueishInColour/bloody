import 'package:bloody/Screens/search_screen.dart';

import '../main.dart';
import 'package:flutter/material.dart';



//import 'style_upload_screen.dart';
//import 'loundry_upload_screen.dart';
import 'notification_screen.dart';
import 'profile_screen.dart';
import 'tryout_screen.dart';

final palette = Palette();

class SwagrHouse extends StatefulWidget {
  const SwagrHouse({super.key});

  @override
  State<SwagrHouse> createState() => SwagrHouseState();
}

class SwagrHouseState extends State<SwagrHouse> {
  int selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: appbar(context),
      backgroundColor: palette.white,
      body: [
        Center(
          child: TryOutScreen(),
          // ExploreScreenWidget(),
        ),
        const Center(child: SearchResultScreen()),
        const Center(child: NotificationScreen()),
        const Center(child: ProfileScreen()),
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
              label: 'home',
            ),
            NavigationDestination(
              icon: Icon(Icons.search),
              label: 'expore',
            ),
            NavigationDestination(
              icon: Icon(Icons.notifications_outlined),
              label: 'notify',
            ),
            NavigationDestination(
              icon: Icon(Icons.auto_awesome_mosaic_outlined),
              label: 'profile',
            ),
          ]),
    );
  }
}
