import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import '../../main.dart';
import '../../models/user_model.dart';
import '../../apis/upstash.dart';

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
      profilePictureWidget(context),
      //   ProfileNameButtonWidget(context),
      editUsernameWidget(context),
      editNameWidget(context),
      editProfileInfoWidget(context),
      editPhoneNumberWidget(context),
      editEmailWidget(context)
      // NavBarWidget(context),
    ]));
  }

  Widget profilePictureWidget(
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
                icon: const Icon(Icons.edit_outlined,
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
                icon: const Icon(Icons.edit_outlined, color: Colors.white))),
      ],
    );
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
              children: [
                Text('@blueishInColour',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400))
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
            child: const Text('save'))
      ]),
    ));
  }

  Widget editUsernameWidget(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
            height: 50,
            child: TextField(
              onChanged: (value) => setState(() {
                user.username = value;
              }),
              decoration: InputDecoration(
                  fillColor: palette.grey,
                  prefixText: '@',
                  prefixStyle: const TextStyle(color: Colors.black26),
                  hintText: 'username',
                  hintStyle: const TextStyle(color: Colors.black26)),
            )));
  }

  Widget editNameWidget(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
            height: 50,
            child: TextField(
              onChanged: (value) => setState(() {
                user.fullname = value;
              }),
              decoration: InputDecoration(
                  fillColor: palette.grey,
                  hintText: 'name',
                  hintStyle: const TextStyle(color: Colors.black26)),
            )));
  }

  Widget editProfileInfoWidget(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
            height: 100,
            child: TextField(
              maxLines: 7,
              onChanged: (value) => setState(() {
                user.extraInfo = value;
              }),
              decoration: InputDecoration(
                  fillColor: palette.grey,
                  hintText: 'profile info',
                  hintStyle: const TextStyle(color: Colors.black26)),
            )));
  }

  Widget editPhoneNumberWidget(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
            height: 50,
            child: TextField(
              onChanged: (value) => setState(() {
                user.phoneNumber = value;
              }),
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  fillColor: palette.grey,
                  hintText: 'phone number',
                  hintStyle: const TextStyle(color: Colors.black26)),
            )));
  }

  Widget editEmailWidget(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
            height: 50,
            child: TextField(
              onChanged: (value) => setState(() {
                user.email = value;
              }),
              decoration: InputDecoration(
                  fillColor: palette.grey,
                  hintText: 'blueishincolour@email.com',
                  hintStyle: const TextStyle(color: Colors.black26)),
            )));
  }
}
