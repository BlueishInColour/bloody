import 'package:flutter/material.dart';
import '../main.dart';
import 'package:cached_network_image/cached_network_image.dart';
import './search_category_screen.dart';

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
          backgroundColor: MaterialStatePropertyAll(palette.grey),
          hintText: 'explore',
          hintStyle: const MaterialStatePropertyAll(TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 14,
              color: Colors.black87)),
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
      return Stack(
        children: [
          GestureDetector(
            onTap: onclick,
            child: CachedNetworkImage(
              placeholder: (context, url) => const SizedBox(
                height: 400,
                child: Center(
                    child:
                        const CircleAvatar(child: CircularProgressIndicator())),
              ),
              imageUrl: image,
              height: 400,
              // width: 100,
              // color: Colors.blueGrey,
              // progressIndicatorBuilder: (context, _, __) =>
              //     CircleAvatar(child: CircularProgressIndicator.adaptive()),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 5,
            left: 3,
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
        ],
      );
    }

    return (Scaffold(
      appBar: searchbar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 3),
        child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 300,
                childAspectRatio: 1,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0),
            children: [
              tile(
                  onclick: () => Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (context, _, __) =>
                              const SearchCategoryScreen())),
                  text: 'fashion x sport',
                  image:
                      "https://source.unsplash.com/random/?sport&width=500&height=1000"),
              tile(
                  onclick: () => Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (context, _, __) =>
                              const SearchCategoryScreen())),
                  text: 'fashion x art',
                  image:
                      "https://source.unsplash.com/random/?art&width=500&height=1000"),
              tile(
                  onclick: () => Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (context, _, __) =>
                              const SearchCategoryScreen())),
                  text: 'fashion x cars',
                  image:
                      "https://source.unsplash.com/random/?cars&width=500&height=1000"),
              tile(
                  onclick: () => Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (context, _, __) =>
                              const SearchCategoryScreen())),
                  text: 'fashion x office',
                  image:
                      "https://source.unsplash.com/random/?businessman&width=500&height=1000"),
              tile(
                  onclick: () => Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (context, _, __) =>
                              const SearchCategoryScreen())),
                  text: 'fashion x music',
                  image:
                      "https://source.unsplash.com/random/?music&width=500&height=1000"),
              tile(
                  onclick: () => Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (context, _, __) =>
                              const SearchCategoryScreen())),
                  text: 'fashion x culture',
                  image:
                      "https://source.unsplash.com/random/?culture&width=500&height=1000"),
              tile(
                  onclick: () => Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (context, _, __) =>
                              const SearchCategoryScreen())),
                  text: 'fashion x boo',
                  image:
                      "https://source.unsplash.com/random/?guy&width=500&height=1000"),
              tile(
                  onclick: () => Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (context, _, __) =>
                              const SearchCategoryScreen())),
                  text: 'fashion x babe',
                  image:
                      "https://source.unsplash.com/random/?girl&width=500&height=1000"),
            ]),
      ),
    ));
  }
}
