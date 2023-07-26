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
      appBar: AppBar(title: ProfileNameButtonWidget(context)),
      body: body(context),
    );
  }
}

Widget body(BuildContext context) {
  return ListView.custom(
      childrenDelegate: SliverChildListDelegate([
    ///
    ProfilePictureWidget(context),
    //   ProfileNameButtonWidget(context),
    ProfileInfoWidget(context),
    NavBarWidget(context),
  ]));
}

Widget ProfilePictureWidget(BuildContext context) {
  return Stack(
    children: [
      Container(height: 600, color: Colors.black),
      Positioned(
          top: 5,
          left: 5,
          child: CircleAvatar(
            radius: 35,
            backgroundColor: Colors.white,
          ))
    ],
  );
}

Widget ProfileNameButtonWidget(BuildContext context) {
  return (SizedBox(
    height: 55,
    child: Row(children: [
      //name and username
      Expanded(
          child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Row(
            children: [
              Text('Oluwapelumide',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300))
            ],
          ),
          Row(
            children: [
              Text('@blueishInColour',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w200))
            ],
          )
        ]),
      )),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('followers 1k',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
            Text('following 234k',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
            Text('posts 34k',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
          ],
        ),
      ),
      //follow button for others settings for self
      Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
              onPressed: () => debugPrint('okay'),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.black),
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                  fixedSize: MaterialStatePropertyAll(Size(70, 35))),
              child: Text('follow')),
        )
      ])
    ]),
  ));
}

Widget ProfileInfoWidget(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: (ConstrainedBox(
      constraints: BoxConstraints.loose(Size(300, 90)),
      child: Text(
          'i was the only one here before you came into my lidfe , do you really think you can go against me in this world full of danger, hate and pain , you moust really be joking cus im already laughing, its okay i get it you are in pain and i dont really care about what you are thining about just know that i am always there for you whenever you want me to what ever you do and say is noy'),
    )),
  );
}

Widget NavBarWidget(BuildContext context) {
  return Container(
    color: Colors.white,
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      NavBarButton('posts', () => null, icon: Icons.post_add),
      NavBarButton('gigs', () => null, icon: Icons.attach_money_rounded),
      NavBarButton('follows', () => null, icon: Icons.favorite),
      NavBarButton('profile', () => null, icon: Icons.person),
    ]),
  );
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
