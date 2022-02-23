import 'package:easy2know_flutter/features/home/domain/entities/account.dart';
import 'package:easy2know_flutter/features/home/domain/entities/project.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class ProjectsState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProjectsEmpty extends ProjectsState {}

class ProjectsLoading extends ProjectsState {}

class ProjectsLoaded extends ProjectsState {
  final Account account;
  final List<Project> projects;

  ProjectsLoaded({@required this.account, @required this.projects});

  @override
  List<Object> get props => [account, projects];
}

class ProjectsError extends ProjectsState {
  final String message;

  ProjectsError({@required this.message});

  @override
  List<Object> get props => [message];
}
