import 'package:easy2know_flutter/core/constants/constants.dart';
import 'package:easy2know_flutter/core/network/http_manager.dart';
import 'package:easy2know_flutter/di/injection_container.dart';

abstract class AveragesRemoteService {
  Future<dynamic> getAveragesList(
    String accountId,
    String projectId,
    String topicId,
  );
}

class AveragesRemoteServiceImpl implements AveragesRemoteService {
  final HttpManager _httpManager = sl<HttpManager>();

  @override
  Future getAveragesList(
      String accountId, String projectId, String topicId) async {
    return await _httpManager.get(
        url: '/accounts/$accountId/projects/$projectId/topics/$topicId/dashboard/averages',
        headers: Constants.header);
  }
}
