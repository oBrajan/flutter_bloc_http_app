import 'package:dartz/dartz.dart';
import 'package:easy2know_flutter/core/error/failure.dart';
import 'package:easy2know_flutter/core/use_case/usecase.dart';
import 'package:easy2know_flutter/di/injection_container.dart';
import 'package:easy2know_flutter/features/auth/domain/entities/user.dart';
import 'package:easy2know_flutter/features/auth/domain/repositories/auth_repository.dart';

class GetUser implements UseCase<User, NoParams> {
  final UserRepository repository = sl<UserRepository>();

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await repository.getUser();
  }
}
