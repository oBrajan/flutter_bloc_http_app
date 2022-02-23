// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_information_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneralInformationResponse _$GeneralInformationResponseFromJson(
    Map<String, dynamic> json) {
  return GeneralInformationResponse(
    (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : GeneralInformationData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$GeneralInformationResponseToJson(
        GeneralInformationResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

GeneralInformationData _$GeneralInformationDataFromJson(
    Map<String, dynamic> json) {
  return GeneralInformationData(
    json['number_of_queries'] as int,
    json['number_of_posts'] as int,
    (json['locations'] as List)?.map((e) => e as String)?.toList(),
    (json['languages'] as List)?.map((e) => e as String)?.toList(),
    json['start_date_for_time_period'] as int,
    (json['end_date_for_time_period'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$GeneralInformationDataToJson(
        GeneralInformationData instance) =>
    <String, dynamic>{
      'number_of_queries': instance.number_of_queries,
      'number_of_posts': instance.number_of_posts,
      'locations': instance.locations,
      'languages': instance.languages,
      'start_date_for_time_period': instance.start_date_for_time_period,
      'end_date_for_time_period': instance.end_date_for_time_period,
    };
