import 'package:flutter/material.dart';
import 'package:bloody/Screens/explore_screen.dart';
import '../../main.dart';
import '../../Screens/notification_screen.dart';
import '../../Screens/search_screen.dart';
import '../../Screens/profile_screen.dart';

PreferredSizeWidget appbar(BuildContext context,
    {String barText = 'labalaba',
    bool search = false,
    bool notification = false,
    bool profile = false,
    bool tabnavbar = false}) {
  return (AppBar(
      elevation: 0,
      forceMaterialTransparency: true,
      automaticallyImplyLeading: false,
      backgroundColor: palette.white,
      excludeHeaderSemantics: true,
      bottom: tabnavbar ? tabNavigationBar(context) : null,
      title: SizedBox(
          height: 40,
          child: Row(
            children: [
              Expanded(
                child: search
                    ? searchBarWidget(context)
                    : notification
                        ? barwidget(context, 'notifications',
                            const NotificationScreen())
                        : profile
                            ? barwidget(
                                context, 'profile', const ProfileScreen())
                            : barwidget(
                                context, 'swagr', const ExploreScreenWidget()),
              ),
              Container(
                  decoration: BoxDecoration(
                    color: palette.white,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Row(
                    children: [
                      //iconybutton(context, Icons.menu_open_sharp, 30, () => null),
                      search ? cancelWidget(context) : searchWidget(context),
                      notification
                          ? cancelWidget(context)
                          : notificationWidget(context),
                      profile ? cancelWidget(context) : profileWidget(context),
                      const SizedBox(width: 7)
                    ],
                  ))
            ],
          ))));
}

Widget cancelWidget(BuildContext context) {
  return (IconButton(
      onPressed: () {
        Navigator.pop(context);

        debugPrint('clickedddddd');
      },
      icon: Icon(
        Icons.cancel_outlined,
        size: 30,
        color: palette.purple,
      )));
}

Widget searchWidget(BuildContext context) {
  return (IconButton(
    onPressed: () => Navigator.push(context,
        MaterialPageRoute(builder: (context) => const SearchResultScreen())),
    icon: Icon(Icons.search, size: 30, color: palette.red),
  ));
}

Widget notificationWidget(BuildContext context) {
  return (IconButton(
    onPressed: () => Navigator.push(context,
        MaterialPageRoute(builder: (context) => const NotificationScreen())),
    icon: Icon(Icons.notifications_none, size: 30, color: palette.red),
  ));
}

Widget profileWidget(BuildContext context) {
  return (IconButton(
    onPressed: () => Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ProfileScreen())),
    icon:
        Icon(Icons.auto_awesome_mosaic_outlined, size: 30, color: palette.red),
  ));
}

Widget barwidget(BuildContext context, String barText, Widget textRouteWidget) {
  return Container(
    //decoration: BoxDecoration(color: palette.red,),
    child: (Row(
      children: [
        IconButton(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(2),
          icon: Icon(
            Icons.explore,
            color: palette.red,
            size: 30,
          ),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => const ExploreScreenWidget())),
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => textRouteWidget,
            ),
          ),
          child: Text(
            textAlign: TextAlign.center,
            barText,
            style: TextStyle(
              fontSize: 35,
              color: palette.red,
            ),
          ),
        ),
      ],
    )),
  );
}

Widget searchBarWidget(BuildContext context) {
  return (const Row(
    children: [
      Expanded(child: TextField()),
      IconButton(onPressed: null, icon: Icon(Icons.search, size: 27)),
    ],
  ));
}

PreferredSizeWidget tabNavigationBar(BuildContext context) {
  return AppBar(
      automaticallyImplyLeading: false,
      titleTextStyle: TextStyle(
          color: palette.purple, fontSize: 15, fontWeight: FontWeight.bold),
      toolbarHeight: 25,
      bottomOpacity: 0.60,
      elevation: 0,
      title: (const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('wardrope'),
          VerticalDivider(),
          Text('posts'),
          VerticalDivider(),
          Text('blogs'),
          VerticalDivider(),
          Text('gigs'),
        ],
      )));
}
