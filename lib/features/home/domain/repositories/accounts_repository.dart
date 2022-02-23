import 'package:easy2know_flutter/core/data/app_result.dart';
import 'package:easy2know_flutter/features/home/domain/entities/account.dart';

abstract class AccountsRepository {
  Future<AppResult<Account>> getAccounts();
}
