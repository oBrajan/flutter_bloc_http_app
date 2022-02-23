import 'package:easy2know_flutter/core/data/app_result.dart';
import 'package:easy2know_flutter/core/error/exceptions.dart';
import 'package:easy2know_flutter/di/injection_container.dart';
import 'package:easy2know_flutter/features/dashboard/data/data_sources/top_influencer/top_influencer_remote_service.dart';
import 'package:easy2know_flutter/features/dashboard/data/models/top_influencers/top_influencer_mapper.dart';
import 'package:easy2know_flutter/features/dashboard/data/models/top_influencers/top_influencer_response.dart';
import 'package:easy2know_flutter/features/dashboard/domain/entities/top_influencers/top_influencer.dart';

abstract class TopInfluencerRemoteDataSource {
  Future<AppResult<TopInfluencer>> getTopInfluencerList(
    String accountId,
    String projectId,
    String topicId,
    String queryId,
    int limit,
    String timePeriod,
  );
}

class TopInfluencerRemoteDataSourceImpl
    implements TopInfluencerRemoteDataSource {
  TopInfluencerRemoteService _service = sl<TopInfluencerRemoteService>();

  @override
  Future<AppResult<TopInfluencer>> getTopInfluencerList(
      String accountId,
      String projectId,
      String topicId,
      String queryId,
      int limit,
      String timePeriod) async {
    try {
      final response = TopInfluencerResponse.fromJson(
          await _service.getTopInfluencerList(
              accountId, projectId, topicId, queryId, limit, timePeriod));

      return AppResult.success(mapResponseToInfluencer(response));
    } on ServerException catch (e) {
      return AppResult.failure(e.message);
    } on NetworkException catch (e) {
      return AppResult.failure(e.message);
    } catch (e) {
      return AppResult.failure(e.toString());
    }
  }
}
