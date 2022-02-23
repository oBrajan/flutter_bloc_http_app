import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class Uninitialized extends AuthState {}

class Unauthenticated extends AuthState {}

class Authenticated extends AuthState {
  final String token;
  final String email;
  final String name;
  final String nickname;
  final String picture;

  const Authenticated(
    this.token,
    this.email,
    this.name,
    this.picture,
    this.nickname,
  );

  @override
  List<Object> get props => [token, email, name, nickname, picture];

  @override
  String toString() =>
      'Authenticated { token: $token, email: $email, name: $name }';
}
