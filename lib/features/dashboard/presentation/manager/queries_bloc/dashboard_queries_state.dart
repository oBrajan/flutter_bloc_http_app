import 'package:easy2know_flutter/features/dashboard/domain/entities/queries/query.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class DashboardQueriesState extends Equatable {
  @override
  List<Object> get props => [];
}

class QueriesDataLoading extends DashboardQueriesState {}

class QueriesDataLoaded extends DashboardQueriesState {
  final List<Query> query;

  QueriesDataLoaded({this.query});

  @override
  List<Object> get props => [query];
}

class QueriesDataEmpty extends DashboardQueriesState {}
