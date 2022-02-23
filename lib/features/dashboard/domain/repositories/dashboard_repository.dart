import 'package:easy2know_flutter/core/data/app_result.dart';
import 'package:easy2know_flutter/features/dashboard/domain/entities/averages/average.dart';
import 'package:easy2know_flutter/features/dashboard/domain/entities/general_information/general_information.dart';
import 'package:easy2know_flutter/features/dashboard/domain/entities/overall_metrics/overall_metrics.dart';
import 'package:easy2know_flutter/features/dashboard/domain/entities/queries/query.dart';
import 'package:easy2know_flutter/features/dashboard/domain/entities/sentiment_by_source/sentiment_by_source.dart';
import 'package:easy2know_flutter/features/dashboard/domain/entities/top_influencers/top_influencer.dart';

abstract class DashboardRepository {
  Future<AppResult<Average>> getAverages(
    String accountId,
    String projectId,
    String topicId,
  );

  Future<AppResult<GeneralInformation>> getGeneralInformation(
    String accountId,
    String projectId,
    String topicId,
    String timePeriod,
  );

  Future<AppResult<OverallMetrics>> getOverallMetrics(
    String accountId,
    String projectId,
    String topicId,
    String timePeriod,
  );

  Future<AppResult<Query>> getQueries(
    String accountId,
    String projectId,
    String topicId,
    String queryId,
    String timePeriod,
  );

  Future<AppResult<SentimentBySource>> getSentimentBySource(
    String accountId,
    String projectId,
    String topicId,
    String timePeriod,
  );

  Future<AppResult<TopInfluencer>> getTopInfluencer(
    String accountId,
    String projectId,
    String topicId,
    String queryId,
    String timePeriod,
    int limit,
  );
}
