import 'package:easy2know_flutter/core/data/app_result.dart';
import 'package:easy2know_flutter/core/network/network_info.dart';
import 'package:easy2know_flutter/di/injection_container.dart';
import 'package:easy2know_flutter/features/home/data/local/projects_local_datasource.dart';
import 'package:easy2know_flutter/features/home/data/remote/projects/projects_remote_datasource.dart';
import 'package:easy2know_flutter/features/home/domain/entities/project.dart';
import 'package:easy2know_flutter/features/home/domain/repositories/projects_repository.dart';

class ProjectsRepositoryImpl implements ProjectsRepository {
  final NetworkInfo _networkInfo = sl<NetworkInfo>();
  final ProjectsRemoteDataSource _remoteDataSource =
      sl<ProjectsRemoteDataSource>();
  final ProjectsLocalDataSource _localDataSource = sl<ProjectsLocalDataSource>();
  final ProjectsRemoteDataSource _projectsRemoteDataSource =
      sl<ProjectsRemoteDataSource>();
  final ProjectsLocalDataSource _projectsLocalDataSource =
      sl<ProjectsLocalDataSource>();

  @override
  Future<AppResult<Project>> getProjectDetails(
      String accountId, String projectId) async {
    if (await _networkInfo.isConnected) {
      return _remoteDataSource.getProjectDetails(accountId, projectId);
    } else {
      return _localDataSource.getProjectDetails();
    }
  }

  @override
  Future<AppResult<Project>> getProjects(String accountId) async {
    if (await _networkInfo.isConnected) {
      return _projectsRemoteDataSource.getProjectsList(accountId);
    } else {
      return _projectsLocalDataSource.getProjectsList();
    }
  }
}
