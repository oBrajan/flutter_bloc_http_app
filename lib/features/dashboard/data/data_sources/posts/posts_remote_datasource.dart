import 'package:easy2know_flutter/core/data/app_result.dart';
import 'package:easy2know_flutter/core/error/exceptions.dart';
import 'package:easy2know_flutter/di/injection_container.dart';
import 'package:easy2know_flutter/features/dashboard/data/data_sources/posts/posts_remote_service.dart';
import 'package:easy2know_flutter/features/dashboard/data/models/posts/posts_mapper.dart';
import 'package:easy2know_flutter/features/dashboard/data/models/posts/posts_response.dart';
import 'package:easy2know_flutter/features/dashboard/domain/entities/posts/post.dart';

abstract class PostsRemoteDataSource {
  Future<AppResult<Post>> getPostsList(String accountId, String projectId);
}

class PostsRemoteDataSourceImpl implements PostsRemoteDataSource {
  PostsRemoteService _service = sl<PostsRemoteService>();

  @override
  Future<AppResult<Post>> getPostsList(
      String accountId, String projectId) async {
    try {
      final response = PostsResponse.fromJson(
          await _service.getPostsList(accountId, projectId));

      return AppResult.success(mapResponseToPost(response));
    } on ServerException catch (e) {
      return AppResult.failure(e.message);
    } on NetworkException catch (e) {
      return AppResult.failure(e.message);
    } catch (e) {
      return AppResult.failure(e.toString());
    }
  }
}
