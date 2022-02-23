import 'package:json_annotation/json_annotation.dart';

part 'posts_frequency_response.g.dart';

@JsonSerializable()
class PostsFrequencyResponse {
  final List<PostsFrequencyData> data;

  PostsFrequencyResponse({this.data});

  factory PostsFrequencyResponse.fromJson(Map<String, dynamic> json) =>
      _$PostsFrequencyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PostsFrequencyResponseToJson(this);
}

@JsonSerializable()
class PostsFrequencyData {
  final int count;
  final String created_time_short;

  PostsFrequencyData({this.count, this.created_time_short});

  factory PostsFrequencyData.fromJson(Map<String, dynamic> json) =>
      _$PostsFrequencyDataFromJson(json);

  Map<String, dynamic> toJson() => _$PostsFrequencyDataToJson(this);
}
