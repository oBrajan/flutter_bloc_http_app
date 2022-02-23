import 'package:easy2know_flutter/features/home/domain/entities/account.dart';
import 'package:easy2know_flutter/features/home/domain/entities/project.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class TopicsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetTopics extends TopicsEvent {
  final Account account;
  final Project project;

  GetTopics({@required this.account, @required this.project});

  @override
  List<Object> get props => [account, project];
}
