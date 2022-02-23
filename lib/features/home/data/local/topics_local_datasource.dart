import 'dart:convert';

import 'package:easy2know_flutter/core/data/app_result.dart';
import 'package:easy2know_flutter/di/injection_container.dart';
import 'package:easy2know_flutter/features/home/data/models/topics/topics_mapper.dart';
import 'package:easy2know_flutter/features/home/data/models/topics/topics_response.dart';
import 'package:easy2know_flutter/features/home/domain/entities/topic.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class TopicsLocalDataSource {
  Future<AppResult<Topic>> getTopicsList();

  Future<AppResult<Topic>> getTopicDetails();

  void saveTopicsList(TopicsResponse topicsList);

  void saveTopicDetails(TopicsResponse topic);
}

const CACHED_TOPICS_LIST = 'CACHED_TOPICS_LIST';
const CACHED_TOPICS_DETAILS = 'CACHED_TOPICS_DETAILS';

class TopicsLocalDataSourceImpl implements TopicsLocalDataSource {
  static final SharedPreferences _sharedPreferences = sl<SharedPreferences>();

  @override
  Future<AppResult<Topic>> getTopicsList() async {
    final jsonString = _sharedPreferences.getString(CACHED_TOPICS_LIST);

    if (jsonString != null) {
      final result = mapResponseToTopics(
          TopicsResponse.fromJson(await json.decode(jsonString)));
      return AppResult.success(result);
    } else {
      return AppResult.failure('No data...');
    }
  }

  @override
  Future<AppResult<Topic>> getTopicDetails() async {
    final jsonString = _sharedPreferences.getString(CACHED_TOPICS_DETAILS);

    if (jsonString != null) {
      final result = mapResponseToTopics(
          TopicsResponse.fromJson(await json.decode(jsonString)));
      return AppResult.success(result);
    } else {
      return AppResult.failure('No data...');
    }
  }

  @override
  void saveTopicsList(TopicsResponse topicsList) {
    _sharedPreferences.setString(
      CACHED_TOPICS_LIST,
      json.encode(topicsList.toJson()),
    );
  }

  @override
  void saveTopicDetails(TopicsResponse topic) {
    _sharedPreferences.setString(
      CACHED_TOPICS_DETAILS,
      json.encode(topic.toJson()),
    );
  }
}
