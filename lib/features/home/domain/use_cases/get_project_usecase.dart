import 'package:easy2know_flutter/core/data/app_result.dart';
import 'package:easy2know_flutter/core/use_case/usecase.dart';
import 'package:easy2know_flutter/di/injection_container.dart';
import 'package:easy2know_flutter/features/home/domain/entities/project.dart';
import 'package:easy2know_flutter/features/home/domain/repositories/projects_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class GetProjectUseCase extends UseCaseData<AppResult, ProjectParams> {
  final ProjectsRepository _repository = sl<ProjectsRepository>();

  @override
  Future<AppResult<Project>> execute(ProjectParams params) async {
    return await _repository.getProjectDetails(params.accountId, params.projectId);
  }
}

class ProjectParams extends Equatable {
  final String accountId;
  final String projectId;

  ProjectParams({@required this.accountId, @required this.projectId});

  @override
  List<Object> get props => [accountId, projectId];
}
