import 'package:easy2know_flutter/core/data/app_result.dart';
import 'package:easy2know_flutter/core/use_case/usecase.dart';
import 'package:easy2know_flutter/di/injection_container.dart';
import 'package:easy2know_flutter/features/home/domain/entities/query.dart';
import 'package:easy2know_flutter/features/home/domain/repositories/queries_repository.dart';
import 'package:equatable/equatable.dart';

class GetQueryDetailsUseCase
    extends UseCaseData<AppResult, QueryDetailsParams> {
  QueriesRepository _repository = sl<QueriesRepository>();

  @override
  Future<AppResult<Query>> execute(params) async {
    return await _repository.getQueryDetails(
        params.accountId, params.projectId, params.topicId, params.queryId);
  }
}

class QueryDetailsParams extends Equatable {
  final String accountId;
  final String projectId;
  final String topicId;
  final String queryId;

  QueryDetailsParams({
    this.accountId,
    this.projectId,
    this.topicId,
    this.queryId,
  });

  @override
  List<Object> get props => [accountId, projectId, topicId, queryId];
}
