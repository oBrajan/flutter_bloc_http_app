import 'dart:async';
import 'package:easy2know_flutter/core/data/app_result.dart';
import 'package:easy2know_flutter/core/error/failure.dart';
import 'package:easy2know_flutter/core/error/validators.dart';
import 'package:easy2know_flutter/di/injection_container.dart';
import 'package:easy2know_flutter/features/auth/domain/use_cases/login.dart';
import 'package:easy2know_flutter/features/auth/domain/use_cases/reset_password_usecase.dart';
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import './login.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Login _login = sl<Login>();
  final ResetPasswordUseCase _resetPasswordUseCase = sl<ResetPasswordUseCase>();

  @override
  LoginState get initialState => LoginState.empty();

  @override
  Stream<LoginState> transformEvents(
    Stream<LoginEvent> events,
    Stream<LoginState> Function(LoginEvent event) next,
  ) {
    final nonDebounceStream = events.where((event) {
      return (event is! EmailChanged && event is! PasswordChanged);
    });
    final debounceStream = events.where((event) {
      return (event is EmailChanged || event is PasswordChanged);
    }).debounceTime(Duration(milliseconds: 300));
    return super.transformEvents(
      nonDebounceStream.mergeWith([debounceStream]),
      next,
    );
  }

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is EmailChanged) {
      yield* _mapEmailChangedToState(event.email);
    } else if (event is PasswordChanged) {
      yield* _mapPasswordChangedToState(event.password);
    } else if (event is LoginWithCredentialsPressed) {
      yield* _mapLoginWithCredentialsPressedToState(
        email: event.email,
        password: event.password,
      );
    } else if (event is ResetPassword) {
      yield* _mapResetPasswordToState(event.email);
    }
  }

  Stream<LoginState> _mapEmailChangedToState(String email) async* {
    yield state.update(
      isEmailValid: Validators.isValidEmail(email),
    );
  }

  Stream<LoginState> _mapPasswordChangedToState(String password) async* {
    yield state.update(
      isPasswordValid: Validators.isValidPassword(password),
    );
  }

  Stream<LoginState> _mapResetPasswordToState(String email) async* {
    yield LoginState.loading();
    try {
      final response = await _resetPasswordUseCase.execute(email);

      switch (response.status) {
        case Status.SUCCESS:
          yield LoginState.passwordChangedSuccess('Check your email...');
          break;
        case Status.FAILURE:
          yield LoginState.failure(response.message);
          break;
      }
    } catch (e) {
      yield LoginState.failure(e.toString());
    }
  }

  Stream<LoginState> _mapLoginWithCredentialsPressedToState({
    String email,
    String password,
  }) async* {
    yield LoginState.loading();
    try {
      final response = await _login(Params(email: email, password: password));
      yield response.fold(
        (error) {
          if (error is AuthenticationFailure) {
            return LoginState.failure(error.message);
          }

          if (error is ConnectionFailure) {
            return LoginState.failure(error.message);
          }

          return LoginState.failure('Unknown exception');
        },
        (response) => LoginState.success(),
      );
    } catch (e) {
      yield LoginState.failure(e.toString());
    }
  }
}
