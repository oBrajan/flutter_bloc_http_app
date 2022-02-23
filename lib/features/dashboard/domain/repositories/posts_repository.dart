import 'package:easy2know_flutter/core/data/app_result.dart';
import 'package:easy2know_flutter/features/dashboard/domain/entities/posts/post.dart';
import 'package:easy2know_flutter/features/dashboard/domain/entities/posts/post_frequency.dart';

abstract class PostsRepository {
  Future<AppResult<Post>> getPosts(String accountId, String projectId);

  Future<AppResult<PostFrequency>> getPostsFrequency(String accountId, String projectId);
}
