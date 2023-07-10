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
      body: ListView.separated(
        itemBuilder: boxes,
        separatorBuilder: (context, index) => SizedBox(
          height: 4,
          width: 4,
        ),
        itemCount: 20,
      ), //searchbar(context),
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
}

Widget boxes(BuildContext context, int int) {
  return (Container(
    height: 50,
    width: 30,
    color: palette.lightPurple,
  ));
}
