import 'dart:async';
import 'package:easy2know_flutter/core/data/app_result.dart';
import 'package:easy2know_flutter/di/injection_container.dart';
import 'package:easy2know_flutter/features/home/domain/entities/topic.dart';
import 'package:easy2know_flutter/features/home/domain/use_cases/get_topic_details_usecase.dart';
import 'package:easy2know_flutter/features/home/domain/use_cases/get_topics_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './topics.dart';

class TopicsBloc extends Bloc<TopicsEvent, TopicsState> {
  final GetTopicsUseCase _getTopicsUseCase = sl<GetTopicsUseCase>();
  final GetTopicDetailsUseCase _getTopicDetailsUseCase =
      sl<GetTopicDetailsUseCase>();

  @override
  TopicsState get initialState => TopicsEmpty();

  @override
  Stream<TopicsState> mapEventToState(
    TopicsEvent event,
  ) async* {
    if (event is GetTopics) {
      yield TopicsLoading();

      final topics = await _getTopicsUseCase.execute(TopicsParams(
        accountId: event.account.id,
        projectId: event.project.id,
      ));

      switch (topics.status) {
        case Status.SUCCESS:
          List<Topic> _newTopicsList = new List<Topic>();

          for (Topic t in topics.data) {
            final topic =
                await _getTopicDetailsUseCase.execute(TopicDetailsParams(
              accountId: event.account.id,
              projectId: event.project.id,
              topicId: t.id,
            ));

            switch (topic.status) {
              case Status.SUCCESS:
                _newTopicsList.add(topic.data.first);
                break;
              case Status.FAILURE:
                yield TopicsError(message: topic.message);
                break;
            }
          }

          yield TopicsLoaded(
            account: event.account,
            project: event.project,
            topics: _newTopicsList,
          );
          break;
        case Status.FAILURE:
          yield TopicsError(message: topics.message);
          break;
      }
    }
  }
}
