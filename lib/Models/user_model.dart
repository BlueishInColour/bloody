import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  final String fullname;
  final String username;
  final double age;
  final String email;
  final int phoneNumber;
  final List<int> profilePix;
  final List<int> coverPix;
  final String extra_info;
  final int noOfFollowing;
  final int noOfFollowers;
  final String dateOfBirth;
  final String sex;
  final String typeOfUser;

  User({
    required this.age,
    required this.coverPix,
    required this.extra_info,
    required this.fullname,
    required this.profilePix,
    required this.dateOfBirth,
    required this.email,
    required this.noOfFollowers,
    required this.noOfFollowing,
    required this.phoneNumber,
    required this.sex,
    required this.typeOfUser,
    required this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> tojson() => _$UserToJson(this);
}
