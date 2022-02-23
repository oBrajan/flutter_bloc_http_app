import 'package:json_annotation/json_annotation.dart';

part 'overall_metrics_response.g.dart';

@JsonSerializable()
class OverallMetricsResponse {
  final List<OverallMetricsData> data;

  OverallMetricsResponse({this.data});

  factory OverallMetricsResponse.fromJson(Map<String, dynamic> json) =>
      _$OverallMetricsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OverallMetricsResponseToJson(this);
}

@JsonSerializable()
class OverallMetricsData {
  final List<PostsPerDateResponse> posts_per_date;
  final TotalCountsResponse total_counts;
  final List<AuthorsPerDateResponse> authors_per_date;
  final List<WebsitesPerDateResponse> websites_per_date;

  OverallMetricsData({
    this.posts_per_date,
    this.total_counts,
    this.authors_per_date,
    this.websites_per_date,
  });

  factory OverallMetricsData.fromJson(Map<String, dynamic> json) =>
      _$OverallMetricsDataFromJson(json);

  Map<String, dynamic> toJson() => _$OverallMetricsDataToJson(this);
}

@JsonSerializable()
class PostsPerDateResponse {
  final int reach;
  final int engagement;
  final int mentions;
  final int sentiment_negative;
  final int sentiment_positive;
  final int sentiment_neutral;
  final int sentiment_undefined;
  final String created_time_short;

  PostsPerDateResponse({
    this.reach,
    this.engagement,
    this.mentions,
    this.sentiment_negative,
    this.sentiment_positive,
    this.sentiment_neutral,
    this.sentiment_undefined,
    this.created_time_short,
  });

  factory PostsPerDateResponse.fromJson(Map<String, dynamic> json) =>
      _$PostsPerDateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PostsPerDateResponseToJson(this);
}

@JsonSerializable()
class TotalCountsResponse {
  final int mentions;
  final int reach;
  final int engagement;
  final int count_disqus;
  final int count_facebook;
  final int count_forum;
  final int count_instagram;
  final int count_reddit;
  final int count_trip_advisor;
  final int count_twitter;
  final int count_vkontakte;
  final int count_youtube;
  final double percent_disqus;
  final double percent_facebook;
  final double percent_forum;
  final double percent_instagram;
  final double percent_reddit;
  final double percent_trip_advisor;
  final double percent_twitter;
  final double percent_vkontakte;
  final double percent_youtube;
  final double count_authors;
  final double count_websites;

  TotalCountsResponse({
    this.mentions,
    this.reach,
    this.engagement,
    this.count_disqus,
    this.count_facebook,
    this.count_forum,
    this.count_instagram,
    this.count_reddit,
    this.count_trip_advisor,
    this.count_twitter,
    this.count_vkontakte,
    this.count_youtube,
    this.percent_disqus,
    this.percent_facebook,
    this.percent_forum,
    this.percent_instagram,
    this.percent_reddit,
    this.percent_trip_advisor,
    this.percent_twitter,
    this.percent_vkontakte,
    this.percent_youtube,
    this.count_authors,
    this.count_websites,
  });

  factory TotalCountsResponse.fromJson(Map<String, dynamic> json) =>
      _$TotalCountsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TotalCountsResponseToJson(this);
}

@JsonSerializable()
class AuthorsPerDateResponse {
  final String created_time_short;
  final int count_authors;

  AuthorsPerDateResponse({this.created_time_short, this.count_authors});

  factory AuthorsPerDateResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthorsPerDateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorsPerDateResponseToJson(this);
}

@JsonSerializable()
class WebsitesPerDateResponse {
  final int count_websites;
  final String created_time_short;

  WebsitesPerDateResponse({this.count_websites, this.created_time_short});

  factory WebsitesPerDateResponse.fromJson(Map<String, dynamic> json) =>
      _$WebsitesPerDateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WebsitesPerDateResponseToJson(this);
}
