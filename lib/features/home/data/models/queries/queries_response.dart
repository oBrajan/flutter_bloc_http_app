import 'package:json_annotation/json_annotation.dart';

part 'queries_response.g.dart';

@JsonSerializable()
class QueriesResponse {
  final List<QueryData> data;

  QueriesResponse({this.data});

  factory QueriesResponse.fromJson(Map<String, dynamic> json) =>
      _$QueriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QueriesResponseToJson(this);
}

@JsonSerializable()
class QueryData {
  final String id;
  final String name;
  final List<String> locations;
  final List<String> languages;
  final List<String> included_keywords;
  final List<String> excluded_keywords;
  final List<String> variations;

  QueryData(
      {this.id,
      this.name,
      this.locations,
      this.languages,
      this.included_keywords,
      this.excluded_keywords,
      this.variations});

  factory QueryData.fromJson(Map<String, dynamic> json) =>
      _$QueryDataFromJson(json);

  Map<String, dynamic> toJson() => _$QueryDataToJson(this);
}
