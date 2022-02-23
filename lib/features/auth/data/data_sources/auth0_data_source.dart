import 'package:easy2know_flutter/core/constants/constants.dart';
import 'package:easy2know_flutter/core/data/app_result.dart';
import 'package:easy2know_flutter/core/error/exceptions.dart';
import 'package:easy2know_flutter/di/injection_container.dart';
import 'package:easy2know_flutter/features/auth/data/models/user_model.dart';
import 'package:flutter_auth0/flutter_auth0.dart';

abstract class Auth0DataSource {
  Future<UserModel> doLogin(String email, String password);

  Future<AppResult<bool>> resetPassword(String email);
}

class Auth0DataSourceImpl implements Auth0DataSource {
  final Auth0 auth = sl<Auth0>();

  @override
  Future<UserModel> doLogin(String email, String password) async {
    try {
      var response = await auth.auth.passwordRealm({
        'username': email,
        'password': password,
        'realm': 'Username-Password-Authentication',
        'audience': 'dev-autobahn.easy2know.co',
        'scope': 'openid email offline_access',
      });

      Auth0Auth authClient = Auth0Auth(
          auth.auth.clientId, auth.auth.client.baseUrl,
          bearer: response['access_token']);
      var info = await authClient.getUserInfo();

      return UserModel(
        accessToken: response['access_token'],
        refreshToken: response['refresh_token'],
        idToken: response['id_token'],
        email: info['email'],
        name: info['name'],
        nickname: info['nickname'],
        picture: info['picture'],
      );
    } catch (e) {
      var error = e.toString().split(': ');
      throw Auth0Exeption(name: error[0], description: error[1]);
    }
  }

  @override
  Future<AppResult<bool>> resetPassword(String email) async {
    try {
      final response = await auth.auth.resetPassword(
          {'email': email, 'connection': 'Username-Password-Authentication'});
      if (response) {
        return AppResult.success(null);
      } else {
        return AppResult.failure('');
      }
    } on ServerException catch (e) {
      return AppResult.failure(e.message);
    } on NetworkException catch (e) {
      return AppResult.failure(e.message);
    } catch (e) {
      return AppResult.failure(e.toString());
    }
  }
}
