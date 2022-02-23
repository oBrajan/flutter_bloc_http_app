import 'package:easy2know_flutter/core/constants/constants.dart';
import 'package:easy2know_flutter/core/network/http_manager.dart';
import 'package:easy2know_flutter/di/injection_container.dart';

abstract class TopInfluencerRemoteService {
  Future<dynamic> getTopInfluencerList(
    String accountId,
    String projectId,
    String topicId,
    String queryId,
    int limit,
    String timePeriod,
  );
}

class TopInfluencerRemoteServiceImpl implements TopInfluencerRemoteService {
  final HttpManager _httpManager = sl<HttpManager>();

  @override
  Future getTopInfluencerList(String accountId, String projectId,
      String topicId, String queryId, int limit, String timePeriod) async {
    Map<String, String> query = {
      'query_id': '$queryId',
      'limit': '$limit',
      'time_period': '$timePeriod',
    };

    return await _httpManager.get(
        url:
            '/accounts/$accountId/projects/$projectId/topics/$topicId/dashboard/top-influencers',
        query: query,
        headers: Constants.header);
  }
}
