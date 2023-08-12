import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import '../../main.dart';
import '../../Models/user_model.dart';
import '../../Apis/upstash.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({
    required this.mine,
    super.key,
  });
  final bool mine;
  @override
  State<EditProfileScreen> createState() => EditProfileScreenState();
}

class EditProfileScreenState extends State<EditProfileScreen> {
  bool edit = false;
  EditProfileScreenState();

  User user = User(
      coverPicture: [],
      profilePicture: [],
      email: '',
      fullname: '',
      username: '',
      phoneNumber: '',
      dateOfBirth: '');

  Future<List<int>> getFileImages(
      {bool profilepix = false, bool coverpix = false}) async {
    print('connected');
    var image = await ImagePicker.platform.pickImage(
      source: ImageSource.gallery,
    );

    List<int> bytes = await image!.readAsBytes();
    print(bytes);
    print('done converting');

    print('done setting bytes');
    return bytes;
  }

  getCameraImages({bool profilepix = false, bool coverpix = false}) async {
    print('connected');
    var image = await ImagePicker.platform.pickImage(
        source: ImageSource.camera, preferredCameraDevice: CameraDevice.rear);
    List<int> bytes = await image!.readAsBytes();
    setState(() {
      profilepix ? user.profilePicture = bytes : user.coverPicture = bytes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: ProfileNameButtonWidget(context, mine: widget.mine)),
      body: body(context),
    );
  }

  Widget body(
    BuildContext context,
  ) {
    return ListView.custom(
        childrenDelegate: SliverChildListDelegate([
      ///
      ProfilePictureWidget(context),
      //   ProfileNameButtonWidget(context),
      EditUsernameWidget(context),
      EditNameWidget(context),
      EditProfileInfoWidget(context),
      EditPhoneNumberWidget(context),
      EditEmailWidget(context)
      // NavBarWidget(context),
    ]));
  }

  Widget ProfilePictureWidget(
    BuildContext context,
  ) {
    return Stack(
      children: [
        user.coverPicture.isEmpty
            ? Container(height: 500, color: Colors.blueGrey)
            : Image.memory(Uint8List.fromList(user.coverPicture)),
        Positioned(
            top: 5,
            left: 5,
            child: CircleAvatar(
                radius: 35,
                backgroundColor: Colors.white,
                backgroundImage:
                    MemoryImage(Uint8List.fromList(user.profilePicture)))),
        Positioned(
            left: 70,
            top: 1,
            child: IconButton(
                onPressed: () => getFileImages().then((value) {
                      setState(() {
                        user.profilePicture = value;
                      });
                    }),
                icon: Icon(Icons.edit_outlined,
                    color: Color.fromARGB(255, 255, 255, 255)))),
        Positioned(
            right: 5,
            top: 10,
            child: IconButton(
                onPressed: () async => await getFileImages().then((value) {
                      setState(() {
                        user.coverPicture = value;
                      });
                    }),
                icon: Icon(Icons.edit_outlined, color: Colors.white))),
      ],
    );
  }

  Widget ProfileNameButtonWidget(BuildContext context, {bool mine = false}) {
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

        //follow button for others settings for self
        OutlinedButton(
            onPressed: () async {
              print('connecting');
              await userApi.json
                  .set(user.username, r'$', user.toJson())
                  .then((value) => print(value));
              print('user details edited');
              Navigator.pop(context);
            },
            child: Text('save'))
      ]),
    ));
  }

  Widget EditUsernameWidget(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            height: 50,
            child: TextField(
              onChanged: (value) => setState(() {
                user.username = value;
              }),
              decoration: InputDecoration(
                  fillColor: palette.grey,
                  prefixText: '@',
                  prefixStyle: TextStyle(color: Colors.black26),
                  hintText: 'username',
                  hintStyle: TextStyle(color: Colors.black26)),
            )));
  }

  Widget EditNameWidget(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            height: 50,
            child: TextField(
              onChanged: (value) => setState(() {
                user.fullname = value;
              }),
              decoration: InputDecoration(
                  fillColor: palette.grey,
                  hintText: 'name',
                  hintStyle: TextStyle(color: Colors.black26)),
            )));
  }

  Widget EditProfileInfoWidget(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            height: 100,
            child: TextField(
              maxLines: 7,
              onChanged: (value) => setState(() {
                user.extraInfo = value;
              }),
              decoration: InputDecoration(
                  fillColor: palette.grey,
                  hintText: 'profile info',
                  hintStyle: TextStyle(color: Colors.black26)),
            )));
  }

  Widget EditPhoneNumberWidget(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            height: 50,
            child: TextField(
              onChanged: (value) => setState(() {
                user.phoneNumber = value;
              }),
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  fillColor: palette.grey,
                  hintText: 'phone number',
                  hintStyle: TextStyle(color: Colors.black26)),
            )));
  }

  Widget EditEmailWidget(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            height: 50,
            child: TextField(
              onChanged: (value) => setState(() {
                user.email = value;
              }),
              decoration: InputDecoration(
                  fillColor: palette.grey,
                  hintText: 'blueishincolour@email.com',
                  hintStyle: TextStyle(color: Colors.black26)),
            )));
  }
}
