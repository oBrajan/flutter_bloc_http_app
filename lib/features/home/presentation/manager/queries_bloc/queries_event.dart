import 'package:easy2know_flutter/features/home/domain/entities/account.dart';
import 'package:easy2know_flutter/features/home/domain/entities/project.dart';
import 'package:easy2know_flutter/features/home/domain/entities/topic.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class QueriesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetQueries extends QueriesEvent {
  final Account account;
  final Project project;
  final Topic topic;

  GetQueries({
    @required this.account,
    @required this.project,
    @required this.topic,
  });

  @override
  List<Object> get props => [account, project, topic];
}
