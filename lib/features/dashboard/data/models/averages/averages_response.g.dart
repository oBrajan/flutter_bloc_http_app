// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'averages_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AveragesResponse _$AveragesResponseFromJson(Map<String, dynamic> json) {
  return AveragesResponse(
    data: (json['data'] as List)
        ?.map((e) =>
            e == null ? null : AveragesData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AveragesResponseToJson(AveragesResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

AveragesData _$AveragesDataFromJson(Map<String, dynamic> json) {
  return AveragesData(
    day: json['day'] == null
        ? null
        : ResponseData.fromJson(json['day'] as Map<String, dynamic>),
    week: json['week'] == null
        ? null
        : ResponseData.fromJson(json['week'] as Map<String, dynamic>),
    month: json['month'] == null
        ? null
        : ResponseData.fromJson(json['month'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AveragesDataToJson(AveragesData instance) =>
    <String, dynamic>{
      'day': instance.day,
      'week': instance.week,
      'month': instance.month,
    };

ResponseData _$AverageDataFromJson(Map<String, dynamic> json) {
  return ResponseData(
    number_of_posts: (json['number_of_posts'] as num)?.toDouble(),
    reach: (json['reach'] as num)?.toDouble(),
    engagement: (json['engagement'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$AverageDataToJson(ResponseData instance) =>
    <String, dynamic>{
      'number_of_posts': instance.number_of_posts,
      'reach': instance.reach,
      'engagement': instance.engagement,
    };
