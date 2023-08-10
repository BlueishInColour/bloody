// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      id: json['id'] as String? ?? '',
      text: json['text'] as String? ?? '',
      photos:
          (json['photos'] as List<dynamic>?)?.map((e) => e as int).toList() ??
              const [],
    )
      ..postType = json['postType'] as String
      ..createdAt = DateTime.parse(json['createdAt'] as String);

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'postType': instance.postType,
      'text': instance.text,
      'photos': instance.photos,
      'createdAt': instance.createdAt.toIso8601String(),
    };
