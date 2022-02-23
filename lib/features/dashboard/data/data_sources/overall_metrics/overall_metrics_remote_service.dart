import 'package:easy2know_flutter/core/constants/constants.dart';
import 'package:easy2know_flutter/core/network/http_manager.dart';
import 'package:easy2know_flutter/di/injection_container.dart';

abstract class OverallMetricsRemoteService {
  Future<dynamic> getOverallMetricsList(
    String accountId,
    String projectId,
    String topicId,
    String timePeriod,
  );
}

class OverallMetricsRemoteServiceImpl implements OverallMetricsRemoteService {
  final HttpManager _httpManager = sl<HttpManager>();

  @override
  Future getOverallMetricsList(String accountId, String projectId,
      String topicId, String timePeriod) async {
    Map<String, String> query = {'time_period': '$timePeriod'};

    return await _httpManager.get(
        url:
            '/accounts/$accountId/projects/$projectId/topics/$topicId/dashboard/overall-metrics',
        query: query,
        headers: Constants.header);
  }
}
