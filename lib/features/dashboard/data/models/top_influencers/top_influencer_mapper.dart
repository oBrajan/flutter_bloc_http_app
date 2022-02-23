import 'package:easy2know_flutter/features/dashboard/data/models/top_influencers/top_influencer_response.dart';
import 'package:easy2know_flutter/features/dashboard/domain/entities/top_influencers/top_influencer.dart';

List<TopInfluencer> mapResponseToInfluencer(TopInfluencerResponse response) {
  List<TopInfluencer> list = new List<TopInfluencer>();

  response.data.forEach((element) {
    list.add(TopInfluencer(
      author_name: element.author_name,
      followers_count: element.followers_count,
      source_id: element.source_id,
      number_of_posts: element.number_of_posts,
      dominating_sentiment: element.dominating_sentiment,
      author_weight: element.author_weight,
    ));
  });

  return list;
}
