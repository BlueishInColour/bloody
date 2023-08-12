// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      username: json['username'] as String? ?? '',
      coverPicture: (json['coverPicture'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          const [],
      dateOfBirth: json['dateOfBirth'] as String? ?? '',
      email: json['email'] as String? ?? '',
      extraInfo: json['extraInfo'] as String? ?? '',
      phoneNumber: json['phoneNumber'] as String? ?? '',
      fullname: json['fullname'] as String? ?? '',
      profilePicture: (json['profilePicture'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          const [],
    )..createdAt = DateTime.parse(json['createdAt'] as String);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'username': instance.username,
      'fullname': instance.fullname,
      'extraInfo': instance.extraInfo,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'profilePicture': instance.profilePicture,
      'coverPicture': instance.coverPicture,
      'dateOfBirth': instance.dateOfBirth,
      'createdAt': instance.createdAt.toIso8601String(),
    };
