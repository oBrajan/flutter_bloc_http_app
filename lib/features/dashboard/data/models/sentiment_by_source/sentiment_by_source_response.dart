import 'package:json_annotation/json_annotation.dart';

part 'sentiment_by_source_response.g.dart';

@JsonSerializable()
class SentimentBySourceResponse {
  final List<SentimentBySourceData> data;

  SentimentBySourceResponse({this.data});

  factory SentimentBySourceResponse.fromJson(Map<String, dynamic> json) =>
      _$SentimentBySourceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SentimentBySourceResponseToJson(this);
}

@JsonSerializable()
class SentimentBySourceData {
  final List<PostPerDateResponse> posts_per_date;
  final PostsCountResponse posts;
  final PostsCountResponse authors;

  SentimentBySourceData({this.posts_per_date, this.posts, this.authors});

  factory SentimentBySourceData.fromJson(Map<String, dynamic> json) =>
      _$SentimentBySourceDataFromJson(json);

  Map<String, dynamic> toJson() => _$SentimentBySourceDataToJson(this);
}

@JsonSerializable()
class PostPerDateResponse {
  final int count_negative;
  final int count_positive;
  final int count_neutral;
  final int count_undefined;
  final int source_id;
  final String created_time_short;

  PostPerDateResponse({
    this.count_negative,
    this.count_positive,
    this.count_neutral,
    this.count_undefined,
    this.source_id,
    this.created_time_short,
  });

  factory PostPerDateResponse.fromJson(Map<String, dynamic> json) =>
      _$PostPerDateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PostPerDateResponseToJson(this);
}

@JsonSerializable()
class PostsCountResponse {
  final int count;

  PostsCountResponse({this.count});

  factory PostsCountResponse.fromJson(Map<String, dynamic> json) =>
      _$PostsCountResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PostsCountResponseToJson(this);
}
