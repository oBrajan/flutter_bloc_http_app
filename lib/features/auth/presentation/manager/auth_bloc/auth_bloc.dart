import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:easy2know_flutter/core/use_case/usecase.dart';
import 'package:easy2know_flutter/di/injection_container.dart';
import 'package:easy2know_flutter/features/auth/domain/use_cases/get_user.dart';
import 'package:easy2know_flutter/features/auth/domain/use_cases/is_user_logged_in.dart';
import 'package:easy2know_flutter/features/auth/domain/use_cases/logout.dart';
import 'package:meta/meta.dart';
import './auth.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Logout _logout = sl<Logout>();
  final GetUser _getUser = sl<GetUser>();
  final IsUserLoggedIn _isUserLoggedIn = sl<IsUserLoggedIn>();

  @override
  AuthState get initialState => Uninitialized();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is LoggedIn) {
      yield* _mapLoggedInToState();
    } else if (event is LoggedOut) {
      yield* _mapLoggedOutToState();
    }
  }

  Stream<AuthState> _mapAppStartedToState() async* {
    try {
      bool isSignedIn = _isUserLoggedIn.isUserLoggedIn;
      if (isSignedIn) {
        final user = await _getUser(NoParams());
        yield user.fold(
          (error) => Unauthenticated(),
          (user) => Authenticated(
            user.accessToken,
            user.email,
            user.name,
            user.picture,
            user.nickname,
          ),
        );
      } else {
        yield Unauthenticated();
      }
    } catch (_) {
      yield Unauthenticated();
    }
  }

  Stream<AuthState> _mapLoggedInToState() async* {
    final user = await _getUser(NoParams());
    yield user.fold(
      (error) => Unauthenticated(),
      (user) => Authenticated(
        user.accessToken,
        user.email,
        user.name,
        user.picture,
        user.nickname,
      ),
    );
  }

  Stream<AuthState> _mapLoggedOutToState() async* {
    yield Unauthenticated();
    _logout.logout();
  }
}
