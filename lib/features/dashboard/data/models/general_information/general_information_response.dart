import 'package:json_annotation/json_annotation.dart';

part 'general_information_response.g.dart';

@JsonSerializable()
class GeneralInformationResponse {
  final List<GeneralInformationData> data;

  GeneralInformationResponse(this.data);

  factory GeneralInformationResponse.fromJson(Map<String, dynamic> json) =>
      _$GeneralInformationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GeneralInformationResponseToJson(this);
}

@JsonSerializable()
class GeneralInformationData {
  final int number_of_queries;
  final int number_of_posts;
  final List<String> locations;
  final List<String> languages;
  final int start_date_for_time_period;
  final double end_date_for_time_period;

  GeneralInformationData(
    this.number_of_queries,
    this.number_of_posts,
    this.locations,
    this.languages,
    this.start_date_for_time_period,
    this.end_date_for_time_period,
  );

  factory GeneralInformationData.fromJson(Map<String, dynamic> json) =>
      _$GeneralInformationDataFromJson(json);

  Map<String, dynamic> toJson() => _$GeneralInformationDataToJson(this);
}
