import 'package:easy2know_flutter/core/data/app_result.dart';
import 'package:easy2know_flutter/features/home/domain/entities/project.dart';

abstract class ProjectsRepository {
  Future<AppResult<Project>> getProjects(String accountId);

  Future<AppResult<Project>> getProjectDetails(String accountId, String projectId);
}
