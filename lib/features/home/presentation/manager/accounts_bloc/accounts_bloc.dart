import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:easy2know_flutter/core/data/app_result.dart';
import 'package:easy2know_flutter/core/use_case/usecase.dart';
import 'package:easy2know_flutter/di/injection_container.dart';
import 'package:easy2know_flutter/features/home/domain/use_cases/get_account_usecase.dart';
import 'package:easy2know_flutter/features/home/domain/use_cases/get_project_usecase.dart';
import 'package:easy2know_flutter/features/home/domain/use_cases/get_projects_usecase.dart';
import 'package:easy2know_flutter/features/home/presentation/manager/accounts_bloc/accounts.dart';

class AccountsBloc extends Bloc<AccountsEvent, AccountsState> {
  final GetAccountUseCase _getAccounts = sl<GetAccountUseCase>();
  final GetProjectsUseCase _getProjectsUseCase = sl<GetProjectsUseCase>();
  final GetProjectUseCase _getProjectUseCase = sl<GetProjectUseCase>();

  @override
  AccountsState get initialState => Empty();

  @override
  Stream<AccountsState> mapEventToState(
    AccountsEvent event,
  ) async* {
    if (event is GetAccountsData) {
      yield Loading();
      final accounts = await _getAccounts.execute(NoParams());

      final projects = await _getProjectsUseCase
          .execute(ProjectsParams(accountId: accounts.data.first.id));

      final project = await _getProjectUseCase.execute(ProjectParams(
          accountId: accounts.data.first.id,
          projectId: projects.data.first.id));

      print(project);
      print(projects);

      switch (projects.status) {
        case Status.SUCCESS:
          yield Loaded(account: accounts.data.first, projects: projects.data);
          break;
        case Status.FAILURE:
          yield Error(message: projects.message);
          break;
      }
    }
  }
}
