// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nugget_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Nugget _$NuggetFromJson(Map<String, dynamic> json) => Nugget(
      category: json['category'] as String? ?? '',
      id: json['id'] as String? ?? Uuid.NAMESPACE_DNS,
      photosUrl: json['photosUrl'] as String? ?? '',
      postedBy: json['postedBy'] as String? ?? '',
      subCategory: json['subCategory'] as String? ?? '',
      tags: json['tags'] as String? ?? '',
      text: json['text'] as String? ?? '',
    );

Map<String, dynamic> _$NuggetToJson(Nugget instance) => <String, dynamic>{
      'postedBy': instance.postedBy,
      'id': instance.id,
      'category': instance.category,
      'subCategory': instance.subCategory,
      'text': instance.text,
      'tags': instance.tags,
      'photosUrl': instance.photosUrl,
    };
