import 'package:upstash_redis/upstash_redis.dart';
import 'package:uuid/uuid.dart';
import 'connect.dart';

//for association schema
//id1: int //source id eg from post id
//id2: int //desinamtion id
//associationtype : string  // freakedout,comment,share,
//data: byte //shareto,shareby,sharefrom
//
//example
//634|224|comment|{'text':'that was a nice pix'}
//

createCommentFreakonSchema() async {
  var res = redis.json.set('comments', $, {});
}

commentFreakon() async {
  var res = redis.json.set('comments', r'$', {
    'comment_id': Uuid.NAMESPACE_DNS,
    'comment_by': '',
    'comment_for': '', //post_id
    'data': {
      'created_at': DateTime.now().toString(),
      'comment_text': '',
      'comment_pics': '',
    }
  });
  print(res);
  return res;
}
