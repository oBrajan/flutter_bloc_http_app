import 'package:easy2know_flutter/core/constants/constants.dart';
import 'package:easy2know_flutter/core/network/http_manager.dart';
import 'package:easy2know_flutter/di/injection_container.dart';

abstract class SentimentBySourceRemoteService {
  Future<dynamic> getSentimentBySourceList(
    String accountId,
    String projectId,
    String topicId,
    String timePeriod,
  );
}

class SentimentBySourceRemoteServiceImpl
    implements SentimentBySourceRemoteService {
  final HttpManager _httpManager = sl<HttpManager>();

  @override
  Future getSentimentBySourceList(String accountId, String projectId,
      String topicId, String timePeriod) async {
    Map<String, String> query = {
      'time_period': '$timePeriod',
    };

    return await _httpManager.get(
        url:
            '/accounts/$accountId/projects/$projectId/topics/$topicId/dashboard/sentiment-by-source',
        query: query,
        headers: Constants.header);
  }
}
