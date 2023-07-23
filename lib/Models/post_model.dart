import 'package:upstash_redis/upstash_redis.dart';

import 'create_freak.dart';

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

createPostSchema() {
  print('connecting');
  var redis = Redis.fromEnv();
  print('connected');

  print(redis.json.set('post', $, {}));
}

createPost() {
  print('connecting');
  var redis = Redis.fromEnv();
  print('connected');

  print(redis.json.set('post', r'$' '.', {}));
}
