import 'package:easy2know_flutter/features/dashboard/data/models/averages/averages_response.dart';
import 'package:easy2know_flutter/features/dashboard/domain/entities/averages/average.dart';

List<Average> mapResponseToAverages(AveragesResponse response) {
  List<Average> list = new List<Average>();

  response.data.forEach((element) {
    list.add(Average(
      day: new AverageData(
        reach: element.day.reach,
        engagement: element.day.engagement,
        numberOfPosts: element.day.number_of_posts,
      ),
      week: new AverageData(
        reach: element.week.reach,
        engagement: element.week.engagement,
        numberOfPosts: element.week.number_of_posts,
      ),
      month: new AverageData(
        reach: element.month.reach,
        engagement: element.month.engagement,
        numberOfPosts: element.month.number_of_posts,
      ),
    ));
  });

  return list;
}
