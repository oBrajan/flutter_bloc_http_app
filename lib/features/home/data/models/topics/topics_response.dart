import 'package:json_annotation/json_annotation.dart';

part 'topics_response.g.dart';

@JsonSerializable()
class TopicsResponse {
  final List<TopicData> data;

  TopicsResponse({this.data});

  factory TopicsResponse.fromJson(Map<String, dynamic> json) =>
      _$TopicsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TopicsResponseToJson(this);
}

@JsonSerializable()
class TopicData {
  final String id;
  final String name;
  final List<String> locations;
  final List<String> languages;
  final int start_date;
  final int end_date;
  final int current_number_of_queries;
  final int current_number_of_posts;

  TopicData({
    this.id,
    this.name,
    this.locations,
    this.languages,
    this.start_date,
    this.end_date,
    this.current_number_of_queries,
    this.current_number_of_posts,
  });

  factory TopicData.fromJson(Map<String, dynamic> json) =>
      _$TopicDataFromJson(json);

  Map<String, dynamic> toJson() => _$TopicDataToJson(this);
}
