import 'package:json_annotation/json_annotation.dart';

part 'projects_response.g.dart';

@JsonSerializable()
class ProjectsResponse {
  List<ProjectData> data;

  ProjectsResponse({this.data});

  factory ProjectsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProjectsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectsResponseToJson(this);
}

@JsonSerializable()
class ProjectData {
  String id;
  String name;
  int created_date;
  int end_date;
  bool active;
  int current_number_of_topics;
  int current_number_of_posts;

  ProjectData(
      {this.id,
      this.name,
      this.created_date,
      this.end_date,
      this.active,
      this.current_number_of_topics,
      this.current_number_of_posts});

  factory ProjectData.fromJson(Map<String, dynamic> json) =>
      _$ProjectsDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectsDataToJson(this);
}
