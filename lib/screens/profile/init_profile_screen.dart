import 'package:flutter/material.dart';
import '../../main.dart';
import 'edit_profile._screen.dart';
import '../../models/user_model.dart';
import 'dart:typed_data';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    required this.mine,
    super.key,
  });
  final bool mine;
  @override
  State<ProfileScreen> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  ///from storage
  final storage = FlutterSecureStorage();

  ///
  ///
  bool edit = false;
  User user = User(
      coverPicture: [],
      profilePicture: [],
      email: '',
      fullname: "Leonart D'Vinci",
      username: '@LouisVuiton',
      typeOfUser: 'Designer',
      phoneNumber: '',
      extraInfo:
          'i was the only one here before you came into my lidfe , do you really think you can go against me in this world full of danger, hate and pain , you moust really be joking cus im already laughing, its okay i get it you are in pain and i dont really care about what you are thining about just know that i am always there for you whenever you want me to what ever you do and say is noy',
      dateOfBirth: '');
  ProfileScreenState();

  @override
  void initState() async {
    super.initState();
    Hive.openBox('user');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: profileNameButtonWidget(context, mine: widget.mine)),
      body: body(context),
    );
  }

  Widget body(
    BuildContext context,
  ) {
    return ListView.custom(
        childrenDelegate: SliverChildListDelegate([
      ///
      profilePictureWidget(context), creatorPod(context),
      //   profileNameButtonWidget(context),
      profileInfoWidget(context),

      // navBarWidget(context),
    ]));
  }

  Widget profilePictureWidget(
    BuildContext context,
  ) {
    return ValueListenableBuilder(
        valueListenable: Hive.box('loggedInUser').listenable(),
        builder: (context, box, widget) {
          return Stack(
            children: [
              user.coverPicture.isEmpty
                  ? Container(height: 500, color: palette.grey)
                  : Image.memory(Uint8List.fromList(user.coverPicture)),
              Positioned(
                top: 5,
                left: 5,
                child: CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.white,
                  backgroundImage: CachedNetworkImageProvider(
                      box.get('pictureUrl').toString()),
                ),
              ),
            ],
          );
        });
  }

  Widget profileNameButtonWidget(BuildContext context, {bool mine = false}) {
    return (SizedBox(
      height: 55,
      child: Row(children: [
        //name and username
        const Expanded(
            child: Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(
              children: [Text('@louis vuitton')],
            )
          ]),
        )),

        //follow button for others settings for self
        mine
            ? OutlinedButton(
                onPressed: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (context, _, __) =>
                            const EditProfileScreen(mine: true))),
                child: const Text('edit'))
            : Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                      onPressed: () => debugPrint('okay'),
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.black),
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          fixedSize: MaterialStatePropertyAll(Size(70, 35))),
                      child: const Text('follow')),
                )
              ])
      ]),
    ));
  }

  Widget profileInfoWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: (ConstrainedBox(
          constraints: BoxConstraints.loose(const Size(300, 90)),
          child: Text(user.extraInfo))),
    );
  }

  Widget navBarWidget(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        navBarButton('posts', () => null, icon: Icons.post_add),
        navBarButton('gigs', () => null, icon: Icons.attach_money_rounded),
        navBarButton('follows', () => null, icon: Icons.favorite),
        navBarButton('profile', () => null, icon: Icons.person),
      ]),
    );
  }

  Widget navBarButton(String text, Function() onPress,
      {IconData icon = Icons.attach_money_rounded}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        (OutlinedButton(
            onPressed: onPress,
            style: const ButtonStyle(
                padding: MaterialStatePropertyAll(
                    EdgeInsets.only(left: 0, right: 0)),
                backgroundColor: MaterialStatePropertyAll(Colors.white),
                foregroundColor: MaterialStatePropertyAll(Colors.black),
                elevation: MaterialStatePropertyAll(0),
                textStyle: MaterialStatePropertyAll(TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w600))),
            child: Text(text))),
      ],
    );
  }

  Widget creatorPod(context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: (Container(
        height: 40,
        decoration: BoxDecoration(
          color: palette.lightPurple,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          textDirection: TextDirection.rtl,
          children: [
            //  pad(),
            Expanded(
              child: Text(user.username,
                  style: const TextStyle(
                    color: Colors.blue,
                  )),
            ),
            pad(),
            Expanded(
              child: Text(user.fullname,
                  style: const TextStyle(
                    color: Colors.black87,
                  )),
            ),
            pad(),
            Expanded(
              // flex: 20,
              child: Padding(
                padding: const EdgeInsets.only(left: 7.0),
                child: Text(user.typeOfUser,
                    style: const TextStyle(
                      color: Colors.black87,
                    )),
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget pad([Color color = const Color.fromARGB(255, 72, 72, 73)]) {
    return (VerticalDivider(color: color));
  }
}
