import 'package:easy2know_flutter/core/data/app_result.dart';
import 'package:easy2know_flutter/core/use_case/usecase.dart';
import 'package:easy2know_flutter/di/injection_container.dart';
import 'package:easy2know_flutter/features/home/domain/entities/topic.dart';
import 'package:easy2know_flutter/features/home/domain/repositories/topics_repository.dart';
import 'package:equatable/equatable.dart';

class GetTopicsUseCase extends UseCaseData<AppResult, TopicsParams> {
  TopicsRepository _repository = sl<TopicsRepository>();

  @override
  Future<AppResult<Topic>> execute(TopicsParams params) async {
    return await _repository.getTopics(params.accountId, params.projectId);
  }
}

class TopicsParams extends Equatable {
  final String accountId;
  final String projectId;

  TopicsParams({this.accountId, this.projectId});

  @override
  List<Object> get props => [accountId, projectId];
}
