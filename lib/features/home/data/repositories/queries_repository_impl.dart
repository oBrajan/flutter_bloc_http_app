import 'package:easy2know_flutter/core/data/app_result.dart';
import 'package:easy2know_flutter/core/network/network_info.dart';
import 'package:easy2know_flutter/di/injection_container.dart';
import 'package:easy2know_flutter/features/home/data/local/queries_local_datasource.dart';
import 'package:easy2know_flutter/features/home/data/remote/queries/queries_remote_datasource.dart';
import 'package:easy2know_flutter/features/home/domain/entities/query.dart';
import 'package:easy2know_flutter/features/home/domain/repositories/queries_repository.dart';

class QueriesRepositoryImpl implements QueriesRepository {
  final NetworkInfo _networkInfo = sl<NetworkInfo>();
  final QueriesRemoteDataSource _remoteDataSource =
      sl<QueriesRemoteDataSource>();
  final QueriesLocalDataSource _localDataSource = sl<QueriesLocalDataSource>();

  @override
  Future<AppResult<Query>> getQueries(
      String accountId, String projectId, String topicId) async {
    if (await _networkInfo.isConnected) {
      return _remoteDataSource.getQueriesList(accountId, projectId, topicId);
    } else {
      return _localDataSource.getQueriesList();
    }
  }

  @override
  Future<AppResult<Query>> getQueryDetails(String accountId, String projectId,
      String topicId, String queryId) async {
    if (await _networkInfo.isConnected) {
      return _remoteDataSource.getQueryDetails(
          accountId, projectId, topicId, queryId);
    } else {
      return _localDataSource.getQueryDetails();
    }
  }
}
