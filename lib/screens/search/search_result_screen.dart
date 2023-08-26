import 'package:flutter/material.dart';
import '../../main.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({super.key});

  @override
  State<SearchResultScreen> createState() => SearchResultScreenState();
}

class SearchResultScreenState extends State<SearchResultScreen> {
  String searchText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchbar(context),
      body: ListView(
          scrollDirection: Axis.vertical,
          addAutomaticKeepAlives: true,
          children: [
            userSearchResults(context),
            const Divider(),
            creatorSearchResults(context),
            const Divider(),
          ]), //searchb]ar(context),
    );
  }

  PreferredSizeWidget searchbar(BuildContext context) {
    return AppBar(
      // forceMaterialTransparency: true,
      shadowColor: palette.black,
      elevation: 0,
      title: SearchBar(
        onTap: () => debugPrint('tapped'),
        backgroundColor: MaterialStatePropertyAll(palette.lightPurple),
        hintText: 'explore',
        hintStyle: const MaterialStatePropertyAll(
            TextStyle(fontStyle: FontStyle.italic, fontSize: 14)),
        trailing: [
          IconButton.outlined(
              onPressed: null,
              icon: Icon(
                Icons.search,
                color: palette.white,
              )),
        ],
      ),
    );
  }

  Widget userSearchResults(BuildContext context) {
    return SizedBox(
      height: 130,
      width: 130,
      //  color: palette.white,
      child: (ListView.builder(
          scrollDirection: Axis.horizontal,

          // ignore: avoid_types_as_parameter_names
          itemBuilder: (context, int) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: palette.white,
                        )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: palette.lightPurple,
                        ),
                        Text('fulname', style: TextStyle(color: palette.white)),
                        ConstrainedBox(
                            // fit: BoxFit.scaleDown,
                            constraints: const BoxConstraints(maxWidth: 100),
                            child: Text('username',
                                style: TextStyle(color: palette.white)))
                      ]),
                    )),
              ))),
    );
  }
}

Widget creatorSearchResults(BuildContext context) {
  return SizedBox(
    height: 130,
    width: 130,
    //  color: palette.white,
    child: (ListView.builder(
        scrollDirection: Axis.horizontal,

        // ignore: avoid_types_as_parameter_names
        itemBuilder: (context, int) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: palette.white,
                      )),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: palette.lightPurple,
                      ),
                      Text('brandname', style: TextStyle(color: palette.white)),
                      ConstrainedBox(
                          // fit: BoxFit.scaleDown,
                          constraints: const BoxConstraints(maxWidth: 100),
                          child: Text('username',
                              style: TextStyle(color: palette.white)))
                    ]),
                  )),
            ))),
  );
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: BeveledRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          side: BorderSide(color: palette.white)),
      leading: CircleAvatar(
        radius: 40,
        backgroundColor: palette.black,
      ),
    );
  }
}

Widget boxes(BuildContext context, int int) {
  return (Container(
    height: 50,
    width: 30,
    color: palette.lightPurple,
  ));
}
