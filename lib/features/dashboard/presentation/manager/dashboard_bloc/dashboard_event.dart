import 'package:easy2know_flutter/features/home/domain/entities/account.dart';
import 'package:easy2know_flutter/features/home/domain/entities/project.dart';
import 'package:easy2know_flutter/features/home/domain/entities/topic.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();
}

class DataUpdated extends DashboardEvent {
  final Account account;
  final Project project;
  final List<Topic> topics;

  DataUpdated({
    @required this.account,
    @required this.project,
    @required this.topics,
  });

  @override
  List<Object> get props => [account, project, topics];
}
