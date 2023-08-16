import 'package:json_annotation/json_annotation.dart';
part 'post_model.g.dart';

///this is a post that can be a loundry ,style ,cosplay, or severals like that
///other datas like comments and likes and shares will come  in the associated model
/// so i aonly get to worry about the main data that are been sent or transfer here

@JsonSerializable()
class Post {
  String id;
  String postType;
  String text;
  List<String> tags;
  List<List<int>> photos;

  // DateTime createdAt =DateTime.now();

  Post({
    required this.id,
    required this.text,
    required this.postType,
    required this.photos,
    required this.tags,
  });
  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}
