import 'package:easy2know_flutter/core/constants/constants.dart';
import 'package:easy2know_flutter/core/network/http_manager.dart';
import 'package:easy2know_flutter/di/injection_container.dart';

abstract class ProjectsRemoteService {
  Future<dynamic> getProjectsList(String accountId);

  Future<dynamic> getProjectDetails(String accountId, String projectId);
}

class ProjectsRemoteServiceImpl implements ProjectsRemoteService {
  final HttpManager _httpManager = sl<HttpManager>();

  @override
  Future getProjectsList(accountId) async {
    return await _httpManager.get(url: '/accounts/$accountId/projects', headers: Constants.header);
  }

  @override
  Future getProjectDetails(String accountId, String projectId) async {
    return await _httpManager.get(
        url: '/accounts/$accountId/projects/$projectId', headers: Constants.header);
  }
}
