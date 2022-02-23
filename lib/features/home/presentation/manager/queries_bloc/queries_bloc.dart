import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:easy2know_flutter/core/data/app_result.dart';
import 'package:easy2know_flutter/di/injection_container.dart';
import 'package:easy2know_flutter/features/home/domain/entities/query.dart';
import 'package:easy2know_flutter/features/home/domain/use_cases/get_queries_usecase.dart';
import 'package:easy2know_flutter/features/home/domain/use_cases/get_query_details_usecase.dart';
import './queries.dart';

class QueriesBloc extends Bloc<QueriesEvent, QueriesState> {
  GetQueriesUseCase _getQueriesUseCase = sl<GetQueriesUseCase>();
  GetQueryDetailsUseCase _getQueryDetailsUseCase = sl<GetQueryDetailsUseCase>();

  @override
  QueriesState get initialState => QueriesEmpty();

  @override
  Stream<QueriesState> mapEventToState(
    QueriesEvent event,
  ) async* {
    if (event is GetQueries) {
      yield QueriesLoading();

      final queries = await _getQueriesUseCase.execute(QueriesParams(
        accountId: event.account.id,
        projectId: event.project.id,
        topicId: event.topic.id,
      ));

      switch (queries.status) {
        case Status.SUCCESS:
          final queryDetails = await getQueries(
            event.account.id,
            event.project.id,
            event.topic.id,
            queries.data,
          );

          switch (queryDetails.status) {
            case Status.SUCCESS:
              yield QueriesLoaded(
                account: event.account,
                project: event.project,
                topic: event.topic,
                queries: queryDetails.data,
              );
              break;
            case Status.FAILURE:
              yield QueriesError(message: queryDetails.message);
              break;
          }

          break;
        case Status.FAILURE:
          yield QueriesError(message: queries.message);
          break;
      }
    }
  }

  Future<AppResult<Query>> getQueries(
    String accountId,
    String projectId,
    String topicId,
    List<Query> queries,
  ) async {
    List<Query> _newQueriesList = new List<Query>();

    for (Query q in queries) {
      final query = await _getQueryDetailsUseCase.execute(QueryDetailsParams(
        accountId: accountId,
        projectId: projectId,
        topicId: topicId,
        queryId: q.id,
      ));

      switch (query.status) {
        case Status.SUCCESS:
          _newQueriesList.add(query.data.first);
          break;
        case Status.FAILURE:
          return AppResult.failure(query.message);
          break;
      }
    }

    return AppResult.success(_newQueriesList);
  }
}
