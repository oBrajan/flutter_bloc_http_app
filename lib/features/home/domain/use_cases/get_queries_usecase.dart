import 'package:easy2know_flutter/core/data/app_result.dart';
import 'package:easy2know_flutter/core/use_case/usecase.dart';
import 'package:easy2know_flutter/di/injection_container.dart';
import 'package:easy2know_flutter/features/home/domain/entities/query.dart';
import 'package:easy2know_flutter/features/home/domain/repositories/queries_repository.dart';
import 'package:equatable/equatable.dart';

class GetQueriesUseCase extends UseCaseData<AppResult, QueriesParams> {
  QueriesRepository _repository = sl<QueriesRepository>();

  @override
  Future<AppResult<Query>> execute(QueriesParams params) async {
    return await _repository.getQueries(
        params.accountId, params.projectId, params.topicId);
  }
}

class QueriesParams extends Equatable {
  final String accountId;
  final String projectId;
  final String topicId;

  QueriesParams({this.accountId, this.projectId, this.topicId});

  @override
  List<Object> get props => [accountId, projectId, topicId];
}
