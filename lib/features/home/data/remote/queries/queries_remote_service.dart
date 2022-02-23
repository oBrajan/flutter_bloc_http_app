import 'package:easy2know_flutter/core/constants/constants.dart';
import 'package:easy2know_flutter/core/network/http_manager.dart';
import 'package:easy2know_flutter/di/injection_container.dart';

abstract class QueriesRemoteService {
  Future<dynamic> getQueriesList(
      String accountId, String projectId, String topicId);

  Future<dynamic> getQueryDetails(
      String accountId, String projectId, String topicId, String queryId);
}

class QueriesRemoteServiceImpl implements QueriesRemoteService {
  final HttpManager _httpManager = sl<HttpManager>();

  @override
  Future getQueriesList(
      String accountId, String projectId, String topicId) async {
    return await _httpManager.get(
        url: '/accounts/$accountId/projects/$projectId/topics/$topicId/queries',
        headers: Constants.header);
  }

  @override
  Future getQueryDetails(String accountId, String projectId, String topicId,
      String queryId) async {
    return await _httpManager.get(
        url:
            '/accounts/$accountId/projects/$projectId/topics/$topicId/queries/$queryId',
        headers: Constants.header);
  }
}
