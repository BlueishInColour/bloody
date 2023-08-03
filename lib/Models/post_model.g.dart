// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      byte: (json['byte'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as int).toList())
          .toList(),
      extra_info: json['extra_info'] as String,
      freakins: json['freakins'] as int,
      freakouts: json['freakouts'] as int,
      posted_as_at: DateTime.parse(json['posted_as_at'] as String),
      postedby: json['postedby'] as String,
      flag: (json['flag'] as List<dynamic>).map((e) => e as String).toList(),
      pinnedTag: json['pinnedTag'] as String,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'postedby': instance.postedby,
      'posted_as_at': instance.posted_as_at.toIso8601String(),
      'extra_info': instance.extra_info,
      'freakins': instance.freakins,
      'freakouts': instance.freakouts,
      'byte': instance.byte,
      'flag': instance.flag,
      'pinnedTag': instance.pinnedTag,
    };

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
      id: json['id'] as String,
      objectType: json['objectType'] as String,
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'objectType': instance.objectType,
      'data': instance.data,
    };
