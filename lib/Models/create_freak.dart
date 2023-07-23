import 'package:upstash_redis/upstash_redis.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

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
///
///fb model
///
////id: int //unique id of object
////objecttype: string //usermodel,postmodel,
////data: byte
////

Future createfreak(String username) async {
  print('connecting');
  final redis = Redis.fromEnv();
  print('connected');

  print(redis.json.set('freaks', r'$' '.$username', {
    username: {
      'id': username,
      'objecttype': '@' 'freaks_profile',
      'data': {
        'user_name': username, //id
        'full_name': 'name',

        'user_profile_pix':
            Image.asset('assets/images/pexel.jpg').toStringDeep(),
        'email': '',
        'phone_number': '',
        'date_of_birth': 'okayoooooooooooo',
        'sex': '',
        'type_of_user': '',
        'followers': <List<String>>[],
        'following': <List<String>>[]
      }
    }
  }));

  print('done??????????????????');
  print(redis.json.get('freaks', [r'$' '.$username']));
}

Future createSchema() async {
  print('connecting');
  final redis = Redis.fromEnv();
  print('connected');

  print(redis.json.set('freaks', $, {
    'FreakIn': {
      'id': '',
      'objecttype': '',
      'data': {
        'user_name': '', //id
        'full_name': '',

        'user_profile_pix': '',
        'email': '',
        'phone_number': '',
        'date_of_birth': '',
        'sex': '',
        'type_of_user': '',
        'followers': <List<String>>[],
        'following': <List<String>>[]
      }
    }
  }));

  print('done??????????????????');
}

printSomething() async {
  print(Image.asset('assets/images/pexel.jpg').toStringDeep());
}
