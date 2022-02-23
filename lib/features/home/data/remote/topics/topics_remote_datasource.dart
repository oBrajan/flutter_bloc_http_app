import 'package:easy2know_flutter/core/data/app_result.dart';
import 'package:easy2know_flutter/core/error/exceptions.dart';
import 'package:easy2know_flutter/di/injection_container.dart';
import 'package:easy2know_flutter/features/home/data/local/topics_local_datasource.dart';
import 'package:easy2know_flutter/features/home/data/models/topics/topics_mapper.dart';
import 'package:easy2know_flutter/features/home/data/models/topics/topics_response.dart';
import 'package:easy2know_flutter/features/home/data/remote/topics/topics_remote_service.dart';
import 'package:easy2know_flutter/features/home/domain/entities/topic.dart';

abstract class TopicsRemoteDataSource {
  Future<AppResult<Topic>> getTopicsList(String accountId, String projectId);

  Future<AppResult<Topic>> getTopicDetails(
      String accountId, String projectId, String topicId);
}

class TopicsRemoteDataSourceImpl implements TopicsRemoteDataSource {
  TopicsRemoteService _service = sl<TopicsRemoteService>();
  TopicsLocalDataSource _topicsLocalDataSource = sl<TopicsLocalDataSource>();

  @override
  Future<AppResult<Topic>> getTopicsList(
      String accountId, String projectId) async {
    try {
      final response = TopicsResponse.fromJson(
          await _service.getTopicsList(accountId, projectId));

      _topicsLocalDataSource.saveTopicsList(response);

      return AppResult.success(mapResponseToTopics(response));
    } on ServerException catch (e) {
      return AppResult.failure(e.message);
    } on NetworkException catch (e) {
      return AppResult.failure(e.message);
    } catch (e) {
      return AppResult.failure(e.toString());
    }
  }

  @override
  Future<AppResult<Topic>> getTopicDetails(
      String accountId, String projectId, String topicId) async {
    try {
      final response = TopicsResponse.fromJson(
          await _service.getTopicDetails(accountId, projectId, topicId));

      _topicsLocalDataSource.saveTopicDetails(response);

      return AppResult.success(mapResponseToTopics(response));
    } on ServerException catch (e) {
      return AppResult.failure(e.message);
    } on NetworkException catch (e) {
      return AppResult.failure(e.message);
    } catch (e) {
      return AppResult.failure(e.toString());
    }
  }
}
