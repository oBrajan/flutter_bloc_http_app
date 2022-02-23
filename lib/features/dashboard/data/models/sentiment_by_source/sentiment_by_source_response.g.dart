// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sentiment_by_source_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SentimentBySourceResponse _$SentimentBySourceResponseFromJson(
    Map<String, dynamic> json) {
  return SentimentBySourceResponse(
    data: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : SentimentBySourceData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SentimentBySourceResponseToJson(
        SentimentBySourceResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

SentimentBySourceData _$SentimentBySourceDataFromJson(
    Map<String, dynamic> json) {
  return SentimentBySourceData(
    posts_per_date: (json['posts_per_date'] as List)
        ?.map((e) => e == null
            ? null
            : PostPerDateResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    posts: json['posts'] == null
        ? null
        : PostsCountResponse.fromJson(json['posts'] as Map<String, dynamic>),
    authors: json['authors'] == null
        ? null
        : PostsCountResponse.fromJson(json['authors'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SentimentBySourceDataToJson(
        SentimentBySourceData instance) =>
    <String, dynamic>{
      'posts_per_date': instance.posts_per_date,
      'posts': instance.posts,
      'authors': instance.authors,
    };

PostPerDateResponse _$PostPerDateResponseFromJson(Map<String, dynamic> json) {
  return PostPerDateResponse(
    count_negative: json['count_negative'] as int,
    count_positive: json['count_positive'] as int,
    count_neutral: json['count_neutral'] as int,
    count_undefined: json['count_undefined'] as int,
    source_id: json['source_id'] as int,
    created_time_short: json['created_time_short'] as String,
  );
}

Map<String, dynamic> _$PostPerDateResponseToJson(
        PostPerDateResponse instance) =>
    <String, dynamic>{
      'count_negative': instance.count_negative,
      'count_positive': instance.count_positive,
      'count_neutral': instance.count_neutral,
      'count_undefined': instance.count_undefined,
      'source_id': instance.source_id,
      'created_time_short': instance.created_time_short,
    };

PostsCountResponse _$PostsCountResponseFromJson(Map<String, dynamic> json) {
  return PostsCountResponse(
    count: json['count'] as int,
  );
}

Map<String, dynamic> _$PostsCountResponseToJson(PostsCountResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
    };
