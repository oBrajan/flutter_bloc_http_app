import 'package:json_annotation/json_annotation.dart';

part 'account_data_response.g.dart';

@JsonSerializable()
class AccountResponse {
  List<AccountDataResponse> data;

  AccountResponse({this.data});

  factory AccountResponse.fromJson(Map<String, dynamic> json) =>
      _$AccountResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AccountResponseToJson(this);
}

@JsonSerializable()
class AccountDataResponse {
  String id;
  String name;
  String email;
  bool active;
  int time_created;
  int data_gathering_cycle;
  int max_number_of_projects;
  int max_number_of_topics;
  int max_number_of_queries;
  int max_number_of_posts;
  int current_number_of_projects;
  int current_number_of_topics;
  int current_number_of_queries;
  int current_number_of_posts;

  AccountDataResponse({
    this.id,
    this.name,
    this.email,
    this.active,
    this.time_created,
    this.data_gathering_cycle,
    this.max_number_of_projects,
    this.max_number_of_topics,
    this.max_number_of_queries,
    this.max_number_of_posts,
    this.current_number_of_projects,
    this.current_number_of_topics,
    this.current_number_of_queries,
    this.current_number_of_posts,
  });

  factory AccountDataResponse.fromJson(Map<String, dynamic> json) =>
      _$AccountDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AccountDataResponseToJson(this);
}
