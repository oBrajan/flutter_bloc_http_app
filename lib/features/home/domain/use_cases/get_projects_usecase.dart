import 'package:easy2know_flutter/core/data/app_result.dart';
import 'package:easy2know_flutter/core/use_case/usecase.dart';
import 'package:easy2know_flutter/di/injection_container.dart';
import 'package:easy2know_flutter/features/home/domain/entities/project.dart';
import 'package:easy2know_flutter/features/home/domain/repositories/projects_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class GetProjectsUseCase extends UseCaseData<AppResult, ProjectsParams> {
  final ProjectsRepository _repository = sl<ProjectsRepository>();

  @override
  Future<AppResult<Project>> execute(ProjectsParams params) async {
    return await _repository.getProjects(params.accountId);
  }
}

class ProjectsParams extends Equatable {
  final String accountId;

  ProjectsParams({@required this.accountId});

  @override
  List<Object> get props => [accountId];
}
