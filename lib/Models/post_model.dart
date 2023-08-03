import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

//@JsonSerializable()
//class ImagesByte{
//  List<int> bytes;
//  ImagesByte({required this.bytes});
//  factory ImagesByte.fromJson(Map<String,dynamic> json)=> _$ImagesByteFromJson(json);
//
//  Map<String,dynamic> toJson()=> _$ImagesBytesToJson(this);
//}
//
@JsonSerializable()
class Data {
  String postedby;
  DateTime posted_as_at;
  String extra_info;
  int freakins;
  int freakouts;
  List<List<int>> byte;
  List<String> flag;
  String pinnedTag;
  Data({
    required this.byte,
    required this.extra_info,
    required this.freakins,
    required this.freakouts,
    required this.posted_as_at,
    required this.postedby,
    required this.flag,
    required this.pinnedTag,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Post {
  String id;
  String objectType;
  Data data;
  Post({
    required this.data,
    required this.id,
    required this.objectType,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}
