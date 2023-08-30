// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      categoryName: json['categoryName'] as String? ?? '',
      createdBy: json['createdBy'] as String? ?? '',
      id: json['id'] as String? ?? Uuid.NAMESPACE_DNS,
      categoryPhotoUrl: json['categoryPhotoUrl'] as String? ?? '',
      createdFor: json['createdFor'] as String? ?? '',
      subCategories: (json['subCategories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    )..createdAt = DateTime.parse(json['createdAt'] as String);

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'categoryName': instance.categoryName,
      'id': instance.id,
      'subCategories': instance.subCategories,
      'createdBy': instance.createdBy,
      'categoryPhotoUrl': instance.categoryPhotoUrl,
      'createdAt': instance.createdAt.toIso8601String(),
      'createdFor': instance.createdFor,
    };
