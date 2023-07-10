import 'package:flutter/material.dart';
import '../main.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  ProfileScreenState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CircleAvatar(radius: 30, backgroundColor: palette.white),
        toolbarHeight: 200,
        backgroundColor: palette.black,
        bottomOpacity: 1,
        bottom: PreferredSize(
            child: Container(
              color: Colors.white,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    NavBarButton('posts', () => null, icon: Icons.post_add),
                    NavBarButton('gigs', () => null,
                        icon: Icons.attach_money_rounded),
                    NavBarButton('profile', () => null, icon: Icons.person),
                    NavBarButton('settings', () => null, icon: Icons.settings)
                  ]),
            ),
            preferredSize: Size(100, 20)),
      ),
    );
  }
}

Widget NavBarButton(String text, Function() onPress,
    {IconData icon = Icons.attach_money_rounded}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      (TextButton(
          onPressed: onPress,
          style: const ButtonStyle(
              padding:
                  MaterialStatePropertyAll(EdgeInsets.only(left: 0, right: 0)),
              backgroundColor: MaterialStatePropertyAll(Colors.white),
              foregroundColor: MaterialStatePropertyAll(Colors.black),
              elevation: MaterialStatePropertyAll(0),
              textStyle: MaterialStatePropertyAll(
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600))),
          child: Text(text))),
      Icon(
        icon,
        size: 15,
        color: Colors.black,
      )
    ],
  );
}
