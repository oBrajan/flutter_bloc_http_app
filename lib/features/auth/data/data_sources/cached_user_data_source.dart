import 'dart:convert';

import 'package:easy2know_flutter/core/constants/constants.dart';
import 'package:easy2know_flutter/di/injection_container.dart';
import 'package:easy2know_flutter/features/auth/data/models/user_model.dart';
import 'package:easy2know_flutter/features/auth/domain/entities/user.dart';
import 'package:flutter_auth0/flutter_auth0.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CachedUserDataSource {
  Future<UserModel> getUser();

  Future<void> saveUser(UserModel user);

  Future<void> doLogout();
}

const CACHED_USER_DATA = 'CACHED_USER_DATA';

class CachedUserDataSourceImpl implements CachedUserDataSource {
  final SharedPreferences sharedPreferences = sl<SharedPreferences>();
  final Auth0 auth = sl<Auth0>();

  @override
  Future<void> doLogout() {
    return sharedPreferences.setString(CACHED_USER_DATA, null);
  }

  @override
  Future<UserModel> getUser() async {
    final jsonString = sharedPreferences.getString(CACHED_USER_DATA);

    if (jsonString != null) {
      User user = UserModel.fromJson(json.decode(jsonString));

      var response = await auth.webAuth.client.refreshToken({
        'refreshToken': user.refreshToken,
      });

      Constants.accessToken = response['access_token'];

      return Future.value(UserModel.fromJson(json.decode(jsonString)));
    } else {
      return null;
    }
  }

  @override
  Future<void> saveUser(UserModel user) {
    return sharedPreferences.setString(
      CACHED_USER_DATA,
      json.encode(user.toJson()),
    );
  }
}
