import 'package:easy2know_flutter/core/data/app_result.dart';
import 'package:easy2know_flutter/core/network/network_info.dart';
import 'package:easy2know_flutter/di/injection_container.dart';
import 'package:easy2know_flutter/features/home/data/local/accounts_local_datasource.dart';
import 'package:easy2know_flutter/features/home/data/remote/accounts/accounts_remote_datasource.dart';
import 'package:easy2know_flutter/features/home/domain/entities/account.dart';
import 'package:easy2know_flutter/features/home/domain/repositories/accounts_repository.dart';

class AccountsRepositoryImp implements AccountsRepository {
  final NetworkInfo networkInfo = sl<NetworkInfo>();
  final AccountsRemoteDataSource accountsRemoteDataSource =
      sl<AccountsRemoteDataSource>();
  final AccountsLocalDataSource accountsLocalDataSource =
      sl<AccountsLocalDataSource>();

  @override
  Future<AppResult<Account>> getAccounts() async {
    if (await networkInfo.isConnected) {
      return accountsRemoteDataSource.getAccounts();
    } else {
      return accountsLocalDataSource.getAccounts();
    }
  }
}
