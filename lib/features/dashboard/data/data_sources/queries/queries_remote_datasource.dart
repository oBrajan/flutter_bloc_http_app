import 'package:easy2know_flutter/core/data/app_result.dart';
import 'package:easy2know_flutter/core/error/exceptions.dart';
import 'package:easy2know_flutter/di/injection_container.dart';
import 'package:easy2know_flutter/features/dashboard/data/data_sources/queries/queries_remote_service.dart';
import 'package:easy2know_flutter/features/dashboard/data/models/queries/queries_mapper.dart';
import 'package:easy2know_flutter/features/dashboard/data/models/queries/queries_response.dart';
import 'package:easy2know_flutter/features/dashboard/domain/entities/queries/query.dart';

abstract class QueriesDashRemoteDataSource {
  Future<AppResult<Query>> getQueriesList(String accountId, String projectId,
      String topicId, String queryId, String timePeriod);
}

class QueriesDashRemoteDataSourceImpl implements QueriesDashRemoteDataSource {
  QueriesDashRemoteService _service = sl<QueriesDashRemoteService>();

  @override
  Future<AppResult<Query>> getQueriesList(String accountId, String projectId,
      String topicId, String queryId, String timePeriod) async {
    try {
      final response = QueriesResponse.fromJson(await _service.getQueriesList(
          accountId, projectId, topicId, queryId, timePeriod));

      return AppResult.success(mapResponseToQuery(response));
    } on ServerException catch (e) {
      return AppResult.failure(e.message);
    } on NetworkException catch (e) {
      return AppResult.failure(e.message);
    } catch (e) {
      return AppResult.failure(e.toString());
    }
  }
}
