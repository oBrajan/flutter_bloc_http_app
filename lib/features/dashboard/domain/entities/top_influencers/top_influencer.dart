import 'package:equatable/equatable.dart';

class TopInfluencer extends Equatable {
  final String author_name;
  final int followers_count;
  final int source_id;
  final int number_of_posts;
  final int dominating_sentiment;
  final double author_weight;

  TopInfluencer({
    this.author_name,
    this.followers_count,
    this.source_id,
    this.number_of_posts,
    this.dominating_sentiment,
    this.author_weight,
  });

  @override
  List<Object> get props => [
        author_name,
        followers_count,
        source_id,
        number_of_posts,
        dominating_sentiment,
        author_weight,
      ];
}
