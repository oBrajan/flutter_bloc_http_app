import 'package:easy2know_flutter/features/dashboard/data/models/general_information/general_information_response.dart';
import 'package:easy2know_flutter/features/dashboard/domain/entities/general_information/general_information.dart';

List<GeneralInformation> mapResponseToGeneralInformation(
    GeneralInformationResponse response) {
  List<GeneralInformation> list = new List<GeneralInformation>();

  response.data.forEach((element) {
    list.add(GeneralInformation(
      number_of_queries: element.number_of_queries,
      number_of_posts: element.number_of_posts,
      languages: element.languages,
      locations: element.locations,
      start_date_for_time_period: element.start_date_for_time_period,
      end_date_for_time_period: element.end_date_for_time_period,
    ));
  });

  return list;
}
