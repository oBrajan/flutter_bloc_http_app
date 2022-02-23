import 'package:easy2know_flutter/features/dashboard/data/models/posts_frequency/posts_frequency_response.dart';
import 'package:easy2know_flutter/features/dashboard/domain/entities/posts/post_frequency.dart';

List<PostFrequency> mapResponseToPostFrequency(PostsFrequencyResponse response) {
  List<PostFrequency> list = new List<PostFrequency>();

  response.data.forEach((element) {
    list.add(PostFrequency(
      count: element.count,
      created_time_short: element.created_time_short,
    ));
  });

  return list;
}
