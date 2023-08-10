import 'package:json_annotation/json_annotation.dart';
part 'post_model.g.dart';

///this is a post that can be a loundry ,style ,cosplay, or severals like that
///other datas like comments and likes and shares will come  in the associated model
/// so i aonly get to worry about the main data that are been sent or transfer here

@JsonSerializable()
class Post {
  String id = '';
  String postType = '';
  String text = '';

  List<int> photos = [];
  DateTime createdAt = DateTime.now();
  Post({
    this.id = '',
    this.text = '',
    this.photos = const [],
  });
  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}
