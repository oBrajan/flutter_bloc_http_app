import 'package:easy2know_flutter/core/data/app_result.dart';
import 'package:easy2know_flutter/core/network/network_info.dart';
import 'package:easy2know_flutter/di/injection_container.dart';
import 'package:easy2know_flutter/features/dashboard/data/data_sources/averages/averages_remote_datasource.dart';
import 'package:easy2know_flutter/features/dashboard/data/data_sources/general_information/general_information_remote_datasource.dart';
import 'package:easy2know_flutter/features/dashboard/data/data_sources/overall_metrics/overall_metrics_remote_datasource.dart';
import 'package:easy2know_flutter/features/dashboard/data/data_sources/queries/queries_remote_datasource.dart';
import 'package:easy2know_flutter/features/dashboard/data/data_sources/sentiment_by_source/sentiment_by_source_remote_datasource.dart';
import 'package:easy2know_flutter/features/dashboard/data/data_sources/top_influencer/top_influencer_remote_datasource.dart';
import 'package:easy2know_flutter/features/dashboard/domain/entities/averages/average.dart';
import 'package:easy2know_flutter/features/dashboard/domain/entities/general_information/general_information.dart';
import 'package:easy2know_flutter/features/dashboard/domain/entities/overall_metrics/overall_metrics.dart';
import 'package:easy2know_flutter/features/dashboard/domain/entities/queries/query.dart';
import 'package:easy2know_flutter/features/dashboard/domain/entities/sentiment_by_source/sentiment_by_source.dart';
import 'package:easy2know_flutter/features/dashboard/domain/entities/top_influencers/top_influencer.dart';
import 'package:easy2know_flutter/features/dashboard/domain/repositories/dashboard_repository.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final NetworkInfo _networkInfo = sl<NetworkInfo>();
  final AveragesRemoteDataSource _averagesRemoteDataSource =
      sl<AveragesRemoteDataSource>();
  final GeneralInformationRemoteDataSource _generalInformationRemoteDataSource =
      sl<GeneralInformationRemoteDataSource>();
  final OverallMetricsRemoteDataSource _overallMetricsRemoteDataSource =
      sl<OverallMetricsRemoteDataSource>();
  final QueriesDashRemoteDataSource _queriesRemoteDataSource =
      sl<QueriesDashRemoteDataSource>();
  final SentimentBySourceRemoteDataSource _sentimentBySourceRemoteDataSource =
      sl<SentimentBySourceRemoteDataSource>();
  final TopInfluencerRemoteDataSource _influencerRemoteDataSource =
      sl<TopInfluencerRemoteDataSource>();

  @override
  Future<AppResult<Average>> getAverages(
      String accountId, String projectId, String topicId) async {
    if (await _networkInfo.isConnected) {
      return _averagesRemoteDataSource.getAveragesList(
          accountId, projectId, topicId);
    } else {
      // TODO: Local data source
      throw UnimplementedError();
    }
  }

  @override
  Future<AppResult<GeneralInformation>> getGeneralInformation(String accountId,
      String projectId, String topicId, String timePeriod) async {
    if (await _networkInfo.isConnected) {
      return _generalInformationRemoteDataSource.getGeneralInformationList(
          accountId, projectId, topicId, timePeriod);
    } else {
      // TODO: Local data source
      throw UnimplementedError();
    }
  }

  @override
  Future<AppResult<OverallMetrics>> getOverallMetrics(String accountId,
      String projectId, String topicId, String timePeriod) async {
    if (await _networkInfo.isConnected) {
      return _overallMetricsRemoteDataSource.getOverallMetricsList(
          accountId, projectId, topicId, timePeriod);
    } else {
      // TODO: Local data source
      throw UnimplementedError();
    }
  }

  @override
  Future<AppResult<Query>> getQueries(String accountId, String projectId,
      String topicId, String queryId, String timePeriod) async {
    if (await _networkInfo.isConnected) {
      return _queriesRemoteDataSource.getQueriesList(
          accountId, projectId, topicId, queryId, timePeriod);
    } else {
      // TODO: Local data source
      throw UnimplementedError();
    }
  }

  @override
  Future<AppResult<SentimentBySource>> getSentimentBySource(String accountId,
      String projectId, String topicId, String timePeriod) async {
    if (await _networkInfo.isConnected) {
      return _sentimentBySourceRemoteDataSource.getSentimentBySourceList(
          accountId, projectId, topicId, timePeriod);
    } else {
      // TODO: Local data source
      throw UnimplementedError();
    }
  }

  @override
  Future<AppResult<TopInfluencer>> getTopInfluencer(
      String accountId,
      String projectId,
      String topicId,
      String queryId,
      String timePeriod,
      int limit) async {
    if (await _networkInfo.isConnected) {
      return _influencerRemoteDataSource.getTopInfluencerList(
          accountId, projectId, topicId, queryId, limit, timePeriod);
    } else {
      // TODO: Local data source
      throw UnimplementedError();
    }
  }
}
