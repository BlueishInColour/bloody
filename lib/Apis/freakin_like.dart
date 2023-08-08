import 'package:upstash_redis/upstash_redis.dart';
import 'package:uuid/uuid.dart';

import 'connect.dart';

//freakin association which is a way relationship
///id of freakiner
///id of the person that is freakined
///date of association
///
createfreakinschema() async {
  print('connected');
  print(redis.json.set('freakin-association', $, {}));
}

freakin(String freakinedBy, String freakiningYou) async {
  print('connected');
  print(redis.json.set('freakin-association', r'$.' '$freakinedBy', {
    'id': Uuid.NAMESPACE_DNS,
    'freakined_by': freakinedBy,
    'freakined_post': freakiningYou,
    'data': {
      'freaked_as_at': DateTime.now().toString(),
    },
    'authority': null
  }));
}
