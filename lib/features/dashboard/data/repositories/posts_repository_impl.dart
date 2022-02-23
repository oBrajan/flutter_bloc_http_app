import 'package:easy2know_flutter/core/data/app_result.dart';
import 'package:easy2know_flutter/core/network/network_info.dart';
import 'package:easy2know_flutter/di/injection_container.dart';
import 'package:easy2know_flutter/features/dashboard/data/data_sources/posts/posts_remote_datasource.dart';
import 'package:easy2know_flutter/features/dashboard/data/data_sources/posts_frequency/posts_frequency_datasource.dart';
import 'package:easy2know_flutter/features/dashboard/domain/entities/posts/post.dart';
import 'package:easy2know_flutter/features/dashboard/domain/entities/posts/post_frequency.dart';
import 'package:easy2know_flutter/features/dashboard/domain/repositories/posts_repository.dart';

class PostsRepositoryImpl extends PostsRepository {
  final NetworkInfo _networkInfo = sl<NetworkInfo>();
  final PostsRemoteDataSource _postsRemoteDataSource =
      sl<PostsRemoteDataSource>();
  final PostsFrequencyRemoteDataSource _postsFrequencyRemoteDataSource =
      sl<PostsFrequencyRemoteDataSource>();

  @override
  Future<AppResult<Post>> getPosts(String accountId, String projectId) async {
    if (await _networkInfo.isConnected) {
      return _postsRemoteDataSource.getPostsList(accountId, projectId);
    } else {
      // TODO: Local data source
      throw UnimplementedError();
//      return _localDataSource.getPostsList();
    }
  }

  @override
  Future<AppResult<PostFrequency>> getPostsFrequency(
      String accountId, String projectId) async {
    if (await _networkInfo.isConnected) {
      return _postsFrequencyRemoteDataSource.getPostsFrequencyList(accountId, projectId);
    } else {
      // TODO: Local data source
      throw UnimplementedError();
//      return _localDataSource.getPostsList();
    }
  }
}
