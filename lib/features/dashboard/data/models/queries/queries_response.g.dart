// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queries_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueriesResponse _$QueriesResponseFromJson(Map<String, dynamic> json) {
  return QueriesResponse(
    data: (json['data'] as List)
        ?.map((e) =>
            e == null ? null : QueriesData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$QueriesResponseToJson(QueriesResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

QueriesData _$QueriesDataFromJson(Map<String, dynamic> json) {
  return QueriesData(
    count: json['count'] as int,
    reach: json['reach'] as int,
    engagement: json['engagement'] as int,
    query_name: json['query_name'] as String,
  );
}

Map<String, dynamic> _$QueriesDataToJson(QueriesData instance) =>
    <String, dynamic>{
      'count': instance.count,
      'reach': instance.reach,
      'engagement': instance.engagement,
      'query_name': instance.query_name,
    };
