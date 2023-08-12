import 'package:flutter/material.dart';
import '../main.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  Widget build(BuildContext context) {
    PreferredSizeWidget searchbar(BuildContext context) {
      return AppBar(
        // forceMaterialTransparency: true,
        shadowColor: palette.white,
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
                  color: palette.black,
                )),
          ],
        ),
      );
    }

    tile(
        {String text = 'explore fashion',
        String image =
            "https://source.unsplash.com/random/?art&width=500&height=1000",
        required Function() onclick}) {
      return GridTile(
        header: Expanded(
          child: ElevatedButton(
              style: ButtonStyle(
                  minimumSize: MaterialStatePropertyAll(Size(100, 20)),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
                  padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
                  backgroundColor: MaterialStatePropertyAll(palette.grey),
                  foregroundColor: MaterialStatePropertyAll(Colors.black87)),
              onPressed: onclick,
              child: Text(
                text,
              )),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(0),
          child: GestureDetector(
            onTap: onclick,
            child: FadeInImage.assetNetwork(
              height: 50,
              fit: BoxFit.cover,
              placeholder: 'assets/images/placeholder.png',
              placeholderFit: BoxFit.cover,
              imageErrorBuilder: (context, error, stackTrace) => Container(
                // height: 20,
                color: Colors.blueGrey,
              ),
              image: image,
            ),
          ),
        ),
      );
    }

    return (Scaffold(
      appBar: searchbar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 3),
        child: GridView(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150,
                childAspectRatio: 1,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0),
            children: [
              tile(onclick: () => debugPrint('clicked bro')),
              tile(onclick: () => debugPrint('clicked bro')),
              tile(onclick: () => debugPrint('clicked bro')),
              tile(onclick: () => debugPrint('clicked bro')),
              tile(onclick: () => debugPrint('clicked bro')),
              tile(onclick: () => debugPrint('clicked bro')),
              tile(onclick: () => debugPrint('clicked bro')),
              tile(onclick: () => debugPrint('clicked bro')),
            ]),
      ),
    ));
  }
}
