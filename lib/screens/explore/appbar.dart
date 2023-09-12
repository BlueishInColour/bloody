import 'package:flutter/material.dart';
import '../../main.dart';
import 'login_signup_button.dart';
import '../../apis/deta_a.dart';

class ExploreScreenAppBar extends StatefulWidget {
  const ExploreScreenAppBar({super.key});
  @override
  State<ExploreScreenAppBar> createState() => ExploreScreenAppBarState();
}

class ExploreScreenAppBarState extends State<ExploreScreenAppBar> {
  bool iconClicked = false;

  appbar(context) {}

  @override
  build(BuildContext context) {
    return AppBar(
      backgroundColor: palette.white,
      toolbarHeight: iconClicked ? 200 : null,
      // toolbarHeight: 40,

      title: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      iconClicked = !iconClicked;
                    });
                  },
                  child: Text.rich(TextSpan(children: [
                    TextSpan(
                        text: '&',
                        style: TextStyle(
                            color: palette.amber,
                            fontSize: 35,
                            fontFamily: 'Geologica_Cursive-Bold')),
                  ])),
                ),
              ),
              const LoginOrSignup()
            ],
          ),
          iconClicked ? SizedBox(height: 150) : SizedBox()
        ],
      ),
    );
  }
}

class SelectInterest extends StatelessWidget {
  const SelectInterest({super.key});
  get20More() async {
    print('about to get stuff');
    var res = await tagApi.fetch(limit: 30);
    print(res);
  }

  uploadInterests() async {
    print('about to upload');
    var res = await tagApi.put('');
    print(res);
  }

  void initState() {
    get20More();
  }

  @override
  Widget build(BuildContext context) {
    List<String> checkedInterest = [];

    ///lists for
    ///categories
    ///subcategories
    ///hashtags
    ///topics
    Widget oneScroll(context) {
      return SizedBox(
        height: 70,
        child: NotificationListener(
          onNotification: (ScrollNotification scrollinfo) {
            scrollinfo.metrics.pixels ==
                    scrollinfo.metrics.maxScrollExtent - 100
                ? get20More()
                : null;
            return true;
          },
          child: ListView.builder(
            itemBuilder: (context, index) {
              return const OneInterest();
            },
            itemCount: 100,
            scrollDirection: Axis.horizontal,
          ),
        ),
      );
    }

    return SizedBox(
        height: 400,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Divider(),
          Text('hey,what fashions you in fashion?!',
              style: TextStyle(fontSize: 20, color: palette.textColorLight)),
          Text('youll get more content from what you pick here.',
              style: TextStyle(fontSize: 10, color: palette.textColorLight)),
          const Divider(),
          SizedBox(
            height: 250,
            child: ListView(
                //scrollDirection: Axis.horizontal,
                children: [
                  oneScroll(context),
                  oneScroll(context),
                  oneScroll(context),
                  oneScroll(context),
                ]),
          ),
          Expanded(child: SizedBox()),
          Row(children: [
            Expanded(child: SizedBox()),
            ElevatedButton(
                onPressed: () {
                  uploadInterests();
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('done'),
                ))
          ])
        ]));
  }
}

class OneInterest extends StatefulWidget {
  const OneInterest({super.key, this.text = 'agbada'});
  final String text;
  @override
  State<OneInterest> createState() => OneInterestState();
}

class OneInterestState extends State<OneInterest> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 150,
        child: CheckboxListTile(
          onChanged: (value) {
            true;
            setState(() {
              checked = !checked;
            });
          },
          value: true,
          title: Text(widget.text),
          tileColor: checked ? palette.amber : Colors.blue, //when inactive
          // selectedTileColor: palette.amber,

          activeColor: palette.black,
          checkColor: checked ? palette.amber : Colors.blue,

          selected: false,
          enabled: true,
          side: BorderSide(color: palette.black, width: 10),

          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(20)),
          checkboxShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }
}
