//for my sql
import 'dart:async';
import 'package:mysql1/mysql1.dart';

class MySql {
  static String host = 'localhost',
      user = 'root',
      db = 'trydb',
      password = 'secret';
  static int port = 8000;

  MySql();

  Future<MySqlConnection> getConnection() async {
    var settings = ConnectionSettings(
      host: host,
      port: port,
      user: user,
      db: db,
      password: password,
    );

    var conn = await MySqlConnection.connect(settings);

    return conn;
  }

  Future<String> getAllEmail() async {
    print('about to get object');
    try {
      var conn = await getConnection();
      var result = await conn.query('Select * from user');
      return result.toString();
    } catch (e) {
      print('an error ocurred of type $e');
    } finally {
      return ('o kay');
    }
  }
}
