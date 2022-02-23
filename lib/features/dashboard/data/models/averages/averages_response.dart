import 'package:json_annotation/json_annotation.dart';

part 'averages_response.g.dart';

@JsonSerializable()
class AveragesResponse {
  final List<AveragesData> data;

  AveragesResponse({this.data});

  factory AveragesResponse.fromJson(Map<String, dynamic> json) =>
      _$AveragesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AveragesResponseToJson(this);
}

@JsonSerializable()
class AveragesData {
  final ResponseData day;
  final ResponseData week;
  final ResponseData month;

  AveragesData({this.day, this.week, this.month});

  factory AveragesData.fromJson(Map<String, dynamic> json) =>
      _$AveragesDataFromJson(json);

  Map<String, dynamic> toJson() => _$AveragesDataToJson(this);
}

@JsonSerializable()
class ResponseData {
  final double number_of_posts;
  final double reach;
  final double engagement;

  ResponseData({this.number_of_posts, this.reach, this.engagement});

  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      _$AverageDataFromJson(json);

  Map<String, dynamic> toJson() => _$AverageDataToJson(this);
}
