import 'package:easy2know_flutter/core/data/app_result.dart';
import 'package:easy2know_flutter/features/home/domain/entities/query.dart';

abstract class QueriesRepository {
  Future<AppResult<Query>> getQueries(
      String accountId, String projectId, String topicId);

  Future<AppResult<Query>> getQueryDetails(
      String accountId, String projectId, String topicId, String queryId);
}
