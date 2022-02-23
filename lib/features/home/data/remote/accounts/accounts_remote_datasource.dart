import 'package:easy2know_flutter/core/data/app_result.dart';
import 'package:easy2know_flutter/core/error/exceptions.dart';
import 'package:easy2know_flutter/di/injection_container.dart';
import 'package:easy2know_flutter/features/home/data/local/accounts_local_datasource.dart';
import 'package:easy2know_flutter/features/home/data/models/accounts/account_data_response.dart';
import 'package:easy2know_flutter/features/home/data/models/accounts/accounts_mapper.dart';
import 'package:easy2know_flutter/features/home/data/models/accounts/accounts_response.dart';
import 'package:easy2know_flutter/features/home/data/remote/accounts/accounts_remote_service.dart';
import 'package:easy2know_flutter/features/home/domain/entities/account.dart';

abstract class AccountsRemoteDataSource {
  Future<AppResult<Account>> getAccounts();
}

class AccountsRemoteDataSourceImpl implements AccountsRemoteDataSource {
  final AccountsRemoteService _service = sl<AccountsRemoteService>();
  final AccountsLocalDataSource _localDataSource =
      sl<AccountsLocalDataSource>();

  @override
  Future<AppResult<Account>> getAccounts() async {
    try {
      final accountsListResponse =
          AccountsResponse.fromJson(await _service.getAccounts());

      final accountDataResponse = AccountResponse.fromJson(
          await _service.getAccount(accountsListResponse.data.first.id));

      _localDataSource.saveAccounts(accountDataResponse);

      return AppResult.success(mapResponseToAccounts(accountDataResponse));
    } on ServerException catch (e) {
      return AppResult.failure(e.message);
    } on NetworkException catch (e) {
      return AppResult.failure(e.message);
    } catch (e) {
      return AppResult.failure(e.toString());
    }
  }
}
