import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

///this is  a user model
///other data about followers , folllowing and their totals will come in the associate model
///
///
@JsonSerializable()
class User {
  String username; //this is the id
  String fullname;
  String typeOfUser;
  String extraInfo;
  String phoneNumber;
  String email;
  List<int> profilePicture;
  List<int> coverPicture;
  String dateOfBirth;
  DateTime createdAt = DateTime.now();
  User({
    this.username = '',
    this.coverPicture = const [],
    this.dateOfBirth = '',
    this.email = '',
    this.typeOfUser = '',
    this.extraInfo = '',
    this.phoneNumber = '',
    this.fullname = '',
    this.profilePicture = const [],
  });
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
