// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loundry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Loundry _$LoundryFromJson(Map<String, dynamic> json) => Loundry(
      id: json['id'] as String? ?? Uuid.NAMESPACE_DNS,
      photosUrl: json['photosUrl'] as String? ?? '',
      postedBy: json['postedBy'] as String? ?? '',
      kg: json['kg'] as String? ?? '',
    );

Map<String, dynamic> _$LoundryToJson(Loundry instance) => <String, dynamic>{
      'postedBy': instance.postedBy,
      'id': instance.id,
      'kg': instance.kg,
      'photosUrl': instance.photosUrl,
    };
