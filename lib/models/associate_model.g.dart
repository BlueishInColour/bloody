// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'associate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Associate _$AssociateFromJson(Map<String, dynamic> json) => Associate(
      sourceId: json['sourceId'] as String? ?? '',
      associationType: json['associationType'] as String? ?? '',
      destinationId: json['destinationId'] as String? ?? '',
    )..createdAt = DateTime.parse(json['createdAt'] as String);

Map<String, dynamic> _$AssociateToJson(Associate instance) => <String, dynamic>{
      'sourceId': instance.sourceId,
      'destinationId': instance.destinationId,
      'associationType': instance.associationType,
      'createdAt': instance.createdAt.toIso8601String(),
    };
