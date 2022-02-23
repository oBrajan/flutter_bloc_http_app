import 'package:easy2know_flutter/features/home/domain/entities/account.dart';
import 'package:easy2know_flutter/features/home/domain/entities/project.dart';
import 'package:easy2know_flutter/features/home/domain/entities/query.dart';
import 'package:easy2know_flutter/features/home/domain/entities/topic.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class QueriesState extends Equatable {
  @override
  List<Object> get props => [];
}

class QueriesEmpty extends QueriesState {}

class QueriesLoading extends QueriesState {}

class QueriesLoaded extends QueriesState {
  final Account account;
  final Project project;
  final Topic topic;
  final List<Query> queries;

  QueriesLoaded({
    @required this.account,
    @required this.project,
    @required this.topic,
    @required this.queries,
  });

  @override
  List<Object> get props => [account, project, topic, queries];
}

class QueriesError extends QueriesState {
  final String message;

  QueriesError({@required this.message});

  @override
  List<Object> get props => [message];
}
