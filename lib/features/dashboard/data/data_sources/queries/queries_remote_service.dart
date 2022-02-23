import 'package:easy2know_flutter/core/constants/constants.dart';
import 'package:easy2know_flutter/core/network/http_manager.dart';
import 'package:easy2know_flutter/di/injection_container.dart';

abstract class QueriesDashRemoteService {
  Future<dynamic> getQueriesList(
    String accountId,
    String projectId,
    String topicId,
    String queryId,
    String timePeriod,
  );
}

class QueriesDashRemoteServiceImpl implements QueriesDashRemoteService {
  final HttpManager _httpManager = sl<HttpManager>();

  @override
  Future getQueriesList(String accountId, String projectId, String topicId,
      String queryId, String timePeriod) async {
    Map<String, String> query = {
      'query_id': '$queryId',
      'time_period': '$timePeriod',
    };

    return await _httpManager.get(
        url:
            '/accounts/$accountId/projects/$projectId/topics/$topicId/dashboard/queries',
        query: query,
        headers: Constants.header);
  }
}
