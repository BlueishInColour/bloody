// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      age: (json['age'] as num).toDouble(),
      coverPix:
          (json['coverPix'] as List<dynamic>).map((e) => e as int).toList(),
      extra_info: json['extra_info'] as String,
      fullname: json['fullname'] as String,
      profilePix:
          (json['profilePix'] as List<dynamic>).map((e) => e as int).toList(),
      dateOfBirth: json['dateOfBirth'] as String,
      email: json['email'] as String,
      noOfFollowers: json['noOfFollowers'] as int,
      noOfFollowing: json['noOfFollowing'] as int,
      phoneNumber: json['phoneNumber'] as int,
      sex: json['sex'] as String,
      typeOfUser: json['typeOfUser'] as String,
      username: json['username'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'fullname': instance.fullname,
      'username': instance.username,
      'age': instance.age,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'profilePix': instance.profilePix,
      'coverPix': instance.coverPix,
      'extra_info': instance.extra_info,
      'noOfFollowing': instance.noOfFollowing,
      'noOfFollowers': instance.noOfFollowers,
      'dateOfBirth': instance.dateOfBirth,
      'sex': instance.sex,
      'typeOfUser': instance.typeOfUser,
    };
