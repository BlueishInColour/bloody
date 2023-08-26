import 'package:flutter/material.dart';
import '../../main.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => NotificationScreenState();
}

class NotificationScreenState extends State<NotificationScreen> {
//statefor screen widget
  String currentScreenWidget = 'notifications';

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: appBar(context),
      body: currentScreenWidget == 'notifications'
          ? notificationPod(context)
          : currentScreenWidget == 'saved'
              ? SizedBox()
              : currentScreenWidget == 'followers'
                  ? SizedBox()
                  : currentScreenWidget == 'following'
                      ? SizedBox()
                      : currentScreenWidget == 'posts'
                          ? SizedBox()
                          : currentScreenWidget == 'gigs'
                              ? SizedBox()
                              : currentScreenWidget == 'saved'
                                  ? SizedBox()
                                  : null,
    ));
  }

  final Icon done = const Icon(
      Icons.done_all); //notify icon to confirm pull or pushed actions
  final Icon notify = const Icon(Icons
      .notifications_active); //notify icon to alert for news or notification
  final Icon promotion =
      const Icon(Icons.lightbulb_rounded); //notify icon for promotions and ads

  Widget? notificationPod(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      itemCount: 20,
      itemBuilder: (context, index) => Column(
        children: [
          const SizedBox(height: 5),
          (SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //                //part
                      //icon for type of notification
                      ///
                      CircleAvatar(
                        foregroundColor: palette.white,
                        backgroundColor: Colors.black,
                        child: done,
                      ),
                      const Expanded(child: Text('')),

                      //part
                      //how may days, time ago
                      //
                      const Text('1d')
                    ],
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      //
                      //part
                      //message part
                      child: const Text(
                        'pelumi just purchased a black hood and its about to be delivered enter pin to allow deivery',
                        softWrap: true,
                        maxLines: 6,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  AppBar appBar(
    BuildContext context,
  ) {
    Widget tab(String text, {String changeToScreen = ''}) {
      return TextButton(
        onPressed: () {
          setState(() {
            currentScreenWidget = changeToScreen;
          });
        },
        child: Row(
          children: [
            Text(text,
                style: const TextStyle(
                  color: Colors.black87,
                )),
            VerticalDivider()
          ],
        ),
      );
    }

    return AppBar(
      titleTextStyle: const TextStyle(fontSize: 15),
      title: Padding(
        padding: const EdgeInsets.all(0.0),
        child: (Container(
          height: 40,
          decoration: BoxDecoration(
            color: palette.grey,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListView(
            scrollDirection: Axis.horizontal,
            //  padding: const EdgeInsetsDirectional.only(top: 15),
            children: [
              //  VerticalDivider(),
              const SizedBox(width: 7),
              tab('notifications'),
              tab('saved'),
              tab('posts'),
              tab('followers'),
              tab('following'),
              tab('gigs')
            ],
          ),
        )),
      ),
    );
  }
}
