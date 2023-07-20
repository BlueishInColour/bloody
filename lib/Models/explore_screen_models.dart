import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mysql_client/mysql_client.dart';

//building the data model and fetch,insert and ert and update model for this screen
///(userModel)
///user_id
///full_name
///user_name
///user_profile_pix
///
///email
///phone_number
///date_of_birth
///sex(male/female)
///
///posts=<posts_id>[]
///followers=<user_id/creator_id>[]
///following=<user_id/creator_id>[]
///
///type_of_user = varcharr
///
///
///(PostModel)
///post_id = id
///posted_pix = []
///extra_text_informtion = varcharr
///date_of_pushing = datetime
///no_of_shares = int
///no_of_freaks = int
///
///no_of-pull_request = int
///no_of_push_requests = int
///user(full_name,user_name,user_profile_pix)
///creator(brand_name, profilepix,design_name)
///
///
///(creatorModel)
///creator_id = id
///brand_name = varcharr(225)
///brand_profile_pix = url
///
///followers = <user_id/brand_id>[]
///following = <user_id/brand_id>[]
///
///
///a user or creator will need thier own table of
/// followers it own data groubes in all_users table
/// following it own data groubes in all_users table
/// posts

final conn = MySQLConnection.createConnection(
  host: "127.0.0.1",
  port: 3306,
  userName: "root",
  password: "oluwa", // optional
);

Future createDatabaseAndTable() async {
  print("Connecting to mysql server...");

  // create connection
  final conn = await MySQLConnection.createConnection(
    host: "127.0.0.1",
    port: 3306,
    userName: "root",
    password: "oluwa", // optional
  );

  await conn.connect();

//after connected
  print("Connected");

  var res1 = await conn.execute('CREATE DATABASE baseDB ');
  print('res1 : $res1');

  var res2 = await conn.execute("""CREATE TABLE baseDB.all_users(
 index_number IDENTITY(1,1) PRIMARY KEY,
  full_name VARCHAR(225),
  user_name VARCHAR(225) PRIMARY KEY,
  user_profile_pix  VARCHAR(225) ,
  email VARCHAR(225),
  phone_number int,
  date_of_birth DATETIME,
  sex VARCHAR(1),
  type_of_user VARCHAR(225),

)""");
  print('res2 : $res2');

  var res3 = await conn.execute("""
CREATE TABLE baseDb.allcreators(
  creator_id IDENTITY(1,1) PRIMARY KEY,
  brand_name = VARCHAR(225),
  brand_profile_pix = VARCHAR(225),

)
""");
  print('res3 : $res3');
}

Future createUser(
    {String full_name = '',
    String user_name = '',
    String user_profile_pix = '',
    String email = '',
    String phone_number = '',
    String date_of_birth = '',
    String sex = '',
    String type_of_user = ''}) async {
  print("Connecting to mysql server...");

  // create connection
  final conn = await MySQLConnection.createConnection(
    host: "127.0.0.1",
    port: 3306,
    userName: "root",
    password: "oluwa", // optional
  );

  await conn.connect();

//after connected
  print("Connected");

  //insert user into list of all users
  var res1 = await conn.execute(
    """
INSERT INTO 
baseDB.all_users(full_name,user_name,user_profile_pix,email,phone_number,date_of_birth,sex,type_of_user)
VALUES(:full_name,:user_name,:user_profile_pix,:email,:phone_number,:date_of_birth,:sex,:type_of_user)
""",
    {
      'full_name': full_name,
      'user_name': user_name,
      'email': email,
      'phone_number': phone_number,
      'date_of_birth': date_of_birth,
      'sex': sex,
      'type_of_user': type_of_user,
    },
  );
  print(res1);

//create user database
  var res2 = await conn.execute("""CREATE DATABASE $user_name """);
  print(res2);

//create followers data table
  var res3 = await conn.execute("""CREATE TABLE $user_name.followers(
index_number IDENTITY(1,1) ,
user_name VARCHAR(225),
full_name VARCHAR(225),
followed_from DATETIME,
)""");

  print(res3);

//create following data table
  var res4 = await conn.execute(""" CREATE TABLE $user_name.following(
  index_number IDENTITY(1,1) ,
user_name VARCHAR(225),
full_name VARCHAR(225),
followed_from DATETIME,
)""");

  print(res4);

//close connection
  conn.close();
}

////
