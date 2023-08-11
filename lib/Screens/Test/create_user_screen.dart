import 'package:flutter/material.dart';
import '../../Apis/cosmosdb.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({super.key});

  @override
  State<CreateUser> createState() => CreateuserState();
}

class CreateuserState extends State<CreateUser> {
  String id = '';
  String name = '';
  String email = '';
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: Center(
          child: Container(
        height: 400,
        width: 300,
        color: Colors.blueAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextField(
              decoration: InputDecoration(hintText: 'id'),
              onChanged: (v) {
                setState(() {
                  id = v;
                });
                print(v);
              },
            ),
            TextField(
              decoration: InputDecoration(hintText: 'name'),
              onChanged: (v) {
                setState(() {
                  name = v;
                });
                print(v);
              },
            ),
            TextField(
              decoration: InputDecoration(hintText: 'email'),
              onChanged: (v) {
                setState(() {
                  email = v;
                });
                print(v);
              },
            ),
            TextButton(
                onPressed: () => null
                //createDocument(email: email, documentId: id, {name: name}),
                ,
                child: Text('create this user')),
            BackButton()
          ],
        ),
      )),
    ));
  }
}
