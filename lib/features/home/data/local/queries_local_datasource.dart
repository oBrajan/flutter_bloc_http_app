import 'dart:convert';

import 'package:easy2know_flutter/core/data/app_result.dart';
import 'package:easy2know_flutter/di/injection_container.dart';
import 'package:easy2know_flutter/features/home/data/models/queries/queries_mapper.dart';
import 'package:easy2know_flutter/features/home/data/models/queries/queries_response.dart';
import 'package:easy2know_flutter/features/home/domain/entities/query.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class QueriesLocalDataSource {
  Future<AppResult<Query>> getQueriesList();

  Future<AppResult<Query>> getQueryDetails();

  void saveQueriesList(QueriesResponse queries);

  void saveQueryDetails(QueriesResponse query);
}

const CACHED_QUERIES_LIST = 'CACHED_TOPICS_LIST';
const CACHED_QUERY_DETAILS = 'CACHED_TOPICS_DETAILS';

class QueriesLocalDataSourceImpl implements QueriesLocalDataSource {
  static final SharedPreferences _sharedPreferences = sl<SharedPreferences>();

  @override
  Future<AppResult<Query>> getQueriesList() async {
    final jsonString = _sharedPreferences.getString(CACHED_QUERIES_LIST);

    if (jsonString != null) {
      final result = mapResponseToQuery(
          QueriesResponse.fromJson(await json.decode(jsonString)));
      return AppResult.success(result);
    } else {
      return AppResult.failure('No data...');
    }
  }

  @override
  Future<AppResult<Query>> getQueryDetails() async {
    final jsonString = _sharedPreferences.getString(CACHED_QUERY_DETAILS);

    if (jsonString != null) {
      final result = mapResponseToQuery(
          QueriesResponse.fromJson(await json.decode(jsonString)));
      return AppResult.success(result);
    } else {
      return AppResult.failure('No data...');
    }
  }

  @override
  void saveQueriesList(QueriesResponse queriesResponse) {
    _sharedPreferences.setString(
      CACHED_QUERIES_LIST,
      json.encode(queriesResponse.toJson()),
    );
  }

  @override
  void saveQueryDetails(QueriesResponse queriesResponse) {
    _sharedPreferences.setString(
      CACHED_QUERY_DETAILS,
      json.encode(queriesResponse.toJson()),
    );
  }
}
