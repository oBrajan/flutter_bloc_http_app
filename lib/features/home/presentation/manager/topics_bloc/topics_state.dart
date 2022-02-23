import 'package:easy2know_flutter/features/home/domain/entities/account.dart';
import 'package:easy2know_flutter/features/home/domain/entities/project.dart';
import 'package:easy2know_flutter/features/home/domain/entities/topic.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class TopicsState extends Equatable {
  @override
  List<Object> get props => [];
}

class TopicsEmpty extends TopicsState {}

class TopicsLoading extends TopicsState {}

class TopicsLoaded extends TopicsState {
  final Account account;
  final Project project;
  final List<Topic> topics;

  TopicsLoaded({
    @required this.account,
    @required this.project,
    @required this.topics,
  });

  @override
  List<Object> get props => [account, project,topics];
}

class TopicsError extends TopicsState {
  final String message;

  TopicsError({@required this.message});

  @override
  List<Object> get props => [message];
}
