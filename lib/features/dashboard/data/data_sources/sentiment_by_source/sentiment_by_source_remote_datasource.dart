import 'package:easy2know_flutter/core/data/app_result.dart';
import 'package:easy2know_flutter/core/error/exceptions.dart';
import 'package:easy2know_flutter/di/injection_container.dart';
import 'package:easy2know_flutter/features/dashboard/data/data_sources/sentiment_by_source/sentiment_by_source_remote_service.dart';
import 'package:easy2know_flutter/features/dashboard/data/models/sentiment_by_source/sentiment_by_source_mapper.dart';
import 'package:easy2know_flutter/features/dashboard/data/models/sentiment_by_source/sentiment_by_source_response.dart';
import 'package:easy2know_flutter/features/dashboard/domain/entities/sentiment_by_source/sentiment_by_source.dart';

abstract class SentimentBySourceRemoteDataSource {
  Future<AppResult<SentimentBySource>> getSentimentBySourceList(
      String accountId, String projectId, String topicId, String timePeriod);
}

class SentimentBySourceRemoteDataSourceImpl
    implements SentimentBySourceRemoteDataSource {
  SentimentBySourceRemoteService _service =
      sl<SentimentBySourceRemoteService>();

  @override
  Future<AppResult<SentimentBySource>> getSentimentBySourceList(
      String accountId,
      String projectId,
      String topicId,
      String timePeriod) async {
    try {
      final response = SentimentBySourceResponse.fromJson(await _service
          .getSentimentBySourceList(accountId, projectId, topicId, timePeriod));

      return AppResult.success(mapResponseToSentimentBySource(response));
    } on ServerException catch (e) {
      return AppResult.failure(e.message);
    } on NetworkException catch (e) {
      return AppResult.failure(e.message);
    } catch (e) {
      return AppResult.failure(e.toString());
    }
  }
}
