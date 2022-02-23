import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:easy2know_flutter/di/injection_container.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final DataConnectionChecker connectionChecker = sl<DataConnectionChecker>();

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
