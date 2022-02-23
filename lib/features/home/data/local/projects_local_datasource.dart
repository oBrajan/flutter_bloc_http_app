import 'dart:convert';
import 'package:easy2know_flutter/core/data/app_result.dart';
import 'package:easy2know_flutter/di/injection_container.dart';
import 'package:easy2know_flutter/features/home/data/models/projects/projects_mapper.dart';
import 'package:easy2know_flutter/features/home/data/models/projects/projects_response.dart';
import 'package:easy2know_flutter/features/home/domain/entities/project.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProjectsLocalDataSource {
  Future<AppResult<Project>> getProjectsList();

  void saveProjectsList(ProjectsResponse projectsList);

  Future<AppResult<Project>> getProjectDetails();

  void saveProjectDetails(ProjectsResponse project);
}

const CACHED_PROJECTS_LIST = 'CACHED_PROJECTS_LIST_DATA';
const CACHED_PROJECT_DETAILS = 'CACHED_PROJECT_DATA';

class ProjectsLocalDataSourceImpl implements ProjectsLocalDataSource {
  static final SharedPreferences _sharedPreferences = sl<SharedPreferences>();

  @override
  Future<AppResult<Project>> getProjectsList() async {
    final jsonString = _sharedPreferences.getString(CACHED_PROJECTS_LIST);

    if (jsonString != null) {
      final result = mapResponseToProject(
          ProjectsResponse.fromJson(await json.decode(jsonString)));
      return AppResult.success(result);
    } else {
      return AppResult.failure('No data...');
    }
  }

  @override
  void saveProjectsList(ProjectsResponse projectsList) {
    _sharedPreferences.setString(
      CACHED_PROJECTS_LIST,
      json.encode(projectsList.toJson()),
    );
  }

  @override
  Future<AppResult<Project>> getProjectDetails() async {
    final jsonString = _sharedPreferences.getString(CACHED_PROJECT_DETAILS);

    if (jsonString != null) {
      final result = mapResponseToProject(
          ProjectsResponse.fromJson(await json.decode(jsonString)));
      return AppResult.success(result);
    } else {
      return AppResult.failure('No data...');
    }
  }

  @override
  void saveProjectDetails(ProjectsResponse project) {
    _sharedPreferences.setString(
      CACHED_PROJECT_DETAILS,
      json.encode(project.toJson()),
    );
  }
}
