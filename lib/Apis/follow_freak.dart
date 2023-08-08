import 'package:upstash_redis/upstash_redis.dart';
import 'package:uuid/uuid.dart';

import 'connect.dart';

//follow association which is a way relationship
///id of follower
///id of the person that is followed
///date of association
///
createFollowschema() async {
  print('connected');
  print(redis.json.set('follow-association', $, {}));
}

follow(String followedBy, String followingYou) async {
  print('connected');
  print(redis.json.set('follow-association', r'$.' '$followedBy', {
    'id': Uuid.NAMESPACE_DNS,
    'followed_by': followedBy,
    'following_you': followingYou,
    'data': {
      'followed_as_at': DateTime.now().toString(),
    },
    'authority': null
  }));
}
