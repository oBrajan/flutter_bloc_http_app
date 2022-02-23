import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:easy2know_flutter/core/data/app_result.dart';
import 'package:easy2know_flutter/di/injection_container.dart';
import 'package:easy2know_flutter/features/dashboard/domain/use_cases/dashboard/get_queries_usecase.dart';
import 'package:easy2know_flutter/features/dashboard/presentation/manager/dashboard_bloc/dashboard_bloc.dart';
import 'package:easy2know_flutter/features/dashboard/presentation/manager/dashboard_bloc/dashboard_state.dart';
import 'package:easy2know_flutter/features/home/domain/entities/account.dart';
import 'package:easy2know_flutter/features/home/domain/entities/project.dart';
import 'package:easy2know_flutter/features/home/domain/entities/topic.dart';
import 'package:meta/meta.dart';
import './dashboard_queries.dart';

class DashboardQueriesBloc
    extends Bloc<DashboardQueriesEvent, DashboardQueriesState> {
  final DashboardBloc dashboardBloc;
  StreamSubscription dashboardSubscription;

  GetDashQueriesUseCase _getDashQueriesUseCase = sl<GetDashQueriesUseCase>();

  Account _account;
  Project _project;
  List<Topic> _topics;

  DashboardQueriesBloc({@required this.dashboardBloc}) {
    dashboardSubscription = dashboardBloc.listen((state) {
      if (state is DataLoaded) {
        _account = state.account;
        _project = state.project;
        _topics = state.topics;

        add(QueriesDataUpdated(
          account: _account,
          project: _project,
          topics: _topics,
        ));
      }
    });
  }

  @override
  DashboardQueriesState get initialState => QueriesDataLoading();

  @override
  Stream<DashboardQueriesState> mapEventToState(
    DashboardQueriesEvent event,
  ) async* {
    if (event is QueriesDataUpdated) {
      final queries = await _getDashQueriesUseCase.execute(QueriesParams(
          accountId: _account.id,
          projectId: _project.id,
          topicId: _topics.first.id,
          queryId: '790b342b-a7a7-47d5-a899-96739660dbaa',
          timePeriod: 'total'));

      switch (queries.status) {
        case Status.SUCCESS:
          yield QueriesDataLoaded(query: queries.data);
          break;
        case Status.FAILURE:
          print(queries.message);
          break;
      }
    }
  }

  @override
  Future<void> close() {
    dashboardSubscription.cancel();
    return super.close();
  }
}
