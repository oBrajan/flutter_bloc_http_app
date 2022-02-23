import 'package:equatable/equatable.dart';

class SentimentBySource extends Equatable {
  final List<PostPerDate> posts_per_date;
  final PostsCount posts;
  final PostsCount authors;

  SentimentBySource({this.posts_per_date, this.posts, this.authors});

  @override
  List<Object> get props => [posts_per_date, posts, authors];
}

class PostPerDate extends Equatable {
  final int count_negative;
  final int count_positive;
  final int count_neutral;
  final int count_undefined;
  final int source_id;
  final String created_time_short;

  PostPerDate({
    this.count_negative,
    this.count_positive,
    this.count_neutral,
    this.count_undefined,
    this.source_id,
    this.created_time_short,
  });

  @override
  List<Object> get props => [
        count_negative,
        count_positive,
        count_neutral,
        count_undefined,
        source_id,
        created_time_short,
      ];
}

class PostsCount extends Equatable {
  final int count;

  PostsCount({this.count});

  @override
  List<Object> get props => [count];
}
