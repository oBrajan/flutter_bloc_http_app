import 'package:easy2know_flutter/features/home/domain/entities/account.dart';
import 'package:easy2know_flutter/features/home/domain/entities/project.dart';
import 'package:easy2know_flutter/features/home/domain/entities/topic.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class DashboardState extends Equatable {
  @override
  List<Object> get props => [];
}

class DataLoading extends DashboardState {}

class DataLoaded extends DashboardState {
  final Account account;
  final Project project;
  final List<Topic> topics;

  DataLoaded({
    @required this.account,
    @required this.project,
    @required this.topics,
  });

  @override
  List<Object> get props => [account, project, topics];
}

class DataEmpty extends DashboardState {}
