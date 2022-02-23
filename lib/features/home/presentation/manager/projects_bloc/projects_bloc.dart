import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:easy2know_flutter/core/data/app_result.dart';
import 'package:easy2know_flutter/core/use_case/usecase.dart';
import 'package:easy2know_flutter/di/injection_container.dart';
import 'package:easy2know_flutter/features/home/domain/entities/project.dart';
import 'package:easy2know_flutter/features/home/domain/use_cases/get_account_usecase.dart';
import 'package:easy2know_flutter/features/home/domain/use_cases/get_project_usecase.dart';
import 'package:easy2know_flutter/features/home/domain/use_cases/get_projects_usecase.dart';
import 'package:easy2know_flutter/features/home/presentation/manager/projects_bloc/projects.dart';

class ProjectsBloc extends Bloc<ProjectsEvent, ProjectsState> {
  final GetAccountUseCase _getAccounts = sl<GetAccountUseCase>();
  final GetProjectsUseCase _getProjectsUseCase = sl<GetProjectsUseCase>();
  final GetProjectUseCase _getProjectUseCase = sl<GetProjectUseCase>();

  @override
  ProjectsState get initialState => ProjectsEmpty();

  @override
  Stream<ProjectsState> mapEventToState(
    ProjectsEvent event,
  ) async* {
    if (event is GetProjectsList) {
      yield ProjectsLoading();

      final accounts = await _getAccounts.execute(NoParams());

      switch (accounts.status) {
        case Status.SUCCESS:
          final projectsList = await _getProjectsUseCase
              .execute(ProjectsParams(accountId: accounts.data.first.id));

          switch (projectsList.status) {
            case Status.SUCCESS:
              final projectsDetails =
                  await getProjects(projectsList.data, accounts.data.first.id);

              switch (projectsDetails.status) {
                case Status.SUCCESS:
                  yield ProjectsLoaded(
                      account: accounts.data.first,
                      projects: projectsDetails.data);
                  break;
                case Status.FAILURE:
                  yield ProjectsError(message: projectsDetails.message);
                  break;
              }
              break;
            case Status.FAILURE:
              yield ProjectsError(message: projectsList.message);
              break;
          }
          break;
        case Status.FAILURE:
          yield ProjectsError(message: accounts.message);
          break;
      }
    }
  }

  Future<AppResult<Project>> getProjects(
    List<Project> projects,
    String accountId,
  ) async {
    List<Project> _newProjectsList = new List<Project>();

    for (Project p in projects) {
      final project = await _getProjectUseCase
          .execute(ProjectParams(accountId: accountId, projectId: p.id));

      switch (project.status) {
        case Status.SUCCESS:
          _newProjectsList.add(project.data.first);
          break;
        case Status.FAILURE:
          return AppResult.failure(project.message);
          break;
      }
    }

    return AppResult.success(_newProjectsList);
  }
}
