import 'package:flutter/material.dart';
import '../main.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(title: const Text('notifications')),
      body: ListView.separated(
        itemCount: 20,
        itemBuilder: notificationPod,
        separatorBuilder: (context, index) => Divider(),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      ),
    ));
  }

  final Icon done = const Icon(
      Icons.done_all); //notify icon to confirm pull or pushed actions
  final Icon notify = const Icon(Icons
      .notifications_active); //notify icon to alert for news or notification
  final Icon promotion =
      const Icon(Icons.lightbulb_rounded); //notify icon for promotions and ads

  Widget? notificationPod(BuildContext context, int index) {
    return Column(
      children: [
        const SizedBox(height: 5),
        (SizedBox(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //                //part
                    //icon for type of notification
                    ///
                    CircleAvatar(
                      child: done,
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                    ),
                    Expanded(child: Text('')),

                    //part
                    //how may days, time ago
                    //
                    Text('1d')
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
    );
  }
}
