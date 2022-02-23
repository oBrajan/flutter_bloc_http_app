import 'package:meta/meta.dart';

@immutable
class LoginState {
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isPassChangeSuccess;
  final bool isLoading;
  final bool isFailure;
  final String message;

  bool get isFormValid => isEmailValid && isPasswordValid;

  LoginState({
    @required this.isEmailValid,
    @required this.isPasswordValid,
    @required this.isSubmitting,
    @required this.isSuccess,
    @required this.isPassChangeSuccess,
    @required this.isLoading,
    @required this.isFailure,
    this.message,
  });

  factory LoginState.empty() {
    return LoginState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: false,
      isSuccess: false,
      isPassChangeSuccess: false,
      isLoading: false,
      isFailure: false,
      message: '',
    );
  }

  factory LoginState.loading() {
    return LoginState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: true,
      isSuccess: false,
      isPassChangeSuccess: false,
      isLoading: true,
      isFailure: false,
      message: '',
    );
  }

  factory LoginState.failure(String message) {
    return LoginState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: false,
      isSuccess: false,
      isPassChangeSuccess: false,
      isLoading: false,
      isFailure: true,
      message: message,
    );
  }

  factory LoginState.success() {
    return LoginState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: false,
      isSuccess: true,
      isPassChangeSuccess: false,
      isLoading: false,
      isFailure: false,
      message: '',
    );
  }

  factory LoginState.passwordChangedSuccess(String message) {
    return LoginState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: false,
      isSuccess: false,
      isPassChangeSuccess: true,
      isLoading: false,
      isFailure: false,
      message: message,
    );
  }

  LoginState update({bool isEmailValid, bool isPasswordValid}) {
    return copyWith(
      isEmailValid: isEmailValid,
      isPasswordValid: isPasswordValid,
      isSubmitting: false,
      isSuccess: false,
      isPassChangeSuccess: false,
      isLoading: false,
      isFailure: false,
      message: '',
    );
  }

  LoginState copyWith({
    bool isEmailValid,
    bool isPasswordValid,
    bool isSubmitEnabled,
    bool isSubmitting,
    bool isSuccess,
    bool isPassChangeSuccess,
    bool isLoading,
    bool isFailure,
    String message,
  }) {
    return LoginState(
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isPassChangeSuccess: isPassChangeSuccess ?? this.isPassChangeSuccess,
      isLoading: isLoading ?? this.isLoading,
      isFailure: isFailure ?? this.isFailure,
      message: message ?? this.message,
    );
  }

  @override
  String toString() {
    return '''LoginState {
      isEmailValid: $isEmailValid,
      isPasswordValid: $isPasswordValid,
      isSubmitting: $isSubmitting,
      isSuccess: $isSuccess,
      isSuccess: $isPassChangeSuccess,
      isFailure: $isFailure,
      isLoading: $isLoading,
      message: $message,
    }''';
  }
}
