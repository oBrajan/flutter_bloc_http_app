import 'package:easy2know_flutter/features/home/data/models/accounts/account_data_response.dart';
import 'package:easy2know_flutter/features/home/domain/entities/account.dart';

List<Account> mapResponseToAccounts(AccountResponse response) {
  List<Account> list = new List<Account>();

  response.data.forEach((element) {
    list.add(
      Account(
        id: element.id,
        name: element.name,
        email: element.email,
        active: element.active,
        timeCreated: element.time_created,
        dataGatheringCycle: element.data_gathering_cycle,
        maxNumberOfProjects: element.max_number_of_projects,
        maxNumberOfPosts: element.max_number_of_posts,
        maxNumberOfQueries: element.max_number_of_queries,
        maxNumberOfTopics: element.max_number_of_topics,
        currentNumberOfProjects: element.current_number_of_projects,
        currentNumberOfPosts: element.current_number_of_posts,
        currentNumberOfQueries: element.current_number_of_queries,
        currentNumberOfTopics: element.current_number_of_topics,
      ),
    );
  });

  return list;
}
