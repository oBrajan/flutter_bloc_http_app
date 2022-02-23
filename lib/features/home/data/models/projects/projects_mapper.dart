import 'package:easy2know_flutter/features/home/data/models/projects/projects_response.dart';
import 'package:easy2know_flutter/features/home/domain/entities/project.dart';

List<Project> mapResponseToProject(ProjectsResponse response) {
  List<Project> list = new List<Project>();

  response.data.forEach((element) {
    list.add(Project(
        id: element.id,
        name: element.name,
        createdDate: element.created_date,
        endDate: element.end_date,
        active: element.active,
        currentNumberOfTopics: element.current_number_of_topics,
        currentNumberOfPosts: element.current_number_of_posts));
  });

  return list;
}
