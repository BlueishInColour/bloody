import 'package:flutter/material.dart';
import '../../../main.dart';
import 'edit_profile._screen.dart';
import '../../../models/user_model.dart';
import 'dart:typed_data';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:auth0_flutter/auth0_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    required this.mine,
    required this.user,
    super.key,
  });
  final bool mine;
  final UserProfile? user;

  final storage = const FlutterSecureStorage();

  ///
  ///
  final bool edit = false;

  @override
  Widget build(BuildContext context) {
    final User user = User(
        coverPicture: '',
        profilePicture: '',
        email: '',
        fullname: "Leonart D'Vinci",
        username: '@LouisVuiton',
        typeOfUser: 'Designer',
        phoneNumber: '',
        extraInfo:
            'i was the only one here before you came into my lidfe , do you really think you can go against me in this world full of danger, hate and pain , you moust really be joking cus im already laughing, its okay i get it you are in pain and i dont really care about what you are thining about just know that i am always there for you whenever you want me to what ever you do and say is noy',
        dateOfBirth: '');

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
                    : CachedNetworkImage(imageUrl: user.coverPicture),
                Positioned(
                  top: 5,
                  left: 5,
                  child: CircleAvatar(
                      radius: 35,
                      backgroundColor: palette.white,
                      backgroundImage:
                          CachedNetworkImageProvider(user.profilePicture)),
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
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                        style: ButtonStyle(
                            backgroundColor:
                                const MaterialStatePropertyAll(Colors.black),
                            foregroundColor:
                                MaterialStatePropertyAll(palette.white),
                            fixedSize:
                                const MaterialStatePropertyAll(Size(70, 35))),
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
      Widget navBarButton(String text, Function() onPress,
          {IconData icon = Icons.attach_money_rounded}) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            (OutlinedButton(
                onPressed: onPress,
                style: ButtonStyle(
                    padding: const MaterialStatePropertyAll(
                        EdgeInsets.only(left: 0, right: 0)),
                    backgroundColor: MaterialStatePropertyAll(palette.white),
                    foregroundColor:
                        const MaterialStatePropertyAll(Colors.black),
                    elevation: const MaterialStatePropertyAll(0),
                    textStyle: const MaterialStatePropertyAll(TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600))),
                child: Text(text))),
          ],
        );
      }

      return Container(
        color: palette.white,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          navBarButton('posts', () => null, icon: Icons.post_add),
          navBarButton('gigs', () => null, icon: Icons.attach_money_rounded),
          navBarButton('follows', () => null, icon: Icons.favorite),
          navBarButton('profile', () => null, icon: Icons.person),
        ]),
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
              //  VerticalDivider(),

              const VerticalDivider(),
              Expanded(
                child: Text(user.fullname,
                    style: const TextStyle(
                      color: Colors.black87,
                    )),
              ),
              const VerticalDivider(),
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

    return Scaffold(
      appBar: AppBar(title: profileNameButtonWidget(context, mine: mine)),
      body: body(context),
    );
  }
}
