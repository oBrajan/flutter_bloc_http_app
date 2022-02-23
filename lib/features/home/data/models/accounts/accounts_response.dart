import 'package:json_annotation/json_annotation.dart';

part 'accounts_response.g.dart';

@JsonSerializable()
class AccountsResponse {
  List<AccountDataResponse> data;

  AccountsResponse({this.data});

  factory AccountsResponse.fromJson(Map<String, dynamic> json) =>
      _$AccountsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AccountsResponseToJson(this);
}

@JsonSerializable()
class AccountDataResponse {
  String id;
  String name;
  String email;
  bool active;
  double time_created;

  AccountDataResponse({
    this.id,
    this.name,
    this.email,
    this.active,
    this.time_created,
  });

  factory AccountDataResponse.fromJson(Map<String, dynamic> json) =>
      _$AccountDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AccountDataResponseToJson(this);
}
