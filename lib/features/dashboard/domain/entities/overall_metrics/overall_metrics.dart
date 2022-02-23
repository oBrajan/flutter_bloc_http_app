import 'package:equatable/equatable.dart';

class OverallMetrics extends Equatable {
  final List<PostsPerDate> posts_per_date;
  final TotalCounts total_counts;
  final List<AuthorsPerDate> authors_per_date;
  final List<WebsitesPerDate> websites_per_date;

  OverallMetrics({
    this.posts_per_date,
    this.total_counts,
    this.authors_per_date,
    this.websites_per_date,
  });

  @override
  List<Object> get props => [
        posts_per_date,
        total_counts,
        authors_per_date,
        websites_per_date,
      ];
}

class PostsPerDate extends Equatable {
  final int reach;
  final int engagement;
  final int mentions;
  final int sentiment_negative;
  final int sentiment_positive;
  final int sentiment_neutral;
  final int sentiment_undefined;
  final String created_time_short;

  PostsPerDate({
    this.reach,
    this.engagement,
    this.mentions,
    this.sentiment_negative,
    this.sentiment_positive,
    this.sentiment_neutral,
    this.sentiment_undefined,
    this.created_time_short,
  });

  @override
  List<Object> get props => [
        reach,
        engagement,
        mentions,
        sentiment_negative,
        sentiment_positive,
        sentiment_neutral,
        sentiment_undefined,
        created_time_short,
      ];
}

class TotalCounts extends Equatable {
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

  TotalCounts({
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

  @override
  List<Object> get props => [
        this.mentions,
        reach,
        engagement,
        count_disqus,
        count_facebook,
        count_forum,
        count_instagram,
        count_reddit,
        count_trip_advisor,
        count_twitter,
        count_vkontakte,
        count_youtube,
        percent_disqus,
        percent_facebook,
        percent_forum,
        percent_instagram,
        percent_reddit,
        percent_trip_advisor,
        percent_twitter,
        percent_vkontakte,
        percent_youtube,
        count_authors,
        count_websites,
      ];
}

class AuthorsPerDate extends Equatable {
  final String created_time_short;
  final int count_authors;

  AuthorsPerDate({this.created_time_short, this.count_authors});

  @override
  List<Object> get props => [created_time_short, count_authors];
}

class WebsitesPerDate extends Equatable {
  final int count_websites;
  final String created_time_short;

  WebsitesPerDate({this.count_websites, this.created_time_short});

  @override
  List<Object> get props => [created_time_short, count_websites];
}
