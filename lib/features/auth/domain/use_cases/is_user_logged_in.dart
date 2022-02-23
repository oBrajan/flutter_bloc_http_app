import 'package:easy2know_flutter/di/injection_container.dart';
import 'package:easy2know_flutter/features/auth/domain/repositories/auth_repository.dart';

class IsUserLoggedIn {
  final UserRepository repository = sl<UserRepository>();

  bool get isUserLoggedIn {
    return repository.isUserLoggedIn();
  }
}
