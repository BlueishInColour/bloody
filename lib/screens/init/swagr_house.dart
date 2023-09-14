import '../search/init_search_screen.dart';

import '../../main.dart';
import 'package:flutter/material.dart';

import '../tabs/init_tabs_screen.dart';
import '../explore/profile_screen/init_profile_screen.dart';
import '../explore/init_explore_screen.dart';
import '../nugget/init_nuggets_screen.dart';
import '../runway/init_runway.dart';

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
            Center(child: SearchScreen()),
            Center(child: ExploreScreen()),
            Center(child: RunwayScreen()),
            Center(child: NuggetScreen()),
          ],
        ),
        bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(canvasColor: palette.black),
            child: BottomNavigationBar(
                backgroundColor: palette.black,
                currentIndex: selectedPageIndex,
                onTap: onTap,
                items: [
                  const BottomNavigationBarItem(
                      label: 'explore',
                      icon: Icon(Icons.explore),
                      activeIcon: Icon(Icons.explore)),
                  const BottomNavigationBarItem(
                    label: 'styles',
                    icon: Icon(Icons.photo),
                  ),
                  BottomNavigationBarItem(
                    label: 'runway',
                    icon: Icon(Icons.videocam_sharp, color: palette.white),
                    activeIcon: const Icon(
                      Icons.videocam_sharp,
                      size: 27,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: 'nuggets',
                    icon: Icon(Icons.apps, color: palette.white),
                    activeIcon: Icon(Icons.apps, color: palette.amber),
                  )
                ])));
  }
}
