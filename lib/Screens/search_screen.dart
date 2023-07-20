import 'package:flutter/material.dart';
import '../main.dart';

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
            UserSearchResults(context),
            Divider(),
            CreatorSearchResults(context),
            Divider(),
          ]), //searchb]ar(context),
    );
  }

  PreferredSizeWidget searchbar(BuildContext context) {
    return AppBar(
      // forceMaterialTransparency: true,
      shadowColor: palette.white,
      elevation: 0,
      title: SearchBar(
        onTap: () => debugPrint('tapped'),
        backgroundColor: MaterialStatePropertyAll(palette.lightPurple),
        hintText:
            'search for styles, fabrics, designers, brands, artists and more',
        hintStyle: const MaterialStatePropertyAll(
            TextStyle(fontStyle: FontStyle.italic, fontSize: 14)),
        trailing: [
          IconButton.outlined(
              onPressed: null,
              icon: Icon(
                Icons.search,
                color: palette.black,
              )),
        ],
      ),
    );
  }

  Widget UserSearchResults(BuildContext context) {
    return Container(
      height: 130,
      width: 130,
      //  color: palette.black,
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
                          color: palette.black,
                        )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: palette.lightPurple,
                        ),
                        Text('fulname', style: TextStyle(color: palette.black)),
                        ConstrainedBox(
                            // fit: BoxFit.scaleDown,
                            constraints: BoxConstraints(maxWidth: 100),
                            child: Text('username',
                                style: TextStyle(color: palette.black)))
                      ]),
                    )),
              ))),
    );
  }
}

Widget CreatorSearchResults(BuildContext context) {
  return Container(
    height: 130,
    width: 130,
    //  color: palette.black,
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
                        color: palette.black,
                      )),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: palette.lightPurple,
                      ),
                      Text('brandname', style: TextStyle(color: palette.black)),
                      ConstrainedBox(
                          // fit: BoxFit.scaleDown,
                          constraints: BoxConstraints(maxWidth: 100),
                          child: Text('username',
                              style: TextStyle(color: palette.black)))
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
          borderRadius: BorderRadius.all(Radius.circular(5)),
          side: BorderSide(color: palette.black)),
      leading: CircleAvatar(
        radius: 40,
        backgroundColor: palette.white,
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
