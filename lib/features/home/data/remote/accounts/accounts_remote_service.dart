import 'package:easy2know_flutter/core/constants/constants.dart';
import 'package:easy2know_flutter/core/network/http_manager.dart';
import 'package:easy2know_flutter/di/injection_container.dart';

abstract class AccountsRemoteService {
  Future<dynamic> getAccounts();

  Future<dynamic> getAccount(String accountId);
}

class AccountsRemoteServiceImpl implements AccountsRemoteService {
  final HttpManager _httpManager = sl<HttpManager>();

  @override
  Future getAccounts() async {
    return await _httpManager.get(url: '/accounts', headers: Constants.header);
  }

  @override
  Future getAccount(String accountId) async {
    return await _httpManager.get(
        url: '/accounts/$accountId', headers: Constants.header);
  }
}
