import 'package:flutter/material.dart';
import '../../main.dart';
import './floating_search_button.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => NotificationScreenState();
}

class NotificationScreenState extends State<NotificationScreen> {
  final Icon done = const Icon(
      Icons.done_all); //notify icon to confirm pull or pushed actions
  final Icon notify = const Icon(Icons
      .notifications_active); //notify icon to alert for news or notification
  final Icon promotion =
      const Icon(Icons.lightbulb_rounded); //notify icon for promotions and ads

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const TabsFloatingSearchButton(),
      body: ListView.separated(
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
                          foregroundColor: Colors.white,
                          backgroundColor: Color.fromARGB(255, 207, 4, 4),
                          child: done,
                        ),
                        const Expanded(child: Text('')),

                        //part
                        //how may days, time ago
                        //
                        Text('1d',
                            style: TextStyle(color: palette.textColorLight))
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
                        child: Text(
                          'pelumi just purchased a black hood and its about to be delivered enter pin to allow deivery',
                          softWrap: true,
                          maxLines: 6,
                          style: TextStyle(
                              color: palette.textColorLight,
                              overflow: TextOverflow.ellipsis),
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
      ),
    );
  }
}
