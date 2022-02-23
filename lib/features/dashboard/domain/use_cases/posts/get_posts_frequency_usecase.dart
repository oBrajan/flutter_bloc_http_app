import 'package:easy2know_flutter/core/data/app_result.dart';
import 'package:easy2know_flutter/core/use_case/usecase.dart';
import 'package:easy2know_flutter/di/injection_container.dart';
import 'package:easy2know_flutter/features/dashboard/domain/repositories/posts_repository.dart';
import 'package:equatable/equatable.dart';

class GetPostsFrequencyUseCase
    extends UseCaseData<AppResult, PostsFrequencyParams> {
  PostsRepository _repository = sl<PostsRepository>();

  @override
  Future<AppResult> execute(PostsFrequencyParams params) async {
    return await _repository.getPostsFrequency(
      params.accountId,
      params.projectId,
    );
  }
}

class PostsFrequencyParams extends Equatable {
  final String accountId;
  final String projectId;

  PostsFrequencyParams(this.accountId, this.projectId);

  @override
  List<Object> get props => [accountId, projectId];
}
