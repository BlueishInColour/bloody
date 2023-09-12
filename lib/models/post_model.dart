import 'package:json_annotation/json_annotation.dart';
part 'post_model.g.dart';

///this is a post that can be a loundry ,style ,cosplay, or severals like that
///other datas like comments and likes and shares will come  in the associated model
/// so i aonly get to worry about the main data that are been sent or transfer here

@JsonSerializable()
class Post {
  String postedBy;
  String key;
  String category;
  String subCategory;
  String text;
  String tags;
  String specialTag;
  List<String> photosUrl;

  // DateTime createdAt =DateTime.now();

  Post(
      {this.postedBy = '',
      this.key = '',
      this.text = '',
      this.category = '',
      this.subCategory = '',
      this.photosUrl = const [],
      this.tags = '',
      this.specialTag = ''});
  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}
