import 'package:easy2know_flutter/core/data/app_result.dart';
import 'package:easy2know_flutter/di/injection_container.dart';
import 'package:easy2know_flutter/features/home/data/models/queries/queries_mapper.dart';
import 'package:easy2know_flutter/features/home/data/models/queries/queries_response.dart';
import 'package:easy2know_flutter/features/home/data/remote/queries/queries_remote_service.dart';
import 'package:easy2know_flutter/features/home/domain/entities/query.dart';
import 'package:easy2know_flutter/core/error/exceptions.dart';

abstract class QueriesRemoteDataSource {
  Future<AppResult<Query>> getQueriesList(
      String accountId, String projectId, String topicId);

  Future<AppResult<Query>> getQueryDetails(
      String accountId, String projectId, String topicId, String queryId);
}

class QueriesRemoteDataSourceImpl implements QueriesRemoteDataSource {
  QueriesRemoteService _service = sl<QueriesRemoteService>();

  @override
  Future<AppResult<Query>> getQueriesList(
      String accountId, String projectId, String topicId) async {
    try {
      final response = QueriesResponse.fromJson(
          await _service.getQueriesList(accountId, projectId, topicId));

//      _queriesLocalDataSource.saveQueriesList(response);

      return AppResult.success(mapResponseToQuery(response));
    } on ServerException catch (e) {
      return AppResult.failure(e.message);
    } on NetworkException catch (e) {
      return AppResult.failure(e.message);
    } catch (e) {
      return AppResult.failure(e.toString());
    }
  }

  @override
  Future<AppResult<Query>> getQueryDetails(String accountId, String projectId,
      String topicId, String queryId) async {
    try {
      final response = QueriesResponse.fromJson(await _service.getQueryDetails(
          accountId, projectId, topicId, queryId));

//      _queriesLocalDataSource.saveQueryDetails(response);

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
