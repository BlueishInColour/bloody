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

class SwagrHouseState extends State<SwagrHouse>
    with AutomaticKeepAliveClientMixin {
  int selectedPageIndex = 0;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late VoidCallback _showPersBottomSheetCallBack;

  @override
  bool get wantKeepAlive => true;

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

  //persist data after switched
  final PageController _controller = PageController();

  void onTap(int index) {
    if (selectedPageIndex != index) {
      _controller.jumpToPage(index);
      setState(() {
        selectedPageIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        //  appBar: appbar(context),
        backgroundColor: palette.black,
        body: PageView(
          controller: _controller,
          onPageChanged: onTap,
          children: const [
            Center(child: ExploreScreenWidget()),
            Center(child: NuggetScreen()),
            Center(child: SearchScreen()),
            Center(child: TabsScreen()),
          ],
        ),
        bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(canvasColor: palette.black),
            child: BottomNavigationBar(
                backgroundColor: palette.black,
                currentIndex: selectedPageIndex,
                onTap: onTap,
                items: [
                  BottomNavigationBarItem(
                      label: 'home',
                      icon: Icon(Icons.home_outlined),
                      activeIcon: Icon(Icons.home)),
                  BottomNavigationBarItem(
                    label: 'nuggets',
                    icon: Icon(Icons.apps),
                  ),
                  BottomNavigationBarItem(
                    label: 'search',
                    icon: Icon(Icons.search, color: palette.white),
                    activeIcon: Icon(
                      Icons.search,
                      size: 27,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: 'tabs',
                    icon: Icon(Icons.notifications_outlined,
                        color: palette.white),
                    activeIcon: Icon(
                      Icons.notifications_rounded,
                      color: palette.amber,
                    ),
                  )
                ])));
  }
}
