import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:easy2know_flutter/features/home/domain/entities/account.dart';
import 'package:easy2know_flutter/features/home/domain/entities/project.dart';
import 'package:easy2know_flutter/features/home/domain/entities/topic.dart';
import 'package:easy2know_flutter/features/home/presentation/manager/topics_bloc/topics.dart';
import 'package:easy2know_flutter/features/home/presentation/manager/topics_bloc/topics_bloc.dart';
import 'package:meta/meta.dart';
import './dashboard.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final TopicsBloc topicsBloc;
  StreamSubscription topicsSubscription;

  Account _account;
  Project _project;
  List<Topic> _topics;

  DashboardBloc({@required this.topicsBloc}) {
    topicsSubscription = topicsBloc.listen((state) {
      if (state is TopicsLoaded) {
        _account = state.account;
        _project = state.project;
        _topics = state.topics;

        add(DataUpdated(
          account: _account,
          project: _project,
          topics: _topics,
        ));
      }
    });
  }

  @override
  DashboardState get initialState => DataLoading();

  @override
  Stream<DashboardState> mapEventToState(
    DashboardEvent event,
  ) async* {
    if (event is DataUpdated) {
      yield DataLoaded(
        account: event.account,
        project: event.project,
        topics: event.topics,
      );
    }
  }

  @override
  Future<void> close() {
    topicsSubscription.cancel();
    return super.close();
  }
}
