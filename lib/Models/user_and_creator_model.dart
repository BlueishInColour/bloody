import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'post_model.dart';

part 'user_and_creator_model.g.dart';

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

@HiveType(typeId: 0)
class User {
  User({
    this.userName = '',
    this.fullName = '',
    this.dateOfBirth = '',
    this.email = '',
    this.followers = const [],
    this.following = const [],
    this.phoneNumber = 0,
    this.posts = const [],
    this.sex = '',
    this.userProfilePix = '',
  });

  @HiveField(0)
  String userName;

  @HiveField(1)
  String fullName;

  @HiveField(2)
  String userProfilePix;

  @HiveField(3)
  String email;

  @HiveField(4)
  int phoneNumber;

  @HiveField(5)
  String dateOfBirth;

  @HiveField(6)
  String sex;

  @HiveField(7)
  List<Post> posts;

  @HiveField(8)
  List<User> followers;

  @HiveField(9)
  List<User> following;

  @override
  String toString() {
    return """"
username : $userName
fullname : $fullName
profilePix : $userProfilePix
followers : $followers
following : $following
""";
  }
}
