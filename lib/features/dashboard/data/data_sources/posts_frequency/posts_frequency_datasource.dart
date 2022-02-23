import 'package:easy2know_flutter/core/data/app_result.dart';
import 'package:easy2know_flutter/core/error/exceptions.dart';
import 'package:easy2know_flutter/di/injection_container.dart';
import 'package:easy2know_flutter/features/dashboard/data/data_sources/posts_frequency/posts_frequency_remote_service.dart';
import 'package:easy2know_flutter/features/dashboard/data/models/posts_frequency/posts_frequency_mapper.dart';
import 'package:easy2know_flutter/features/dashboard/data/models/posts_frequency/posts_frequency_response.dart';
import 'package:easy2know_flutter/features/dashboard/domain/entities/posts/post_frequency.dart';

abstract class PostsFrequencyRemoteDataSource {
  Future<AppResult<PostFrequency>> getPostsFrequencyList(
      String accountId, String projectId);
}

class PostsFrequencyRemoteDataSourceImpl implements PostsFrequencyRemoteDataSource {
  PostsFrequencyRemoteService _service = sl<PostsFrequencyRemoteService>();

  @override
  Future<AppResult<PostFrequency>> getPostsFrequencyList(
      String accountId, String projectId) async {
    try {
      final response = PostsFrequencyResponse.fromJson(
          await _service.getPostsFrequencyList(accountId, projectId));

      return AppResult.success(mapResponseToPostFrequency(response));
    } on ServerException catch (e) {
      return AppResult.failure(e.message);
    } on NetworkException catch (e) {
      return AppResult.failure(e.message);
    } catch (e) {
      return AppResult.failure(e.toString());
    }
  }
}
