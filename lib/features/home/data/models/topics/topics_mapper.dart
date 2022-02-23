import 'package:easy2know_flutter/features/home/data/models/topics/topics_response.dart';
import 'package:easy2know_flutter/features/home/domain/entities/topic.dart';

List<Topic> mapResponseToTopics(TopicsResponse response) {
  List<Topic> list = new List<Topic>();

  response.data.forEach((element) {
    list.add(Topic(
      id: element.id,
      name: element.name,
      locations: element.locations,
      languages: element.languages,
      startDate: element.start_date,
      endDate: element.end_date,
      currentNumberOfQueries: element.current_number_of_queries,
      currentNumberOfPosts: element.current_number_of_posts,
    ));
  });

  return list;
}
