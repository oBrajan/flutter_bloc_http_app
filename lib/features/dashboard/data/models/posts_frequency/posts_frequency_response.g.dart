// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_frequency_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostsFrequencyResponse _$PostsFrequencyResponseFromJson(
    Map<String, dynamic> json) {
  return PostsFrequencyResponse(
    data: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : PostsFrequencyData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PostsFrequencyResponseToJson(
        PostsFrequencyResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

PostsFrequencyData _$PostsFrequencyDataFromJson(Map<String, dynamic> json) {
  return PostsFrequencyData(
    count: json['count'] as int,
    created_time_short: json['created_time_short'] as String,
  );
}

Map<String, dynamic> _$PostsFrequencyDataToJson(PostsFrequencyData instance) =>
    <String, dynamic>{
      'count': instance.count,
      'created_time_short': instance.created_time_short,
    };
