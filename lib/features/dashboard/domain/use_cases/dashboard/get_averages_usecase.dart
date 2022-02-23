import 'package:easy2know_flutter/core/data/app_result.dart';
import 'package:easy2know_flutter/core/use_case/usecase.dart';
import 'package:easy2know_flutter/di/injection_container.dart';
import 'package:easy2know_flutter/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class GetAveragesUseCase extends UseCaseData<AppResult, AveragesParams> {
  DashboardRepository _repository = sl<DashboardRepository>();

  @override
  Future<AppResult> execute(AveragesParams params) async {
    return await _repository.getAverages(
      params.accountId,
      params.projectId,
      params.topicId,
    );
  }
}

class AveragesParams extends Equatable {
  final String accountId;
  final String projectId;
  final String topicId;

  AveragesParams({
    @required this.accountId,
    @required this.projectId,
    @required this.topicId,
  });

  @override
  List<Object> get props => [accountId, projectId, topicId];
}
