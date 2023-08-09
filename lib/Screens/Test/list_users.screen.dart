import 'package:flutter/material.dart';
import '../../Models/cosmsosdb.dart';
import '../../main.dart';

class List extends StatefulWidget {
  const List({super.key});

  @override
  State<List> createState() => ListUsers();
}

class ListUsers extends State<List> {
  // const ListUsers({super.key});
  String id = '';
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: Column(
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
          textbuilder(),
          BackButton()
        ],
      ),
    ));
  }

  textbuilder() {
    return FutureBuilder(
      builder: (ctx, snapshot) {
        // Checking if future is resolved or not
        if (snapshot.connectionState == ConnectionState.done) {
          // If we got an error
          if (snapshot.hasError) {
            return Center(
              child: Text(
                '${snapshot.error} occurred',
                style: TextStyle(fontSize: 18),
              ),
            );

            // if we got our data
          } else if (snapshot.hasData) {
            // Extracting data from snapshot object
            final data = snapshot.data.toString();
            return Center(child: Text(data));
          }
        }

        // Displaying LoadingSpinner to indicate waiting state
        return Center(
          child: CircularProgressIndicator(
            color: palette.lightPurple,
            // backgroundColor: palette.black,
            semanticsLabel: 'shoveling some coal in',
          ),
        );
      },

      // Future that needs to be resolved
      // inorder to display something on the Canvas
      future: getDocument(id),
    );
  }
}
