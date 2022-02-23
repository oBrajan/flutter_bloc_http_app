import 'package:easy2know_flutter/core/data/app_result.dart';
import 'package:easy2know_flutter/core/error/exceptions.dart';
import 'package:easy2know_flutter/di/injection_container.dart';
import 'package:easy2know_flutter/features/home/data/local/projects_local_datasource.dart';
import 'package:easy2know_flutter/features/home/data/models/projects/projects_mapper.dart';
import 'package:easy2know_flutter/features/home/data/models/projects/projects_response.dart';
import 'package:easy2know_flutter/features/home/data/remote/projects/projects_remote_service.dart';
import 'package:easy2know_flutter/features/home/domain/entities/project.dart';

abstract class ProjectsRemoteDataSource {
  Future<AppResult<Project>> getProjectsList(String accountId);

  Future<AppResult<Project>> getProjectDetails(
      String accountId, String projectId);
}

class ProjectsRemoteDataSourceImpl implements ProjectsRemoteDataSource {
  final ProjectsRemoteService _service = sl<ProjectsRemoteService>();
  final ProjectsLocalDataSource _localDataSource =
      sl<ProjectsLocalDataSource>();

  @override
  Future<AppResult<Project>> getProjectsList(String accountId) async {
    try {
      final response =
          ProjectsResponse.fromJson(await _service.getProjectsList(accountId));

      _localDataSource.saveProjectsList(response);

      return AppResult.success(mapResponseToProject(response));
    } on ServerException catch (e) {
      return AppResult.failure(e.message);
    } on NetworkException catch (e) {
      return AppResult.failure(e.message);
    } catch (e) {
      return AppResult.failure(e.toString());
    }
  }

  @override
  Future<AppResult<Project>> getProjectDetails(
      String accountId, String projectId) async {
    try {
      final response = ProjectsResponse.fromJson(
          await _service.getProjectDetails(accountId, projectId));

      _localDataSource.saveProjectDetails(response);

      return AppResult.success(mapResponseToProject(response));
    } on ServerException catch (e) {
      return AppResult.failure(e.message);
    } on NetworkException catch (e) {
      return AppResult.failure(e.message);
    } catch (e) {
      return AppResult.failure(e.toString());
    }
  }
}
