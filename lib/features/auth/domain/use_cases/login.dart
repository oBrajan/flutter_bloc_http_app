import 'package:dartz/dartz.dart';
import 'package:easy2know_flutter/core/error/failure.dart';
import 'package:easy2know_flutter/core/use_case/usecase.dart';
import 'package:easy2know_flutter/di/injection_container.dart';
import 'package:easy2know_flutter/features/auth/domain/entities/user.dart';
import 'package:easy2know_flutter/features/auth/domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Login implements UseCase<User, Params> {
  final UserRepository repository = sl<UserRepository>();
  
  @override
  Future<Either<Failure, User>> call(Params params) async {
    return await repository.login(
      email: params.email,
      password: params.password,
    );
  }
}

class Params extends Equatable {
  final String email;
  final String password;

  Params({
    @required this.email,
    @required this.password,
  });

  @override
  List<Object> get props => [email, password];
}
