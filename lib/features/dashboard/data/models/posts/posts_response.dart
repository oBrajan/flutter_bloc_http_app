import 'package:json_annotation/json_annotation.dart';

part 'posts_response.g.dart';

@JsonSerializable()
class PostsResponse {
  final List<PostsData> data;

  PostsResponse({this.data});

  factory PostsResponse.fromJson(Map<String, dynamic> json) =>
      _$PostsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PostsResponseToJson(this);
}

@JsonSerializable()
class PostsData {
  final int created_time;
  final String post_text;
  final List<String> locations;
  final List<String> languages;
  final String author_name;

  PostsData(
      {this.created_time,
      this.post_text,
      this.locations,
      this.languages,
      this.author_name});

  factory PostsData.fromJson(Map<String, dynamic> json) =>
      _$PostsDataFromJson(json);

  Map<String, dynamic> toJson() => _$PostsDataToJson(this);
}
