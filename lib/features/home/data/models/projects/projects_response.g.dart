// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectsResponse _$ProjectsResponseFromJson(Map<String, dynamic> json) {
  return ProjectsResponse(
    data: (json['data'] as List)
        ?.map((e) =>
            e == null ? null : ProjectData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ProjectsResponseToJson(ProjectsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

ProjectData _$ProjectsDataFromJson(Map<String, dynamic> json) {
  return ProjectData(
    id: json['id'] as String,
    name: json['name'] as String,
    created_date: json['created_date'] as int,
    end_date: json['end_date'] as int,
    active: json['active'] as bool,
    current_number_of_topics: json['current_number_of_topics'] as int,
    current_number_of_posts: json['current_number_of_posts'] as int,
  );
}

Map<String, dynamic> _$ProjectsDataToJson(ProjectData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'created_date': instance.created_date,
      'end_date': instance.end_date,
      'active': instance.active,
      'current_number_of_topics': instance.current_number_of_topics,
      'current_number_of_posts': instance.current_number_of_posts,
    };
