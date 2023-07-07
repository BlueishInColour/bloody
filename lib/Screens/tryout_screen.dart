import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../provider.dart';

class TryOutScreen extends HookConsumerWidget {
  var db = MySql();

  Future addEmail(String name, String email) async {
    print('about to add object');
    try {
      var conn = await db.getConnection();
      conn.query(
          'CREATE TABLE users(id int NOT NULL AUTO_INCREMENT PRIMARY KEY, name varchar(255), email varchar(255) )');

      conn.query('INSERT INTO user(name,email) VALUES (?,?,?) ', [name, email]);
      print('$name ::::: $email');
    } catch (e) {
      print('an error occurred of type $e');
    }
  }

  TryOutScreen({
    super.key,
  });
  var text = '';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //  List<Email> emails = ref.watch(emailProvider).``;

    return (Scaffold(
        appBar: AppBar(title: const Text('trying a db out'), actions: const [
///////////  / ///   GET
          IconButton(
              onPressed: null, icon: Icon(Icons.refresh, color: Colors.blue)),
        ]),
        body: ProviderScope(child: bodyApp(context, ref))));
  }

  Widget bodyApp(BuildContext context, WidgetRef ref) {
    // final here = ref.read(emailProvider);
    // var book = context.watch<EmailModel>();
    return (Container(
      child: ListView(children: [
        TextField(
          controller: TextEditingController(text: text),
          decoration: InputDecoration(
              fillColor: Colors.grey,
              suffixIcon: TextButton(
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.blueGrey)),
///////////////////////              //PUT
                  onPressed: () {
                    addEmail('oluwapelumi', 'this is my email');
                    debugPrint('successful');
                  },
                  child: const Text('submit'))),
        ),
        const SizedBox(height: 30),
        //  Text('nioweoknppoepopepojpoepopoeioe'),
        const Divider(),

        Container(
          height: 500,
          color: Colors.blueAccent,
          child: ListView.builder(
              // itemCount: ref.read(emailProvider).allEmails.length,
              itemBuilder: (BuildContext context, int index) {
            return Container(
              color: Colors.lightBlueAccent,
              child: (Row(
                children: [
                  const Expanded(child: Text('book')),
                  ////////              //UPDATE

                  const IconButton(onPressed: null, icon: Icon(Icons.edit)),

                  ////////               //DELETE

                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.delete, color: Colors.red))
                ],
              )),
            );
          }),
        )
      ]),
    ));
  }
}
