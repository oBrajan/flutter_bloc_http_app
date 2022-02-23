// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountResponse _$AccountResponseFromJson(Map<String, dynamic> json) {
  return AccountResponse(
    data: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : AccountDataResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AccountResponseToJson(AccountResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

AccountDataResponse _$AccountDataResponseFromJson(Map<String, dynamic> json) {
  return AccountDataResponse(
    id: json['_id'] as String,
    name: json['name'] as String,
    email: json['email'] as String,
    active: json['active'] as bool,
    time_created: (json['time_created'] as num)?.toInt(),
    data_gathering_cycle: json['data_gathering_cycle'] as int,
    max_number_of_projects: json['max_number_of_projects'] as int,
    max_number_of_topics: json['max_number_of_topics'] as int,
    max_number_of_queries: json['max_number_of_queries'] as int,
    max_number_of_posts: json['max_number_of_posts'] as int,
    current_number_of_projects: json['current_number_of_projects'] as int,
    current_number_of_topics: json['current_number_of_topics'] as int,
    current_number_of_queries: json['current_number_of_queries'] as int,
    current_number_of_posts: json['current_number_of_posts'] as int,
  );
}

Map<String, dynamic> _$AccountDataResponseToJson(
        AccountDataResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'active': instance.active,
      'time_created': instance.time_created,
      'data_gathering_cycle': instance.data_gathering_cycle,
      'max_number_of_projects': instance.max_number_of_projects,
      'max_number_of_topics': instance.max_number_of_topics,
      'max_number_of_queries': instance.max_number_of_queries,
      'max_number_of_posts': instance.max_number_of_posts,
      'current_number_of_projects': instance.current_number_of_projects,
      'current_number_of_topics': instance.current_number_of_topics,
      'current_number_of_queries': instance.current_number_of_queries,
      'current_number_of_posts': instance.current_number_of_posts,
    };
