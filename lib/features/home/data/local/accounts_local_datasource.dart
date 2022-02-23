import 'dart:convert';

import 'package:easy2know_flutter/core/data/app_result.dart';
import 'package:easy2know_flutter/features/home/data/models/accounts/account_data_response.dart';
import 'package:easy2know_flutter/features/home/data/models/accounts/accounts_mapper.dart';
import 'package:easy2know_flutter/features/home/domain/entities/account.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy2know_flutter/di/injection_container.dart';

abstract class AccountsLocalDataSource {
  Future<AppResult<Account>> getAccounts();

  void saveAccounts(AccountResponse accounts);
}

const CACHED_ACCOUNTS_DATA = 'CACHED_ACCOUNTS_DATA';

class AccountsLocalDataSourceImpl implements AccountsLocalDataSource {
  static final SharedPreferences _sharedPreferences = sl<SharedPreferences>();

  @override
  Future<AppResult<Account>> getAccounts() async {
    final jsonString = _sharedPreferences.getString(CACHED_ACCOUNTS_DATA);

    if (jsonString != null) {
      final result = mapResponseToAccounts(
          AccountResponse.fromJson(await json.decode(jsonString)));
      return AppResult.success(result);
    } else {
      return AppResult.failure('No data...');
    }
  }

  @override
  void saveAccounts(AccountResponse accounts) {
    _sharedPreferences.setString(
      CACHED_ACCOUNTS_DATA,
      json.encode(accounts.toJson()),
    );
  }
}
