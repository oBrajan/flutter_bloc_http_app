// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topics_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopicsResponse _$TopicsResponseFromJson(Map<String, dynamic> json) {
  return TopicsResponse(
    data: (json['data'] as List)
        ?.map((e) =>
            e == null ? null : TopicData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$TopicsResponseToJson(TopicsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

TopicData _$TopicDataFromJson(Map<String, dynamic> json) {
  return TopicData(
    id: json['id'] as String,
    name: json['name'] as String,
    locations: (json['locations'] as List)?.map((e) => e as String)?.toList(),
    languages: (json['languages'] as List)?.map((e) => e as String)?.toList(),
    start_date: json['start_date'] as int,
    end_date: json['end_date'] as int,
    current_number_of_queries: json['current_number_of_queries'] as int,
    current_number_of_posts: json['current_number_of_posts'] as int,
  );
}

Map<String, dynamic> _$TopicDataToJson(TopicData instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'locations': instance.locations,
      'languages': instance.languages,
      'start_date': instance.start_date,
      'end_date': instance.end_date,
      'current_number_of_queries': instance.current_number_of_queries,
      'current_number_of_posts': instance.current_number_of_posts,
    };
