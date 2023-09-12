import 'package:flutter/material.dart';
import '../../main.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'search_category_screen.dart';
import './floating_button.dart';
import '../Test/master.dart'; //for pull up refress place
import '../../models/category_model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../apis/deta_a.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen>
    with AutomaticKeepAliveClientMixin {
  List<Category> gottenCategory = [];

  get20categories() async {
    print('trying to get stuff out');
    Map<String, dynamic> res = await tagApi.fetch(limit: 20);
    print(res);
    List posts = (res['items']);
    print('this is posts');
    print(posts);
    posts.map((e) {
      setState(() {
        gottenCategory.add(Category.fromJson(e));
      });
    }).toList();

    print('gottenposts');
    print(gottenCategory.toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get20categories();
  }

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
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
        floatingActionButton: const SearchFloatingButton(),
        body: LoadOrPresent(
            isEmpty: gottenCategory.isEmpty,
            child: MasonryGridView.builder(
              itemCount: gottenCategory.length,
              gridDelegate:
                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: palette.amber,
                      child: CachedNetworkImage(
                          errorWidget: (context, _, __) {
                            return Container(height: 70, color: Colors.red);
                          },
                          placeholder: (context, _) {
                            return Container(
                                height: 70, color: Colors.yellowAccent);
                          },
                          imageUrl: gottenCategory[index].categoryPhotoUrl),
                    ));
              },
            ))));
  }
}
