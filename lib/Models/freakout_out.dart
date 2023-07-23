import 'package:upstash_redis/upstash_redis.dart';
import 'package:uuid/uuid.dart';

//freakout association which is a way relationship
///id of freakouter
///id of the person that is freakouted
///date of association
///
createfreakoutschema() async {
  final redis = Redis.fromEnv();
  print('connected');
  print(redis.json.set('freakout-association', $, {}));
}

freakout(String freakoutedBy, String freakoutingYou) async {
  final redis = await Redis.fromEnv();
  print('connected');
  print(redis.json.set('freakout-association', r'$.' '$freakoutedBy', {
    'id': Uuid.NAMESPACE_DNS,
    'freakouted_by': freakoutedBy,
    'freakouted_post': freakoutingYou,
    'data': {
      'freaked_as_at': DateTime.now().toString(),
    },
    'authority': null
  }));
}
