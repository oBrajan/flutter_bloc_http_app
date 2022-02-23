import 'package:easy2know_flutter/core/data/app_result.dart';
import 'package:easy2know_flutter/core/use_case/usecase.dart';
import 'package:easy2know_flutter/di/injection_container.dart';
import 'package:easy2know_flutter/features/home/domain/entities/topic.dart';
import 'package:easy2know_flutter/features/home/domain/repositories/topics_repository.dart';
import 'package:equatable/equatable.dart';

class GetTopicDetailsUseCase
    extends UseCaseData<AppResult, TopicDetailsParams> {
  TopicsRepository _repository = sl<TopicsRepository>();

  @override
  Future<AppResult<Topic>> execute(TopicDetailsParams params) async {
    return await _repository.getTopicDetails(
        params.accountId, params.projectId, params.topicId);
  }
}

class TopicDetailsParams extends Equatable {
  final String accountId;
  final String projectId;
  final String topicId;

  TopicDetailsParams({this.accountId, this.projectId, this.topicId});

  @override
  List<Object> get props => [accountId, projectId, topicId];
}
