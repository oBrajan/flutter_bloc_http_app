import 'package:easy2know_flutter/core/data/app_result.dart';
import 'package:easy2know_flutter/core/use_case/usecase.dart';
import 'package:easy2know_flutter/di/injection_container.dart';
import 'package:easy2know_flutter/features/auth/domain/repositories/auth_repository.dart';

class ResetPasswordUseCase implements UseCaseData<AppResult, String> {
  final UserRepository repository = sl<UserRepository>();

  @override
  Future<AppResult<bool>> execute(String email) async{
    final response = await repository.resetPassword(email: email);

    switch (response.status) {
      case Status.SUCCESS:
        return AppResult.success(response.data);
        break;
      case Status.FAILURE:
        return AppResult.failure(response.message);
        break;
      default:
        return AppResult.failure(response.message);
    }
  }
}
