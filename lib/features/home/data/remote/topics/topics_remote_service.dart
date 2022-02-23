import 'package:easy2know_flutter/core/constants/constants.dart';
import 'package:easy2know_flutter/core/network/http_manager.dart';
import 'package:easy2know_flutter/di/injection_container.dart';

abstract class TopicsRemoteService {
  Future<dynamic> getTopicsList(String accountId, String projectId);

  Future<dynamic> getTopicDetails(
      String accountId, String projectId, String topicId);
}

class TopicsRemoteServiceImpl implements TopicsRemoteService {
  final HttpManager _httpManager = sl<HttpManager>();

  @override
  Future getTopicsList(String accountId, String projectId) async {
    return await _httpManager.get(
        url: '/accounts/$accountId/projects/$projectId/topics',
        headers: Constants.header);
  }

  @override
  Future getTopicDetails(
      String accountId, String projectId, String topicId) async {
    return await _httpManager.get(
        url: '/accounts/$accountId/projects/$projectId/topics/$topicId',
        headers: Constants.header);
  }
}
