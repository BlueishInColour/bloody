import 'package:flutter/material.dart';
import '../Widgets/explore_screen_widgets/app_bar.dart';
import '../main.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(title: const Text('notifications')),
      body: ListView.builder(
        itemBuilder: notificationPod,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      ),
    ));
  }

  Widget? notificationPod(BuildContext context, int index) {
    return Column(
      children: [
        const SizedBox(height: 5),
        (Container(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: palette.lightPurple,
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //                //part
                    //icon for type of notification
                    ///
                    CircleAvatar(),
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
        const Divider(
          color: Colors.grey,
        )
      ],
    );
  }
}
