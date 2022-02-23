import 'package:dartz/dartz.dart';
import 'package:easy2know_flutter/core/data/app_result.dart';
import 'package:easy2know_flutter/core/error/failure.dart';
import 'package:easy2know_flutter/core/network/network_info.dart';
import 'package:easy2know_flutter/di/injection_container.dart';
import 'package:easy2know_flutter/features/auth/data/data_sources/cached_user_data_source.dart';
import 'package:easy2know_flutter/features/auth/data/data_sources/auth0_data_source.dart';
import 'package:easy2know_flutter/features/auth/domain/entities/user.dart';
import 'package:easy2know_flutter/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_auth0/flutter_auth0.dart';

class UserRepositoryImpl implements UserRepository {
  final CachedUserDataSource cachedUserDataSource = sl<CachedUserDataSource>();
  final Auth0DataSource loginDataSource = sl<Auth0DataSource>();
  final NetworkInfo networkInfo = sl<NetworkInfo>();

  @override
  Future<Either<Failure, User>> login({String email, String password}) async {
    if (await networkInfo.isConnected) {
      try {
        final user = await loginDataSource.doLogin(email, password);

        cachedUserDataSource.saveUser(user);
        return Right(user);
      } catch (e) {
        if (e is Auth0Exeption) {
          print(e.description);
          return Left(AuthenticationFailure(e.description));
        } else if (e is ServerFailure) {
          return Left(ServerFailure(e.message));
        }
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  bool isUserLoggedIn() {
    return cachedUserDataSource.getUser() != null;
  }

  @override
  Future<Either<void, void>> logout() {
    return cachedUserDataSource.doLogout();
  }

  @override
  Future<Either<Failure, User>> getUser() async {
    final user = await cachedUserDataSource.getUser();
    return Right(user);
  }

  @override
  Future<AppResult<bool>> resetPassword({String email}) async {
    return loginDataSource.resetPassword(email);
  }
}
