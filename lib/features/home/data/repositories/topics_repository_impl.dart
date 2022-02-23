import 'package:easy2know_flutter/core/data/app_result.dart';
import 'package:easy2know_flutter/core/network/network_info.dart';
import 'package:easy2know_flutter/di/injection_container.dart';
import 'package:easy2know_flutter/features/home/data/local/topics_local_datasource.dart';
import 'package:easy2know_flutter/features/home/data/remote/topics/topics_remote_datasource.dart';
import 'package:easy2know_flutter/features/home/domain/entities/topic.dart';
import 'package:easy2know_flutter/features/home/domain/repositories/topics_repository.dart';

class TopicsRepositoryImpl implements TopicsRepository {
  final NetworkInfo _networkInfo = sl<NetworkInfo>();
  final TopicsRemoteDataSource _topicsRemoteDataSource =
      sl<TopicsRemoteDataSource>();
  final TopicsLocalDataSource _topicsLocalDataSource =
      sl<TopicsLocalDataSource>();

  @override
  Future<AppResult<Topic>> getTopics(String accountId, String projectId) async {
    if (await _networkInfo.isConnected) {
      return _topicsRemoteDataSource.getTopicsList(accountId, projectId);
    } else {
      return _topicsLocalDataSource.getTopicsList();
    }
  }

  @override
  Future<AppResult<Topic>> getTopicDetails(
      String accountId, String projectId, String topicId) async {
    if (await _networkInfo.isConnected) {
      return _topicsRemoteDataSource.getTopicDetails(
          accountId, projectId, topicId);
    } else {
      return _topicsLocalDataSource.getTopicDetails();
    }
  }
}
