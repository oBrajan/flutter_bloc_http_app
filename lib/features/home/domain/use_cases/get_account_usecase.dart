import 'package:easy2know_flutter/core/data/app_result.dart';
import 'package:easy2know_flutter/core/use_case/usecase.dart';
import 'package:easy2know_flutter/di/injection_container.dart';
import 'package:easy2know_flutter/features/home/domain/entities/account.dart';
import 'package:easy2know_flutter/features/home/domain/repositories/accounts_repository.dart';

class GetAccountUseCase extends UseCaseData<AppResult, NoParams> {
  final AccountsRepository _repository = sl<AccountsRepository>();

  @override
  Future<AppResult<Account>> execute(NoParams params) async {
   return await _repository.getAccounts();
  }
}
