import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

import 'user_and_creator_model.dart';

part 'post_model.g.dart';

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
@HiveType(typeId: 0)
class Post {
  Post(
      {this.postId = const Uuid(),
      required this.createdAt,
      required this.creator,
      this.extraInformation = '',
      this.noOfFreaks = 0,
      this.noOfPullRequest = 0,
      this.noOfPushRequest = 0,
      this.noOfShares = 0,
      this.postedPix = '',
      required this.user});

  @HiveField(0)
  Uuid postId;

  @HiveField(1)
  String postedPix;

  @HiveField(2)
  String extraInformation;

  @HiveField(3)
  DateTime createdAt;

  @HiveField(4)
  int noOfFreaks;

  @HiveField(5)
  int noOfShares;

  @HiveField(6)
  int noOfPullRequest;

  @HiveField(7)
  int noOfPushRequest;

  @HiveField(8)
  User user;

  @HiveField(9)
  User creator;

  @override
  String toString() {
    return """creator: $creator
              created at: $createdAt
              user: $user""";
  }
}
