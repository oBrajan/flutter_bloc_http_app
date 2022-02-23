import 'package:json_annotation/json_annotation.dart';

part 'queries_response.g.dart';

@JsonSerializable()
class QueriesResponse {
  final List<QueriesData> data;

  QueriesResponse({this.data});

  factory QueriesResponse.fromJson(Map<String, dynamic> json) =>
      _$QueriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QueriesResponseToJson(this);
}

@JsonSerializable()
class QueriesData {
  final int count;
  final int reach;
  final int engagement;
  final String query_name;

  QueriesData({this.count, this.reach, this.engagement, this.query_name});

  factory QueriesData.fromJson(Map<String, dynamic> json) =>
      _$QueriesDataFromJson(json);

  Map<String, dynamic> toJson() => _$QueriesDataToJson(this);
}
