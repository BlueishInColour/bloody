import 'package:uuid/uuid.dart';
import 'package:json_annotation/json_annotation.dart';
part 'loundry_model.g.dart';

@JsonSerializable()
class Loundry {
  String postedBy;
  String id;

  String kg;

  String photosUrl;

  Loundry({
    this.id = Uuid.NAMESPACE_DNS,
    this.photosUrl = '',
    this.postedBy = '',
    this.kg = '',
  });
  factory Loundry.fromJson(Map<String, dynamic> json) =>
      _$LoundryFromJson(json);
  Map<String, dynamic> toJson() => _$LoundryToJson(this);
}
