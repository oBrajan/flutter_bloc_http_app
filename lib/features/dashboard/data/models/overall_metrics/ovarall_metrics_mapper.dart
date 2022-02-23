import 'package:easy2know_flutter/features/dashboard/data/models/overall_metrics/overall_metrics_response.dart';
import 'package:easy2know_flutter/features/dashboard/domain/entities/overall_metrics/overall_metrics.dart';

List<OverallMetrics> mapResponseToOverallMetric(
    OverallMetricsResponse response) {
  List<OverallMetrics> list = new List<OverallMetrics>();

  List<PostsPerDate> postsPerDateList = new List<PostsPerDate>();
  response.data.first.posts_per_date.forEach((element) {
    postsPerDateList.add(PostsPerDate(
      reach: element.reach,
      engagement: element.engagement,
      mentions: element.mentions,
      sentiment_negative: element.sentiment_negative,
      sentiment_positive: element.sentiment_positive,
      sentiment_neutral: element.sentiment_neutral,
      sentiment_undefined: element.sentiment_undefined,
      created_time_short: element.created_time_short,
    ));
  });

  List<AuthorsPerDate> authorsPerDateList = new List<AuthorsPerDate>();
  response.data.first.authors_per_date.forEach((element) {
    authorsPerDateList.add(AuthorsPerDate(
      created_time_short: element.created_time_short,
      count_authors: element.count_authors,
    ));
  });

  List<WebsitesPerDate> websitesPerDateList = new List<WebsitesPerDate>();
  response.data.first.websites_per_date.forEach((element) {
    websitesPerDateList.add(WebsitesPerDate(
      created_time_short: element.created_time_short,
      count_websites: element.count_websites,
    ));
  });

  response.data.forEach((element) {
    list.add(OverallMetrics(
      posts_per_date: postsPerDateList,
      total_counts: TotalCounts(
        mentions: element.total_counts.mentions,
        reach: element.total_counts.reach,
        engagement: element.total_counts.engagement,
        count_disqus: element.total_counts.count_disqus,
        count_facebook: element.total_counts.count_facebook,
        count_forum: element.total_counts.count_forum,
        count_instagram: element.total_counts.count_instagram,
        count_reddit: element.total_counts.count_reddit,
        count_trip_advisor: element.total_counts.count_trip_advisor,
        count_twitter: element.total_counts.count_twitter,
        count_vkontakte: element.total_counts.count_vkontakte,
        count_youtube: element.total_counts.count_youtube,
        percent_disqus: element.total_counts.percent_disqus,
        percent_facebook: element.total_counts.percent_facebook,
        percent_forum: element.total_counts.percent_forum,
        percent_instagram: element.total_counts.percent_instagram,
        percent_reddit: element.total_counts.percent_reddit,
        percent_trip_advisor: element.total_counts.percent_trip_advisor,
        percent_twitter: element.total_counts.percent_twitter,
        percent_vkontakte: element.total_counts.percent_vkontakte,
        percent_youtube: element.total_counts.percent_youtube,
        count_authors: element.total_counts.count_authors,
        count_websites: element.total_counts.count_websites,
      ),
      authors_per_date: authorsPerDateList,
      websites_per_date: websitesPerDateList,
    ));
  });

  return list;
}
