import 'package:flutter/material.dart';
import '../../main.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'search_category_screen.dart';

import '../Test/master.dart'; //for pull up refress place

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget searchbar(BuildContext context) {
      return AppBar(
        // forceMaterialTransparency: true,
        shadowColor: palette.black,
        elevation: 0,
        title: SearchBar(
          onTap: () => debugPrint('tapped'),
          //   backgroundColor: MaterialStatePropertyAll(palette.grey),
          hintText: 'explore',
          hintStyle: MaterialStatePropertyAll(TextStyle(
              fontStyle: FontStyle.italic, fontSize: 14, color: palette.black)),
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
              errorWidget: (context, url, error) => Container(
                height: 400,
                color: palette.amber,
                child: const Center(
                  child: Text('connect to internet'),
                ),
              ),
              placeholder: (context, url) => SizedBox(
                height: 400,
                child: Center(
                    child: CircleAvatar(
                        backgroundColor: palette.amber,
                        child: CircularProgressIndicator(
                          color: palette.white,
                        ))),
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
                    minimumSize: const MaterialStatePropertyAll(Size(100, 20)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                    padding: const MaterialStatePropertyAll(EdgeInsets.all(10)),
                    backgroundColor: MaterialStatePropertyAll(palette.grey),
                    foregroundColor:
                        const MaterialStatePropertyAll(Colors.black87)),
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
        floatingActionButton: CircleAvatar(
          radius: 30,
          backgroundColor: palette.white,
          child: IconButton(
              color: palette.black,
              padding: const EdgeInsets.all(0),
              onPressed: () => Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (context, _, __) => const Master())),
              icon: Stack(
                children: [
                  Icon(Icons.category_outlined, size: 40, color: palette.grey),
                  Positioned(
                      top: 0,
                      right: 0,
                      child: Icon(Icons.add, size: 17, color: palette.grey))
                ],
              )),
        ),
        body: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                  text: 'fashion x programmers',
                  image:
                      "https://source.unsplash.com/random/?programmers&width=500&height=1000"),
              tile(
                  onclick: () => Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (context, _, __) =>
                              const SearchCategoryScreen())),
                  text: 'fashion x engineer',
                  image:
                      "https://source.unsplash.com/random/?engineer&width=500&height=1000"),
              tile(
                  onclick: () => Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (context, _, __) =>
                              const SearchCategoryScreen())),
                  text: 'fashion x home',
                  image:
                      "https://source.unsplash.com/random/?home&width=500&height=1000"),
              tile(
                  onclick: () => Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (context, _, __) =>
                              const SearchCategoryScreen())),
                  text: 'fashion x party',
                  image:
                      "https://source.unsplash.com/random/?party&width=500&height=1000"),
              tile(
                  onclick: () => Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (context, _, __) =>
                              const SearchCategoryScreen())),
                  text: 'fashion x electronics',
                  image:
                      "https://source.unsplash.com/random/?electronics&width=500&height=1000"),
              tile(
                  onclick: () => Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (context, _, __) =>
                              const SearchCategoryScreen())),
                  text: 'fashion x wildlife',
                  image:
                      "https://source.unsplash.com/random/?wildlife&width=500&height=1000"),
              tile(
                  onclick: () => Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (context, _, __) =>
                              const SearchCategoryScreen())),
                  text: 'fashion x exortic',
                  image:
                      "https://source.unsplash.com/random/?exortic&width=500&height=1000"),
              tile(
                  onclick: () => Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (context, _, __) =>
                              const SearchCategoryScreen())),
                  text: 'fashion x streets',
                  image:
                      "https://source.unsplash.com/random/?streets&width=500&height=1000"),
              tile(
                  onclick: () => Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (context, _, __) =>
                              const SearchCategoryScreen())),
                  text: 'fashion x shoes',
                  image:
                      "https://source.unsplash.com/random/?shoes&width=500&height=1000"),
              tile(
                  onclick: () => Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (context, _, __) =>
                              const SearchCategoryScreen())),
                  text: 'fashion x babe',
                  image:
                      "https://source.unsplash.com/random/?girl&width=500&height=1000"),
              tile(
                  onclick: () => null,
                  text: 'add new category',
                  image:
                      "https://source.unsplash.com/random/?add&width=500&height=1000")
            ])));
  }
}
