import 'package:easy2know_flutter/features/auth/domain/entities/user.dart';
import 'package:meta/meta.dart';

class UserModel extends User {
  UserModel({
    @required String accessToken,
    @required String refreshToken,
    @required String idToken,
    @required String email,
    @required String name,
    @required String nickname,
    @required String picture,
  }) : super(
            accessToken: accessToken,
            refreshToken: refreshToken,
            idToken: idToken,
            email: email,
            name: name,
            nickname: nickname,
            picture: picture);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      idToken: json['idToken'],
      email: json['email'],
      name: json['name'],
      nickname: json['nickname'],
      picture: json['picture'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'idToken': idToken,
      'email': email,
      'name': name,
      'nickname': nickname,
      'picture': picture,
    };
  }
}
