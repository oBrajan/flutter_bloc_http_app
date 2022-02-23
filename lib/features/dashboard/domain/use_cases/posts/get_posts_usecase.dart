import 'package:easy2know_flutter/core/data/app_result.dart';
import 'package:easy2know_flutter/core/use_case/usecase.dart';
import 'package:easy2know_flutter/di/injection_container.dart';
import 'package:easy2know_flutter/features/dashboard/domain/repositories/posts_repository.dart';
import 'package:equatable/equatable.dart';

class GetPostsUseCase extends UseCaseData<AppResult, PostsParams> {
  PostsRepository _repository = sl<PostsRepository>();

  @override
  Future<AppResult> execute(PostsParams params) async {
    return await _repository.getPosts(params.accountId, params.projectId);
  }
}

class PostsParams extends Equatable {
  final String accountId;
  final String projectId;

  PostsParams(this.accountId, this.projectId);

  @override
  List<Object> get props => [accountId, projectId];
}
