import 'package:dartz/dartz.dart';
import 'package:easy2know_flutter/core/data/app_result.dart';
import 'package:easy2know_flutter/core/error/failure.dart';
import 'package:easy2know_flutter/features/auth/domain/entities/user.dart';
import 'package:meta/meta.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> login({
    @required String email,
    @required String password,
  });

  Future<AppResult<bool>> resetPassword({
    @required String email,
  });

  Future<Either<Failure, User>> getUser();

  Future<Either<void, void>> logout();

  bool isUserLoggedIn();
}
