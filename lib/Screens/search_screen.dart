import 'package:flutter/material.dart';
import '../Widgets/explore_screen_widgets/app_bar.dart';
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
    return Scaffold(appBar: searchbar(context) //searchbar(context),
        );
  }

  PreferredSizeWidget searchbar(BuildContext context) {
    return AppBar(
      // forceMaterialTransparency: true,
      shadowColor: palette.white,
      elevation: 0,
      title: SearchBar(
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
