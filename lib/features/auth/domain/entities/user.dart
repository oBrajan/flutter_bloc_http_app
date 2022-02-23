import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class User extends Equatable {
  final String accessToken;
  final String refreshToken;
  final String idToken;
  final String email;
  final String name;
  final String nickname;
  final String picture;

  User({
    @required this.accessToken,
    @required this.refreshToken,
    @required this.idToken,
    @required this.email,
    @required this.name,
    @required this.nickname,
    @required this.picture,
  });

  @override
  List<Object> get props => [
        accessToken,
        refreshToken,
        idToken,
        email,
        name,
        nickname,
        picture,
      ];
}
