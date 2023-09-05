import 'package:flutter/material.dart';
import './a_nugget.dart';
import './floating_button.dart';
import '../../main.dart';
import '../../models/nugget_model.dart';
import '../../apis/deta_a.dart';

class NuggetScreen extends StatefulWidget {
  const NuggetScreen({super.key});

  @override
  State<NuggetScreen> createState() => NuggetScreenState();
}

class NuggetScreenState extends State<NuggetScreen>
    with AutomaticKeepAliveClientMixin {
  List<Nugget> gottenNuggets = [];
  get20nuggets() async {
    print('trying to get stuff out');
    Map<String, dynamic> res = await nuggetApi.fetch(limit: 20);
    print(res);
    List nuggets = (res['items']);
    print('this is nuggets');
    print(nuggets);
    nuggets.map((e) {
      setState(() {
        gottenNuggets.add(Nugget.fromJson(e));
      });
    }).toList();

    print('gottenNuggets ');
    print(gottenNuggets.toString());
  }

  @override
  initState() {
    super.initState();
    get20nuggets();
  }

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    PreferredSizeWidget nuggetAppBar(context) {
      return AppBar(
        title: Text('nuggets',
            style: TextStyle(
              color: palette.amber,
            )),
      );
    }

    return (Scaffold(
        appBar: nuggetAppBar(context),
        floatingActionButton: const FloatingButton(),
        body: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              (scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent - 10)
                  ? get20nuggets()
                  : null;

              return true;
            },
            child: LoadOrPresent(
              isEmpty: gottenNuggets.isEmpty,
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return (const Divider());
                },
                itemCount: gottenNuggets.length,
                itemBuilder: (context, index) =>
                    ANugget(gottenNuggets: gottenNuggets, index: index),
              ),
            ))));
  }
}
