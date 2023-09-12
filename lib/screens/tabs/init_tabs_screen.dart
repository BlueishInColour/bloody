import 'package:flutter/material.dart';
import '../../main.dart';

//screens
import './followers_screen.dart';
import './following_screen.dart';
import 'loundry_screen.dart';
import './notifiction_screen.dart';
import './posts_screen.dart';
import './saved_screen.dart';
import './cut_and_sew_screen.dart';
import './purse_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => TabsScreenState();
}

class TabsScreenState extends State<TabsScreen>
    with SingleTickerProviderStateMixin {
//statefor screen widget
  String currentScreenWidget = 'Tabss';
  late TabController _tabController;
  void _handleTabChange() {
    print("current tab index: ${_tabController.index} ");
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 8, vsync: this);
    _tabController.addListener(_handleTabChange);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabChange);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget tabsAppBar(context) {
      return AppBar(
        title: TabBar(
          controller: _tabController,
          isScrollable: true,
          labelColor: palette.amber,
          indicatorColor: palette.amber,
          unselectedLabelColor: palette.white,
          tabs: const [
            Tab(text: 'notifications'),
            Tab(text: 'cut & sew'),
            Tab(text: 'loundry'),
            Tab(text: 'purse'),
            Tab(text: 'saved'),
            Tab(text: 'posts'),
            Tab(text: 'followers'),
            Tab(text: 'following'),
          ],
        ),
      );
    }

    return (Scaffold(
      appBar: tabsAppBar(context),
      body: TabBarView(controller: _tabController, children: const [
        NotificationScreen(),
        CutAndSewScreen(),
        LoundryScreen(),
        PurseScreen(),
        SavedScreen(),
        PostScreen(),
        FollowersScreen(),
        FollowingScreen(),
      ]),
    ));
  }
}
