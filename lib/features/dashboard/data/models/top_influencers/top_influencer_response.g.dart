// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_influencer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopInfluencerResponse _$TopInfluencerResponseFromJson(
    Map<String, dynamic> json) {
  return TopInfluencerResponse(
    data: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : TopInfluencerData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$TopInfluencerResponseToJson(
        TopInfluencerResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

TopInfluencerData _$TopInfluencerDataFromJson(Map<String, dynamic> json) {
  return TopInfluencerData(
    author_name: json['author_name'] as String,
    followers_count: json['followers_count'] as int,
    source_id: json['source_id'] as int,
    number_of_posts: json['number_of_posts'] as int,
    dominating_sentiment: json['dominating_sentiment'] as int,
    author_weight: (json['author_weight'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$TopInfluencerDataToJson(TopInfluencerData instance) =>
    <String, dynamic>{
      'author_name': instance.author_name,
      'followers_count': instance.followers_count,
      'source_id': instance.source_id,
      'number_of_posts': instance.number_of_posts,
      'dominating_sentiment': instance.dominating_sentiment,
      'author_weight': instance.author_weight,
    };
