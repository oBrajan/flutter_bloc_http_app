import 'package:easy2know_flutter/features/dashboard/data/models/sentiment_by_source/sentiment_by_source_response.dart';
import 'package:easy2know_flutter/features/dashboard/domain/entities/sentiment_by_source/sentiment_by_source.dart';

List<SentimentBySource> mapResponseToSentimentBySource(
    SentimentBySourceResponse response) {
  List<SentimentBySource> list = new List<SentimentBySource>();

  List<PostPerDate> postPerDateList = new List<PostPerDate>();

  response.data.first.posts_per_date.forEach((element) {
    PostPerDate(
      count_negative: element.count_negative,
      count_positive: element.count_positive,
      count_neutral: element.count_neutral,
      count_undefined: element.count_undefined,
      source_id: element.source_id,
      created_time_short: element.created_time_short,
    );
  });

  response.data.forEach((element) {
    list.add(SentimentBySource(
      posts_per_date: postPerDateList,
      posts: PostsCount(count: element.posts.count),
      authors: PostsCount(count: element.authors.count),
    ));
  });

  return list;
}
