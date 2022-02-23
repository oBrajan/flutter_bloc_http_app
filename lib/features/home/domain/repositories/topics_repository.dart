import 'package:easy2know_flutter/core/data/app_result.dart';
import 'package:easy2know_flutter/features/home/domain/entities/topic.dart';

abstract class TopicsRepository {
  Future<AppResult<Topic>> getTopics(String accountId, String projectId);

  Future<AppResult<Topic>> getTopicDetails(
      String accountId, String projectId, String topicId);
}
