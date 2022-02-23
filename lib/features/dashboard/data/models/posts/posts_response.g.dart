// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostsResponse _$PostsResponseFromJson(Map<String, dynamic> json) {
  return PostsResponse(
    data: (json['data'] as List)
        ?.map((e) =>
            e == null ? null : PostsData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PostsResponseToJson(PostsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

PostsData _$PostsDataFromJson(Map<String, dynamic> json) {
  return PostsData(
    created_time: json['created_time'] as int,
    post_text: json['post_text'] as String,
    locations: (json['locations'] as List)?.map((e) => e as String)?.toList(),
    languages: (json['languages'] as List)?.map((e) => e as String)?.toList(),
    author_name: json['author_name'] as String,
  );
}

Map<String, dynamic> _$PostsDataToJson(PostsData instance) => <String, dynamic>{
      'created_time': instance.created_time,
      'post_text': instance.post_text,
      'locations': instance.locations,
      'languages': instance.languages,
      'author_name': instance.author_name,
    };
