import 'package:uuid/uuid.dart';
import 'package:json_annotation/json_annotation.dart';
part 'nugget_model.g.dart';

@JsonSerializable()
class Nugget {
  String postedBy;
  String id;
  String category;
  String subCategory;
  String text;
  String tags;
  String photosUrl;

  Nugget(
      {this.category = '',
      this.id = Uuid.NAMESPACE_DNS,
      this.photosUrl = '',
      this.postedBy = '',
      this.subCategory = '',
      this.tags = '',
      this.text = ''});
  factory Nugget.fromJson(Map<String, dynamic> json) => _$NuggetFromJson(json);
  Map<String, dynamic> toJson() => _$NuggetToJson(this);
}
