import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';
part 'category_model.g.dart';

@JsonSerializable()
class Category {
  Category(
      {this.categoryName = '',
      this.createdBy = '',
      this.id = Uuid.NAMESPACE_DNS,
      this.categoryPhotoUrl = '',
      this.createdFor = '',
      this.subCategories = const []});
  String categoryName;
  String id;
  List<String> subCategories;
  String createdBy;
  String categoryPhotoUrl;
  DateTime createdAt = DateTime.now();
  String createdFor; //publlic, personal , circle

  factory Category.fromjson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
