// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overall_metrics_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OverallMetricsResponse _$OverallMetricsResponseFromJson(
    Map<String, dynamic> json) {
  return OverallMetricsResponse(
    data: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : OverallMetricsData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$OverallMetricsResponseToJson(
        OverallMetricsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

OverallMetricsData _$OverallMetricsDataFromJson(Map<String, dynamic> json) {
  return OverallMetricsData(
    posts_per_date: (json['posts_per_date'] as List)
        ?.map((e) => e == null
            ? null
            : PostsPerDateResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    total_counts: json['total_counts'] == null
        ? null
        : TotalCountsResponse.fromJson(
            json['total_counts'] as Map<String, dynamic>),
    authors_per_date: (json['authors_per_date'] as List)
        ?.map((e) => e == null
            ? null
            : AuthorsPerDateResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    websites_per_date: (json['websites_per_date'] as List)
        ?.map((e) => e == null
            ? null
            : WebsitesPerDateResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$OverallMetricsDataToJson(OverallMetricsData instance) =>
    <String, dynamic>{
      'posts_per_date': instance.posts_per_date,
      'total_counts': instance.total_counts,
      'authors_per_date': instance.authors_per_date,
      'websites_per_date': instance.websites_per_date,
    };

PostsPerDateResponse _$PostsPerDateResponseFromJson(Map<String, dynamic> json) {
  return PostsPerDateResponse(
    reach: json['reach'] as int,
    engagement: json['engagement'] as int,
    mentions: json['mentions'] as int,
    sentiment_negative: json['sentiment_negative'] as int,
    sentiment_positive: json['sentiment_positive'] as int,
    sentiment_neutral: json['sentiment_neutral'] as int,
    sentiment_undefined: json['sentiment_undefined'] as int,
    created_time_short: json['created_time_short'] as String,
  );
}

Map<String, dynamic> _$PostsPerDateResponseToJson(
        PostsPerDateResponse instance) =>
    <String, dynamic>{
      'reach': instance.reach,
      'engagement': instance.engagement,
      'mentions': instance.mentions,
      'sentiment_negative': instance.sentiment_negative,
      'sentiment_positive': instance.sentiment_positive,
      'sentiment_neutral': instance.sentiment_neutral,
      'sentiment_undefined': instance.sentiment_undefined,
      'created_time_short': instance.created_time_short,
    };

TotalCountsResponse _$TotalCountsResponseFromJson(Map<String, dynamic> json) {
  return TotalCountsResponse(
    mentions: json['mentions'] as int,
    reach: json['reach'] as int,
    engagement: json['engagement'] as int,
    count_disqus: json['count_disqus'] as int,
    count_facebook: json['count_facebook'] as int,
    count_forum: json['count_forum'] as int,
    count_instagram: json['count_instagram'] as int,
    count_reddit: json['count_reddit'] as int,
    count_trip_advisor: json['count_trip_advisor'] as int,
    count_twitter: json['count_twitter'] as int,
    count_vkontakte: json['count_vkontakte'] as int,
    count_youtube: json['count_youtube'] as int,
    percent_disqus: (json['percent_disqus'] as num)?.toDouble(),
    percent_facebook: (json['percent_facebook'] as num)?.toDouble(),
    percent_forum: (json['percent_forum'] as num)?.toDouble(),
    percent_instagram: (json['percent_instagram'] as num)?.toDouble(),
    percent_reddit: (json['percent_reddit'] as num)?.toDouble(),
    percent_trip_advisor: (json['percent_trip_advisor'] as num)?.toDouble(),
    percent_twitter: (json['percent_twitter'] as num)?.toDouble(),
    percent_vkontakte: (json['percent_vkontakte'] as num)?.toDouble(),
    percent_youtube: (json['percent_youtube'] as num)?.toDouble(),
    count_authors: (json['count_authors'] as num)?.toDouble(),
    count_websites: (json['count_websites'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$TotalCountsResponseToJson(
        TotalCountsResponse instance) =>
    <String, dynamic>{
      'mentions': instance.mentions,
      'reach': instance.reach,
      'engagement': instance.engagement,
      'count_disqus': instance.count_disqus,
      'count_facebook': instance.count_facebook,
      'count_forum': instance.count_forum,
      'count_instagram': instance.count_instagram,
      'count_reddit': instance.count_reddit,
      'count_trip_advisor': instance.count_trip_advisor,
      'count_twitter': instance.count_twitter,
      'count_vkontakte': instance.count_vkontakte,
      'count_youtube': instance.count_youtube,
      'percent_disqus': instance.percent_disqus,
      'percent_facebook': instance.percent_facebook,
      'percent_forum': instance.percent_forum,
      'percent_instagram': instance.percent_instagram,
      'percent_reddit': instance.percent_reddit,
      'percent_trip_advisor': instance.percent_trip_advisor,
      'percent_twitter': instance.percent_twitter,
      'percent_vkontakte': instance.percent_vkontakte,
      'percent_youtube': instance.percent_youtube,
      'count_authors': instance.count_authors,
      'count_websites': instance.count_websites,
    };

AuthorsPerDateResponse _$AuthorsPerDateResponseFromJson(
    Map<String, dynamic> json) {
  return AuthorsPerDateResponse(
    created_time_short: json['created_time_short'] as String,
    count_authors: json['count_authors'] as int,
  );
}

Map<String, dynamic> _$AuthorsPerDateResponseToJson(
        AuthorsPerDateResponse instance) =>
    <String, dynamic>{
      'created_time_short': instance.created_time_short,
      'count_authors': instance.count_authors,
    };

WebsitesPerDateResponse _$WebsitesPerDateResponseFromJson(
    Map<String, dynamic> json) {
  return WebsitesPerDateResponse(
    count_websites: json['count_websites'] as int,
    created_time_short: json['created_time_short'] as String,
  );
}

Map<String, dynamic> _$WebsitesPerDateResponseToJson(
        WebsitesPerDateResponse instance) =>
    <String, dynamic>{
      'count_websites': instance.count_websites,
      'created_time_short': instance.created_time_short,
    };
