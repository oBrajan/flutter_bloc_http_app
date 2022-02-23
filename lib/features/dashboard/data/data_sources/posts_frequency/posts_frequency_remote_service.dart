import 'package:easy2know_flutter/core/constants/constants.dart';
import 'package:easy2know_flutter/core/network/http_manager.dart';
import 'package:easy2know_flutter/di/injection_container.dart';

abstract class PostsFrequencyRemoteService {
  Future<dynamic> getPostsFrequencyList(String accountId, String projectId);
}

class PostsFrequencyRemoteServiceImpl implements PostsFrequencyRemoteService {
  final HttpManager _httpManager = sl<HttpManager>();

  @override
  Future getPostsFrequencyList(String accountId, String projectId) async {
    return await _httpManager.get(
        url: '/accounts/$accountId/projects/$projectId/posts/posts-frequency',
        headers: Constants.header);
  }
}
