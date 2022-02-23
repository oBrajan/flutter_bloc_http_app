import 'package:easy2know_flutter/core/constants/constants.dart';
import 'package:easy2know_flutter/core/network/http_manager.dart';
import 'package:easy2know_flutter/di/injection_container.dart';

abstract class PostsRemoteService {
  Future<dynamic> getPostsList(String accountId, String projectId);
}

class PostsRemoteServiceImpl implements PostsRemoteService {
  final HttpManager _httpManager = sl<HttpManager>();

  @override
  Future getPostsList(String accountId, String projectId) async {
    return await _httpManager.get(
        url: '/accounts/$accountId/projects/$projectId/posts',
        headers: Constants.header);
  }
}
