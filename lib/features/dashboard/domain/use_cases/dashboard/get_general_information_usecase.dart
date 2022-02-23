import 'package:easy2know_flutter/core/data/app_result.dart';
import 'package:easy2know_flutter/core/use_case/usecase.dart';
import 'package:easy2know_flutter/di/injection_container.dart';
import 'package:easy2know_flutter/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class GetGeneralInformationUseCase
    extends UseCaseData<AppResult, GeneralInformationParams> {
  DashboardRepository _repository = sl<DashboardRepository>();

  @override
  Future<AppResult> execute(GeneralInformationParams params) async {
    return await _repository.getGeneralInformation(
      params.accountId,
      params.projectId,
      params.topicId,
      params.timePeriod,
    );
  }
}

class GeneralInformationParams extends Equatable {
  final String accountId;
  final String projectId;
  final String topicId;
  final String timePeriod;

  GeneralInformationParams({
    @required this.accountId,
    @required this.projectId,
    @required this.topicId,
    @required this.timePeriod,
  });

  @override
  List<Object> get props => [
        accountId,
        projectId,
        topicId,
        timePeriod,
      ];
}
