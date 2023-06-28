import 'package:flutter/material.dart';
import '../../main.dart';

class Generic extends StatefulWidget {
  const Generic({super.key});

  @override
  State<Generic> createState() => GenericState();
}

class GenericState extends State<Generic> {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
          title: Text(
            'take generic measurement',
            style: TextStyle(
              color: palette.black,
              fontSize: 15,
            ),
          ),
        ),
        bottomNavigationBar:
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          TextButton(
            onPressed: null,
            style: ButtonStyle(
              padding: const MaterialStatePropertyAll(EdgeInsets.all(15)),
              backgroundColor: MaterialStatePropertyAll(palette.purple),
            ),
            child: Text('done', style: TextStyle(color: palette.black)),
          )
        ]),
        body: Column(
          children: [
            const Text('upper body / top'),
            const SizedBox(height: 20),
            upperbody(context),
            const Text('lower body / trouser'),
            lowerbody(context)
          ],
        )));
  }

  Widget textfield(BuildContext context, String hinttext) {
    return (SizedBox(
        width: 120,
        height: 50,
        child: TextField(
          decoration: InputDecoration(hintText: hinttext),
        )));
  }

  Widget upperbody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        (Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          textfield(context, 'length'),
          textfield(context, 'roundbody/bust'),
          textfield(context, 'shoulder/back length')
        ])),
        const SizedBox(height: 20),
        (Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          textfield(context, 'short sleeve'),
          textfield(context, 'long sleeve'),
          textfield(context, 'round neck')
        ])),
        const SizedBox(height: 20),
        (Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          textfield(context, 'round bicep'),
          textfield(context, 'round ankle'),
          textfield(context, 'round wrist')
        ])),
        const SizedBox(height: 40),
      ],
    );
  }

  Widget lowerbody(BuildContext context) {
    return (Column(
      children: [
        const SizedBox(height: 20),
        (Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          textfield(context, 'length'),
          textfield(context, 'thigh'),
          textfield(context, 'down/mouth')
        ])),
        const SizedBox(height: 20),
        (Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          textfield(context, 'to knee'),
          textfield(context, 'round knee'),
          textfield(context, 'waistline')
        ])),
      ],
    ));
  }
}
