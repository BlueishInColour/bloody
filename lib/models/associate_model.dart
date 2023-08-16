import 'package:json_annotation/json_annotation.dart';

part 'associate_model.g.dart';

///this is an associaate model for all of the following
///which will work for mostly buttons that dont need
///data to be inputed or passed down
///the following will be the association types
///>>follow button
///>>like button
///>>share button
///>>
///
@JsonSerializable()
class Associate {
  String sourceId = ''; //userid for follow,postid for share,like
  String destinationId = ''; //userid for follow, postid for share,like
  String associationType = ''; //follow, like , share
  DateTime createdAt = DateTime.now();
  Associate(
      {required this.sourceId,
      required this.associationType,
      required this.destinationId});
  factory Associate.fromJson(Map<String, dynamic> json) =>
      _$AssociateFromJson(json);
  Map<String, dynamic> toJson() => _$AssociateToJson(this);
}
