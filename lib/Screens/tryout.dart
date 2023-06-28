import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  late final Box box;

  _addInfo() async {
    // Add info to people box
    box.put('name', 'John');
    box.put('country', 'Italy');
    debugPrint('info added succesfully');
  }

  _getInfo() {
    // Get info from people box
    var name = box.get('name');
    var country = box.get('country');
    debugPrint('info retrieved from box : $name ($country)');
  }

  _updateInfo() {
    // Update info of people box
    box.put('name', 'mike');
    box.put('country', 'UnitedStates');
    debugPrint('info has been updated to db');
  }

  _deleteInfo() {
    // Delete info from people box
    box.delete('name');
    box.delete('country');
    debugPrint('info deleeted as promised');
  }

  initDocs() async {
    WidgetsFlutterBinding.ensureInitialized();
    final appDocsDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocsDir.path);
  }

  @override
  void initState() {
    initDocs();
    super.initState();
    //gest reference to already opened box
    box = Hive.box('peopleBox');
  }

  @override
  void dispose() {
    //closes all hive boxes
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('People Info'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: _addInfo,
              child: Text('Add'),
            ),
            ElevatedButton(
              onPressed: _getInfo,
              child: Text('Get'),
            ),
            ElevatedButton(
              onPressed: _updateInfo,
              child: Text('Update'),
            ),
            ElevatedButton(
              onPressed: _deleteInfo,
              child: Text('Delete'),
            ),
          ],
        ),
      ),
    );
  }
}
