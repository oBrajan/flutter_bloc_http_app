import 'package:dartz/dartz.dart';
import 'package:easy2know_flutter/core/error/failure.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class UseCaseData<Type, Params> {
  Future<Type> execute(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
