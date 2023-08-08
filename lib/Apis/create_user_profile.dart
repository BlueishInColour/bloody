import 'package:upstash_redis/upstash_redis.dart';
import 'package:firedart/firedart.dart';
import '../Models/user_model.dart';

createUser(User user) async {
  Firestore.initialized == false
      ? {Firestore.initialize('adroit-sol-385215')}
      : null;
  print('connecting');
  print(Firestore.initialized);
  print('connected');
  var map = await Firestore.instance.collection('post').add(user.tojson());
  print(map);
  print('object successfully posted');
  return map;
}
