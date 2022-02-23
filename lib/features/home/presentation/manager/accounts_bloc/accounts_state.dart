import 'package:easy2know_flutter/features/home/domain/entities/account.dart';
import 'package:easy2know_flutter/features/home/domain/entities/project.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class AccountsState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends AccountsState {}

class Loading extends AccountsState {}

class Loaded extends AccountsState {
  final Account account;
  final List<Project> projects;

  Loaded({@required this.account, @required this.projects});

  @override
  List<Object> get props => [account, projects];
}

class Error extends AccountsState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}
