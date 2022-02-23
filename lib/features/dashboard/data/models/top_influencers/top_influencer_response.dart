import 'package:json_annotation/json_annotation.dart';

part 'top_influencer_response.g.dart';

@JsonSerializable()
class TopInfluencerResponse {
  final List<TopInfluencerData> data;

  TopInfluencerResponse({this.data});

  factory TopInfluencerResponse.fromJson(Map<String, dynamic> json) =>
      _$TopInfluencerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TopInfluencerResponseToJson(this);
}

@JsonSerializable()
class TopInfluencerData {
  final String author_name;
  final int followers_count;
  final int source_id;
  final int number_of_posts;
  final int dominating_sentiment;
  final double author_weight;

  TopInfluencerData({
    this.author_name,
    this.followers_count,
    this.source_id,
    this.number_of_posts,
    this.dominating_sentiment,
    this.author_weight,
  });

  factory TopInfluencerData.fromJson(Map<String, dynamic> json) =>
      _$TopInfluencerDataFromJson(json);

  Map<String, dynamic> toJson() => _$TopInfluencerDataToJson(this);
}
